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

- (void)insertCafe:(NSString *)cafeName {
    [self.cafes addObject: cafeName];
}

- (void)removeCafe:(NSString *)cafeName {
    [self.cafes removeObject:cafeName];
}

//-(NSMutableDictionary *)getCafes: (NSMutableDictionary *) dict{
//
//}

- (void)insertCapsula:(NSString *)tipoDeCafe capsula:(NSMutableArray *)capsula {
    //self.dict[tipoDeCafe] = capsula;
    [self.capsulaArray addObject:capsula];
}

- (void)removeCapsula:(NSString *)tipoDeCafe capsula:(Capsula *)capsula {
    [self.capsulaArray removeObject:capsula];
}

//-(Capsula *) getCapsula: (NSString *) tipoDeCafe{
//    
//}
@end
