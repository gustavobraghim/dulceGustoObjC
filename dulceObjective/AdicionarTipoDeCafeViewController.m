//
//  AdicionarTipoDeCafeViewController.m
//  dulceObjective
//
//  Created by Gustavo do Carmo Braghim on 10/2/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "AdicionarTipoDeCafeViewController.h"
#import "CafeManager.h"
@interface AdicionarTipoDeCafeViewController ()
- (IBAction)addTipoCafeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *inserirTipoCafeTxt;
@property(nonatomic, strong) NSMutableArray *cafes;
@end

@implementation AdicionarTipoDeCafeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)addTipoCafeButton:(id)sender {
    if (self.inserirTipoCafeTxt.text == @"") {
    }
    
    [self.cafes addObject:self.inserirTipoCafeTxt.text];
    _inserirTipoCafeTxt.text =@"";
    }
@end
