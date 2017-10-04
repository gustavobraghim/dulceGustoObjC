//
//  AddNewCapsulaViewController.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 04/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "Capsula.h"

@protocol CapsulaDelegate <NSObject>
-(void)sendCapsulaToViewController:(Capsula *)capsula;
@end

@interface AddNewCapsulaViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, weak) id <CapsulaDelegate>delegate;

@property (strong, nonatomic) IBOutlet UITextField *nomeDaCapsulaText;
@property (strong, nonatomic) IBOutlet UITextField *numeroDeTracosText;
@property (strong, nonatomic) IBOutlet UITextView *descricaoText;
- (IBAction)selecionarImagem:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imagemExibicao;

@property(strong, nonatomic) UIImage *chosenImage;
@property(strong, nonatomic) UIImagePickerController *imageController;

@property(strong, nonatomic) Capsula *capsula;

@end
