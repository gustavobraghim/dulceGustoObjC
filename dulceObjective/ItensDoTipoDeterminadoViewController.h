//
//  ItensDoTipoDeterminadoViewController.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 03/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
#import <UIKit/UIKit.h>
#import "Cafe.h"

@interface ItensDoTipoDeterminadoViewController : UIViewController

@property(strong, nonatomic) Cafe *cafe;

@property (nonatomic, strong) IBOutlet UILabel *cafeLabel;
@property (nonatomic, strong) NSString *cafeName;

@property (strong, nonatomic) IBOutlet UILabel *labelExibeQuantidade;
@property (nonatomic, strong) NSString *cafeQuantidade;

@end