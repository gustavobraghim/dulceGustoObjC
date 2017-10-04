//
//  AddNewCapsulaViewController.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 04/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "AddNewCapsulaViewController.h"
#import "ItensDoTipoDeterminadoViewController.h"
#import "Capsula.h"
@interface AddNewCapsulaViewController ()
@end


@implementation AddNewCapsulaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)selecionarImagem:(id)sender {
    self.imageController = [[UIImagePickerController  alloc] init];
    self.imageController.delegate=self;
    [self.imageController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:self.imageController animated:YES completion:nil];
}
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    self.chosenImage=info[UIImagePickerControllerOriginalImage];
    [self.imagemExibicao setImage:self.chosenImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addCapsula:(id)sender {
    _capsula.name = self.nomeDaCapsulaText.text;
    _capsula.tracos = [self.numeroDeTracosText.text intValue];
    _capsula.des = self.descricaoText.text;
    _capsula.image = self.chosenImage;
    
    [self.delegate sendCapsulaToViewController:self.capsula];
    self.nomeDaCapsulaText.text = @"";
    self.numeroDeTracosText.text = @"";
    self.descricaoText.text = @"";
    self.imagemExibicao.image = nil;
}

@end
