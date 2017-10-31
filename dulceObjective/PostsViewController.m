//
//  PostsTableViewController.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 17/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "PostsViewController.h"
#import "RESTApi.h"
#import "AddPostsVC.h"
#import "PostsPresenter.h"

@interface PostsViewController ()  <RestAPIDelegate>


@property (readwrite) IBOutlet UITextField *description;
@property (readwrite) IBOutlet UILabel *title;
@property (strong, nonatomic) PostsPresenter *postsPresenter;
@end

@implementation PostsViewController
@synthesize description;
@synthesize title;


- (void)viewDidLoad {
	NSMutableData *mutableData = [[NSMutableData alloc] init];
	[super viewDidLoad];
	self.postsPresenter = [[PostsPresenter alloc] init];
	self.postsPresenter.postsTableViewController = self;
	[self.postsPresenter httpGetRequest];
	[self.postsPresenter getReceivedData:mutableData sender:self.restAPI];
}

-(void)viewDidAppear:(BOOL)animated{
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.postsPresenter.webTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellPost" forIndexPath:indexPath];
	cell.detailTextLabel.text = [self.postsPresenter.sectionName objectAtIndex:indexPath.row];
	cell.textLabel.text = [self.postsPresenter.webTitles objectAtIndex:indexPath.row];
	return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if ([segue.identifier isEqualToString:@"editPostSegue"]) {
		NSIndexPath *indexPath = [self.tablePosts indexPathForSelectedRow];
		AddPostsVC *destViewController = segue.destinationViewController;
		destViewController.recebeTitle = [self.postsPresenter.webTitles objectAtIndex:indexPath.row];
		destViewController.recebeDescription = [self.postsPresenter.sectionName objectAtIndex:indexPath.row];
		destViewController.recebeId = [self.postsPresenter.postId objectAtIndex:indexPath.row];
	}
	[self dismissViewControllerAnimated:YES completion:nil];
}
@end
