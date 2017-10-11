//
//  TiposDeCafeTableViewController.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 03/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTipoDeCafeViewController.h"
#import "sqlite3.h"
#import "FMDatabase.h"
#import "DBManager.h"
@class Cafe;


@interface TiposDeCafeTableViewController : UIViewController <UITableViewDataSource, UITableViewDataSource, CafeDelegate>

@property(strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) NSMutableArray<Cafe *> *cafes;
@property(strong, nonatomic) DBManager *dbInstance;
@property(strong, nonatomic) Cafe *cafezinho;

@end
