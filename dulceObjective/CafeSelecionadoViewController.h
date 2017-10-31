//
//  ItensDoTipoDeterminadoViewController.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 03/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
#import <UIKit/UIKit.h>
#import "Cafe.h"

@interface CafeSelecionadoViewController : UIViewController

@property(strong, nonatomic) Cafe *cafe;

@property (nonatomic, strong) IBOutlet UILabel *cafeLabel;
@property (nonatomic, strong) NSString *cafeName;

@property (strong, nonatomic) IBOutlet UILabel *cafeExibeTracos;
@property (nonatomic, strong) NSString *cafeTracos;

@property (strong, nonatomic) IBOutlet UILabel *labelExibeQuantidade;
@property (nonatomic, strong) NSString *cafeQuantidade;

@property (assign, nonatomic) NSInteger tracos;

@end
