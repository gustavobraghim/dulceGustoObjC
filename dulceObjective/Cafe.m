//
//  Cafe.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 28/09/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "Cafe.h"
#import <UIKit/UIKit.h>

@implementation Cafe
- (void)initWithName:(NSString *)name Descricao:(NSString *)des Imagem:(UIImage *)image Tracos:(int)tracos{
    self.name = name;
    self.des = des;
    self.image = image;
    self.tracos = tracos;
}
@end

