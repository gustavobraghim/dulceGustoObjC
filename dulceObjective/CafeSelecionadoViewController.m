//
//  ItensDoTipoDeterminadoViewController.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 03/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "CafeSelecionadoViewController.h"
#import "TimerVC.h"
#import "CafeSelecionadoPresenter.h"
@interface CafeSelecionadoViewController ()
@property (strong, nonatomic) CafeSelecionadoPresenter *cafeSelecionadoPresenter;
@end

@implementation CafeSelecionadoViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.cafeLabel.text = self.cafeName;
	
	self.cafeQuantidade = [NSString stringWithFormat:@"%ld",self.cafe.numeroCapsulas];
	self.labelExibeQuantidade.text = self.cafeQuantidade;
	
	self.cafeTracos = [NSString stringWithFormat:@"%ld",self.cafe.tracos];
	self.cafeExibeTracos.text = self.cafeTracos;
	
	self.tracos = self.cafe.tracos;
}

- (IBAction)addCapsula:(id)sender {
	self.cafe.numeroCapsulas = self.cafe.numeroCapsulas+1;
	
	self.cafeQuantidade = [NSString stringWithFormat:@"%ld",self.cafe.numeroCapsulas];
	self.labelExibeQuantidade.text = self.cafeQuantidade;
}

- (IBAction)removeCapsula:(id)sender {
	if (self.cafe.numeroCapsulas != 0){
		self.cafe.numeroCapsulas = self.cafe.numeroCapsulas-1;
		
		self.cafeQuantidade = [NSString stringWithFormat:@"%ld",self.cafe.numeroCapsulas];
		self.labelExibeQuantidade.text = self.cafeQuantidade;
	}
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if([segue.identifier isEqualToString:@"timer"]){
		TimerVC *destViewController = segue.destinationViewController;
		destViewController.cafeTracos = self.cafe.tracos;
	}
}


@end

