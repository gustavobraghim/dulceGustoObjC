//
//  AddTipoDeCafeViewController.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 04/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "AddTipoDeCafeViewController.h"
#import "TiposDeCafeTableViewController.h"


@interface AddTipoDeCafeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@end

@implementation AddTipoDeCafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)addCafe:(id)sender {
    [self.delegate sendTextToViewController:self.inputTextField.text];
    self.inputTextField.text = @"";
}

@end
