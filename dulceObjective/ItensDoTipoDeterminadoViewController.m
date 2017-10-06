//
//  ItensDoTipoDeterminadoViewController.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 03/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "ItensDoTipoDeterminadoViewController.h"

@interface ItensDoTipoDeterminadoViewController ()
@end

@implementation ItensDoTipoDeterminadoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cafeQuantidade = [NSString stringWithFormat:@"%ld",self.cafe.numberCapsulas];
    self.cafeLabel.text = self.cafeName;
    self.labelExibeQuantidade.text = self.cafeQuantidade;
}

- (IBAction)addCapsula:(id)sender {
    self.cafe.numberCapsulas = self.cafe.numberCapsulas+1;
    
    self.cafeQuantidade = [NSString stringWithFormat:@"%ld",self.cafe.numberCapsulas];
    self.labelExibeQuantidade.text = self.cafeQuantidade;
}

- (IBAction)removeCapsula:(id)sender {
    if (self.cafe.numberCapsulas != 0){
        self.cafe.numberCapsulas = self.cafe.numberCapsulas-1;
        
        self.cafeQuantidade = [NSString stringWithFormat:@"%ld",self.cafe.numberCapsulas];
        self.labelExibeQuantidade.text = self.cafeQuantidade;
    }
}

@end

