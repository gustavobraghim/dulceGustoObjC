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

@interface TiposDeCafeTableViewController ()
@end

@implementation TiposDeCafeTableViewController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    Cafe *expresso = [[Cafe alloc] init];
    [expresso setName:@"Expresso"];
    [expresso setTracos:3];
    
    Cafe *especial = [[Cafe alloc] init];
    [especial setName:@"Especial"];
    [especial setTracos:2];
    
    self.cafes = [NSMutableArray arrayWithObjects:especial,expresso, nil];
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.cafes removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

-(void)sendTextToViewController:(NSString *)string{
    [self.cafes addObject:string];
    [self.tableView reloadData];
}
@end

