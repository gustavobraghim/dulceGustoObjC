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
@property (strong, nonatomic) IBOutlet UITextField *descriptionPost;
@property (strong, nonatomic) NSString *recebeTitle;
@property (strong, nonatomic) NSString *recebeDescription;
@property (strong, nonatomic) NSNumber *recebeId;
@property (strong, nonatomic) NSNumber *recebeuserId;
@end
