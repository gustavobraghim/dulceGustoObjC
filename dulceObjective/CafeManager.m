//
//  CafeManager.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 28/09/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "CafeManager.h"
#import "Cafe.h"
#import "Capsula.h"


@implementation CafeManager
Cafe *sharedInstance = CafeManager;

//private cafes = [String:Cafe]()
-(void) insertCafe: (NSString *) cafeName{
    dict[cafeName] = Cafe();
    
}

@end
