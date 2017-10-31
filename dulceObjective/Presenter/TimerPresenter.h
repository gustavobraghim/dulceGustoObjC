//
//  TimerPresenter.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 25/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "ViewController.h"
#import "TimerVC.h"

@interface TimerPresenter : NSObject
@property(weak, nonatomic) TimerVC *timerVC;
-(void)startingView;
-(void)startingTimer;
-(void)Counter;
-(NSString *)returningTracos;
-(NSString *)returningTempo;
-(void)buttonTapped;
@end
