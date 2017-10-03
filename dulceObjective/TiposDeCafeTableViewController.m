//
//  TiposDeCafeTableViewController.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 03/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "TiposDeCafeTableViewController.h"
#import "CelulaTableViewCell.h"

@interface TiposDeCafeTableViewController ()

@end

@implementation TiposDeCafeTableViewController

@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cafes = [@[@"Expresso", @"Especial"] mutableCopy];
    //cafes = [NSArray arrayWithObjects:@"Expresso",@"Especial", nil];

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
    cell.titleLabel.text = [self.cafes objectAtIndex:indexPath.row];
    return cell;
}
@end
