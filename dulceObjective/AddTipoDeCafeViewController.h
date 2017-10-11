//
//  AddTipoDeCafeViewController.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 04/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import "FMDatabase.h"
#import "Cafe.h"
#import "DBManager.h"

@protocol CafeDelegate <NSObject>
-(void)sendCafeToViewController:(Cafe *)cafe;
@end

@interface AddTipoDeCafeViewController : UIViewController

@property (nonatomic, weak) id <CafeDelegate>delegate;
@property(strong, nonatomic) DBManager *dbInstance;

@end
