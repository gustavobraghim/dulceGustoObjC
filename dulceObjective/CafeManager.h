//
//  CafeManager.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 28/09/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cafe.h"
#import "Capsula.h"

@interface CafeManager : NSObject
@property(nonatomic, strong) NSDictionary *dict;

-(void) insertCafe: (NSString *) cafeName;


@end


