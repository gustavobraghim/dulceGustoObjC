//
//  AddTipoDeCafePresenter.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 25/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "AddTipoDeCafePresenter.h"
#import "Cafe.h"
#import "AddTipoDeCafeViewController.h"

@interface AddTipoDeCafePresenter ()
@property (strong, nonatomic) Cafe *cafe;
@end

@implementation AddTipoDeCafePresenter

-(void)buttonPressed{
	Cafe *cafe = [[Cafe alloc] init];
	cafe.name = self.addTipoDeCafeViewController.getName;
	cafe.tracos = self.addTipoDeCafeViewController.getTracos;
	cafe.numeroCapsulas = 5;
	[self.addTipoDeCafeViewController.delegate sendCafeToViewController:cafe];
	[self.addTipoDeCafeViewController setFieldsAfterAdding];
}
@end
