//
//  TimerVC.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 20/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface TimerVC : ViewController {
	
}
@property(strong, nonatomic) Cafe *cafe;
@property (strong, nonatomic) IBOutlet UILabel *tempoAtual;
@property (strong, nonatomic) IBOutlet UILabel *tempoTotal;
@property (assign, nonatomic) NSInteger cafeTracos;
@property (strong, nonatomic) IBOutlet UILabel *cafeExibeTracos;


- (IBAction)startTimer:(id)sender;
@end
