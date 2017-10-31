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
#import "AddTipoDeCafePresenter.h"

@interface AddTipoDeCafeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameCafeText;
@property (strong, nonatomic) IBOutlet UITextField *tracosCafe;
@property (strong, nonatomic) Cafe *cafe;
@property (strong, nonatomic) AddTipoDeCafePresenter *tipoDeCafePresenter;
@end

@implementation AddTipoDeCafeViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	self.cafe = [[Cafe alloc] init];
	self.tipoDeCafePresenter = [[AddTipoDeCafePresenter alloc] init];
	self.tipoDeCafePresenter.addTipoDeCafeViewController = self;
}

-(NSString *)getName{
	NSString *cafeName = self.nameCafeText.text;
	return  cafeName;
}

-(NSInteger)getTracos{
	NSInteger cafeTracos = [self.tracosCafe.text intValue];
	return cafeTracos;
}

-(void)setFieldsAfterAdding{
	self.nameCafeText.text = @"";
	self.tracosCafe.text=@"";
}

- (IBAction)addCafe:(id)sender {
	[self.tipoDeCafePresenter buttonPressed];
}
@end

