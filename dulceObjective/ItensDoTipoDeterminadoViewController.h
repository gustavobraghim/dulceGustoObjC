//
//  ItensDoTipoDeterminadoViewController.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 03/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItensDoTipoDeterminadoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UILabel *cafeLabel;
@property (nonatomic, strong) NSString *cafeName;
@end
