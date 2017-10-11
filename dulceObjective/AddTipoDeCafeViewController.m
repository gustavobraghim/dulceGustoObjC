////
////  AddTipoDeCafeViewController.m
////  dulceObjective
////
////  Created by Gustavo Braghim on 04/10/17.
////  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
////
#import "sqlite3.h"
#import "FMDatabase.h"
#import "AddTipoDeCafeViewController.h"
#import "TiposDeCafeTableViewController.h"
#import "Cafe.h"

@interface AddTipoDeCafeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameCafeText;
@property (strong, nonatomic) IBOutlet UITextField *tracosCafe;
@property (strong, nonatomic) Cafe *cafe;
@end

@implementation AddTipoDeCafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cafe = [[Cafe alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)addCafe:(id)sender {
    self.cafe.name = self.nameCafeText.text;
    self.cafe.tracos = [self.tracosCafe.text integerValue];
    self.cafe.numeroCapsulas = 5;
    [self.delegate sendCafeToViewController:self.cafe];
    self.nameCafeText.text = @"";
    self.tracosCafe.text=@"";
   // [self.dbInstance insertingData:self.cafe];
}


@end
