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
#import "CafeManager.h"
@interface CafeManager : NSObject
@property(nonatomic, strong) NSMutableDictionary *dict;
@property(nonatomic, strong) NSMutableArray *cafes;
@property(nonatomic, strong) NSMutableArray* capsulaArray;


-(void) insertCafe: (NSString *) cafeName;
-(void) removeCafe: (NSString *) cafeName;
//-(NSMutableDictionary *)getCafes: (NSMutableDictionary *) dict;

-(void) insertCapsula: (NSString *) tipoDeCafe capsula:(Capsula *) capsula;
-(void) removeCapsula: (NSString *) tipoDeCafe capsula:(Capsula *) capsula;
//-(Capsula *) getCapsula: (NSString *) tipoDeCafe;

@end


