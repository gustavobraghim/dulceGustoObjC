//
//  AddPostsVC.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 11/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//
#import "AddPostsVC.h"
#import "PostsViewController.h"
#import "RESTApi.h"
#import "AddPostsPresenter.h"
@interface AddPostsVC ()  <RestAPIDelegate>
@property (strong, nonatomic) AddPostsPresenter *addPostsPresenter;
@property (nonatomic, strong) RESTApi *restAPI;
@end

@implementation AddPostsVC
@synthesize recebeTitle;
@synthesize recebeDescription;
@synthesize recebeId;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.addPostsPresenter = [[AddPostsPresenter alloc] init];
	self.addPostsPresenter.addPostsVC = self;
	[self.addPostsPresenter initialize];
}

- (IBAction)backButton:(id)sender {
	[self.addPostsPresenter backButtonWasTapped];
}

- (IBAction)deleteButton:(id)sender {
	[self.addPostsPresenter deleteButtonWasTapped];
}

- (IBAction)actionButton:(id)sender {
	[self.addPostsPresenter actionButtonWasTapped];
}

@end

