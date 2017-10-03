//
//  Capsula.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 28/09/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//
#import "Cafe.h"
#import <Foundation/Foundation.h>

@interface Capsula : NSObject
@property(nonatomic, strong) NSMutableArray* capsulaArray;

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* des;
@property(nonatomic, strong) UIImage* image;
@property int tracos;

- (void)initWithName:(NSString *)name Descricao:(NSString *)des Imagem:(UIImage *)image Tracos:(int)tracos;
@end
