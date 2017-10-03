//
//  TiposDeCafeTableViewController.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 03/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiposDeCafeTableViewController : UIViewController <UITableViewDataSource, UITableViewDataSource>

@property(strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) NSArray *cafes;

@end
