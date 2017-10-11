//
//  AddPostsVC.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 11/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPostsVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *titlePost;
@property (strong, nonatomic) IBOutlet UITextView *bodyPost;
@property (strong, nonatomic) IBOutlet UITextField *idPost;

@end
