//
//  Cafe.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 28/09/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Cafe : NSObject

@property NSString* name;
@property NSString* des;
@property UIImage* image;
@property int tracos;

- (void)initWithName:(NSString *)name Descricao:(NSString *)des Imagem:(UIImage *)image Tracos:(int)tracos;

@end
