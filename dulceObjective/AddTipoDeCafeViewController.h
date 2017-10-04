//
//  AddTipoDeCafeViewController.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 04/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CafeDelegate <NSObject>
-(void)sendTextToViewController:(NSString *)string; //trlcar o nome pra um mais adequado
@end

@interface AddTipoDeCafeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *tipoCafeText;
@property (nonatomic, weak) id <CafeDelegate>delegate;
@end
