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

@interface PostsTableViewController ()  <RestAPIDelegate>
@property (nonatomic, strong) RESTApi *restAPI;
@property (nonatomic, strong) NSMutableArray *webTitles;
@property (nonatomic, strong) NSMutableArray *sectionName;
@property (nonatomic, strong) NSMutableArray *postId;
@property (nonatomic, strong) NSMutableArray *userId;
@property (readwrite) IBOutlet UITextField *description;
@property (readwrite) IBOutlet UILabel *title;
@end

@implementation PostsTableViewController
@synthesize description;
@synthesize title;


- (void)viewDidLoad {
	[super viewDidLoad];
	[self httpGetRequest];
	//[self dismissViewControllerAnimated:YES completion:nil];

}

-(void)viewDidAppear:(BOOL)animated{
	//[self dismissViewControllerAnimated:YES completion:nil];
}
//CASO CLÁSSICO DE USAR O _ NO LUGAR DE SELF
-(RESTApi *) restAPI{
	if (!_restAPI) {
		self.restAPI = [[RESTApi alloc] init];
	}
	return _restAPI;
}

-(NSMutableArray *) webTitles{
	if (!_webTitles) {
		self.webTitles = [[NSMutableArray alloc] init];
	}
	return _webTitles;
}

-(NSMutableArray *) sectionName{
	if (!_sectionName) {
		self.sectionName = [[NSMutableArray alloc] init];
	}
	return _sectionName;
}

-(NSMutableArray *) postId{
	if (!_postId) {
		self.postId = [[NSMutableArray alloc] init];
	}
	return _postId;
}

-(NSMutableArray *) userId{
	if (!_userId) {
		self.userId = [[NSMutableArray alloc] init];
	}
	return _userId;
}

- (void)httpGetRequest
{
	NSString *str = @"https://jsonplaceholder.typicode.com/posts";
	str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:str];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"GET"];
	self.restAPI.delegate = self;
	[self.restAPI httpRequest:request];
}

//IMPLEMENTAÇÃO getReceivedData
-(void)getReceivedData:(NSMutableData*) data sender:(RESTApi *) sender{
	NSError *error = nil;
	NSArray *receivedData =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
	
	for (int i=0; i<receivedData.count; i++) {
		NSDictionary *dictionary= [receivedData objectAtIndex:i];
		NSString *title = [dictionary objectForKey:@"title"];
		NSString *description = [dictionary objectForKey:@"body"];
		NSString *postId = [dictionary objectForKey:@"id"];
		NSString *userId = [dictionary objectForKey:@"userId"];
		[self.webTitles addObject:title];
		[self.sectionName addObject:description];
		[self.postId addObject:postId];
		[self.userId addObject:userId];
	}
	[self.tablePosts reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.webTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellPost" forIndexPath:indexPath];
	cell.detailTextLabel.text = [self.sectionName objectAtIndex:indexPath.row];
	cell.textLabel.text = [self.webTitles objectAtIndex:indexPath.row];
	return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if ([segue.identifier isEqualToString:@"editPostSegue"]) {
		NSIndexPath *indexPath = [self.tablePosts indexPathForSelectedRow];
		AddPostsVC *destViewController = segue.destinationViewController;
		destViewController.recebeTitle =	[self.webTitles objectAtIndex:indexPath.row];
		destViewController.recebeDescription = [self.sectionName objectAtIndex:indexPath.row];
		destViewController.recebeId = [self.postId objectAtIndex:indexPath.row];
		destViewController.recebeuserId = [self.userId objectAtIndex:indexPath.row];
		}
	[self dismissViewControllerAnimated:YES completion:nil];
	

}
@end

