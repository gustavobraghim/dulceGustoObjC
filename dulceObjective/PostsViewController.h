//
//  PostsTableViewController.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 17/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostsTableViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tablePosts;
@property (readonly) IBOutlet UILabel *title;
@property (readonly) IBOutlet UITextField *description;
@property (nonatomic, assign) NSDictionary *posts;


@end
