//
//  ViewController.m
//  dulceObjective
//
//  Created by Gustavo do Carmo Braghim on 9/27/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Cafe *instanceOfCafe =[[Cafe alloc] init];
    Capsula *instanceOfCapsula =[[Capsula alloc] init];
    CafeManager *instanceOfCafeManager= [[CafeManager alloc] init];
    
    //tenho que fazer o release de todas elas? Tenho que criar o método dealloc pra cada uma nos respectivos .m?
}


@end
