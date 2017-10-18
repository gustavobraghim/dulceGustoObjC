//
//  PostsTableViewController.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 17/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "PostsViewController.h"
#import "RESTApi.h"

@interface PostsTableViewController ()  <RestAPIDelegate>
@property (nonatomic, strong) RESTApi *restAPI;
@end

@implementation PostsTableViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	[self httpGetRequest];
}
//CASO CLÁSSICO DE USAR O _ NO LUGAR DE SELF
-(RESTApi *) restAPI{
	if (!_restAPI) {
		self.restAPI = [[RESTApi alloc] init];
	}
	return _restAPI;
}

- (void)httpGetRequest
{
	NSString *str = @"http://content.guardianapis.com/search?api-key=test";
	str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:str];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"GET"];
	self.restAPI.delegate = self;
	[self.restAPI httpRequest:request];
}

- (void)httpPostRequest
{
	NSString *postBody = @"api-key=test";
	NSString *str = @"https://jsonplaceholder.typicode.com/posts/1";
	str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:str];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"POST"];
	[request setHTTPBody:[postBody dataUsingEncoding:NSUTF8StringEncoding]];
	self.restAPI.delegate = self;
	[self.restAPI httpRequest:request];
}

//IMPLEMENTAÇÃO getReceivedData
-(void)getReceivedData:(NSMutableData*) data sender:(RESTApi *) sender{
	NSError *error = nil;
	NSDictionary *receivedData =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
	NSDictionary *response = [[NSDictionary alloc] initWithDictionary:[receivedData objectForKey:@"response"]];
	NSArray *results = [[NSArray alloc] initWithArray: [response objectForKey:@"results"]];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"postCell" forIndexPath:indexPath];
	
	// Configure the cell...
	
	return cell;
}
@end

