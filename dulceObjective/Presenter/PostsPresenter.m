//
//  PostsPresenter.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 25/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "RESTApi.h"
#import "AddPostsVC.h"
#import "PostsPresenter.h"
#import "PostsViewController.h"

@interface PostsPresenter ()
@property (nonatomic, strong) RESTApi *restAPI;

@end

@implementation PostsPresenter
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
	//self.restAPI.delegate = self;
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
	[self.postsTableViewController.tablePosts reloadData];
}
@end

