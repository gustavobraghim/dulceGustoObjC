//
//  TiposDeCafeTableViewController.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 03/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "TiposDeCafeTableViewController.h"
#import "CelulaTableViewCell.h"
#import "ItensDoTipoDeterminadoViewController.h"
#import "sqlite3.h"
#import "FMDatabase.h"
#import "DBManager.h"

@interface TiposDeCafeTableViewController ()
@end

@implementation TiposDeCafeTableViewController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dbInstance = [[DBManager alloc] init];
    self.cafes = [self.dbInstance retrieveCafe];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cafes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CafeCell";
    CelulaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.titleLabel.text = [self.cafes objectAtIndex:indexPath.row].name;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showTipoDetalhe"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ItensDoTipoDeterminadoViewController *destViewController = segue.destinationViewController;
        destViewController.cafe = [self.cafes objectAtIndex:indexPath.row];
    }
    
    else if ([segue.identifier isEqualToString:@"addCoffeSegue"]){
        AddTipoDeCafeViewController *tipoDeCafe = segue.destinationViewController;
        tipoDeCafe.delegate = self;
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Cafe* cafezinho = [self.cafes objectAtIndex:indexPath.row];
        [self.dbInstance deleteCafe: cafezinho];
        
        [self.cafes removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

-(void)sendCafeToViewController:(Cafe *)cafe{
    [self.cafes addObject:cafe];
    [self.dbInstance insertingData:cafe];
    [self.tableView reloadData];
}
@end