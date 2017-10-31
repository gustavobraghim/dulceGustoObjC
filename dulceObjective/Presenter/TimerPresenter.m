//
//  TimerPresenter.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 25/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "TimerPresenter.h"
#import "Cafe.h"
#import "TimerVC.h"

@interface TimerPresenter ()
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger countint;
@property (assign, nonatomic) SystemSoundID soundID;
@property (assign, nonatomic) NSInteger cafeTracos;
@end

@implementation TimerPresenter
-(void)startingView{
	self.countint = (3 + (self.timerVC.cafeTracos * 3));
}

-(NSString *)returningTracos{
	NSString *inStr = [NSString stringWithFormat:@"%ld", (long)self.timerVC.cafeTracos];
	return inStr;
}

-(NSString *)returningTempo{
	NSString *tempo = [NSString stringWithFormat:@"%ld", (long)self.countint];
	return tempo;
}

-(void)startingTimer{
	self.countint = (3 + (self.timerVC.cafeTracos * 3));
	NSString *tempo = [NSString stringWithFormat:@"%ld", (long)self.countint];
	self.timerVC.tempoTotal.text = tempo;
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sound2" ofType:@"wav"];
	NSURL *soundFileURL = [NSURL fileURLWithPath:filePath];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundFileURL, &_soundID);
	self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Counter) userInfo:nil repeats:YES];
}

-(void)Counter{
	self.countint-=1;
	self.timerVC.tempoAtual.text = [NSString stringWithFormat:@"%ld", (long)self.countint];
	if (self.countint == 0) {
		AudioServicesPlaySystemSound(_soundID);
		[self.timer invalidate];
	}
}

-(void)buttonTapped{
	[self startingView];
	[self startingTimer];
}
@end
