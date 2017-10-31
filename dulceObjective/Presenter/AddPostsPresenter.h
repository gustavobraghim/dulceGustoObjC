//
//  AsddPostsPresenter.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 25/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "ViewController.h"
#import "AddPostsVC.h"
#import "RESTApi.h"
#import "PostsViewController.h"


@interface AddPostsPresenter : NSObject
@property (weak, nonatomic) AddPostsVC *addPostsVC;
@property (weak, nonatomic) PostsViewController *postsViewController;

@property (strong, nonatomic) NSString *recebeTitle;
@property (strong, nonatomic) NSString *recebeDescription;
@property (strong, nonatomic) NSNumber *recebeId;
@property (strong, nonatomic) NSNumber *recebeuserId;
-(void)httpDeleteRequest;
-(void)httpUpdateRequest;
-(void)httpPostRequest;
-(void)initialize;
-(void)backButtonWasTapped;
-(void)deleteButtonWasTapped;
-(void)actionButtonWasTapped;
@end
