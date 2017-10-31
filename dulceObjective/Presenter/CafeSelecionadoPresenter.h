//
//  CafeSelecionadoPresenter.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 25/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "ViewController.h"
#import "CafeSelecionadoViewController.h"
@interface CafeSelecionadoPresenter : NSObject
@property (weak, nonatomic) CafeSelecionadoViewController *cafeSelecionadoViewController;
-(void)addButtonWasTapped;
-(void)removeButtonWasTapped;
@end
