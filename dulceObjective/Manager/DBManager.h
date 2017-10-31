//
//  DBManager.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 10/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Cafe;
@interface DBManager : NSObject
-(void) createTable;
-(NSMutableArray<Cafe *> *) retrieveCafe;
-(void) insertingData: (Cafe*) cafe;
-(void)deleteCafe: (Cafe*) cafe;

@end
