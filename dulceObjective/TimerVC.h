//
//  TimerVC.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 20/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface TimerVC : ViewController{
	NSTimer *timer;
	int countint;
	SystemSoundID SoundID;
}
@property (strong, nonatomic) IBOutlet UILabel *tempoAtual;
@property (strong, nonatomic) IBOutlet UILabel *tempoTotal;
- (IBAction)startTimer:(id)sender;
@end
