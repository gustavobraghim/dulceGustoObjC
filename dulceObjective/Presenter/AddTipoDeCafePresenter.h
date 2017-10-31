//
//  AddTipoDeCafePresenter.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 25/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "ViewController.h"
#import "AddTipoDeCafeViewController.h"

@interface AddTipoDeCafePresenter : NSObject
-(void) buttonPressed;
@property (weak, nonatomic) AddTipoDeCafeViewController *addTipoDeCafeViewController;
@end
