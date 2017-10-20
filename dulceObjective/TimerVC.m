//
//  TimerVC.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 20/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "TimerVC.h"

@interface TimerVC ()


@end

@implementation TimerVC
- (IBAction)startTimer:(id)sender {
	countint = 10; //SUPONHO QUE TEM 10 SEGUNDOS DE PREPARACAO
	self.tempoAtual.text = [NSString stringWithFormat:@"%i", countint];
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Counter) userInfo:nil repeats:YES];
}

-(void)Counter{
	countint-=1;
	self.tempoAtual.text = [NSString stringWithFormat:@"%i", countint];
	if (countint == 0) {
		[timer invalidate];
	}
	
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
