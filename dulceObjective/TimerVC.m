//
//  TimerVC.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 20/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "TimerVC.h"
#import "TimerPresenter.h"
@interface TimerVC ()
@property (strong, nonatomic) TimerPresenter *timerPresenter;
@end

@implementation TimerVC
- (void)viewDidLoad {
	[super viewDidLoad];
	self.cafe = [[Cafe alloc] init];
	self.timerPresenter = [[TimerPresenter alloc] init];
	self.timerPresenter.timerVC = self;
	self.cafeExibeTracos.text = [NSString stringWithFormat:@"%ld", (long)self.cafeTracos];
	self.tempoTotal.text = self.timerPresenter.returningTempo;
	self.tempoAtual.text = self.tempoTotal.text;
}

- (IBAction)startTimer:(id)sender {
	[self.timerPresenter buttonTapped];
}
@end
