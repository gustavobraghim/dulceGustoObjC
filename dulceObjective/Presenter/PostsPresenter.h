//
//  PostsPresenter.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 25/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "ViewController.h"
#import "PostsViewController.h"

@interface PostsPresenter : NSObject
@property (weak, nonatomic) PostsViewController *postsTableViewController;
@property (nonatomic, strong) NSMutableArray *webTitles;
@property (nonatomic, strong) NSMutableArray *sectionName;
@property (nonatomic, strong) NSMutableArray *postId;
@property (nonatomic, strong) NSMutableArray *userId;
- (void)httpGetRequest;
- (void)getReceivedData:(NSMutableData*) data sender:(RESTApi *) sender;
@end
