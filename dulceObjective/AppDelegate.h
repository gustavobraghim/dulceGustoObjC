//
//  AppDelegate.h
//  dulceObjective
//
//  Created by Gustavo do Carmo Braghim on 9/27/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString* databaseName;
@property (strong, nonatomic) NSString* databasePath;
@property (strong, nonatomic) DBManager* dbInstance;

@end

