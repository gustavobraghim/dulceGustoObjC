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

@interface AddPostsVC ()  <RestAPIDelegate>
@property (nonatomic, strong) RESTApi *restAPI;
@property (nonatomic, strong) NSMutableArray *webTitles;
@property (nonatomic, strong) NSMutableArray *sectionName;
@property (nonatomic, strong) NSMutableArray *postId;
@property (nonatomic, strong) NSMutableArray *userId;
@property (nonatomic, assign) int flag;

@end

@implementation AddPostsVC
@synthesize recebeTitle;
@synthesize recebeDescription;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	if (self.recebeId != nil) {
		[self.titlePost setText:recebeTitle];
		[self.descriptionPost setText:recebeDescription];
		self.flag = 1;
		
	} else{
		self.titlePost.text = @"";
		self.descriptionPost.text = @"";
		self.flag = 0;
	}
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

- (void)httpPostRequest
{
	NSNumber *userId = self.recebeuserId;;
	NSString *title = self.titlePost.text;
	NSString *description = self.descriptionPost.text;
	NSString *str = @"https://jsonplaceholder.typicode.com/posts";
	NSDictionary *dict = @{  @"title": title,
							 @"body": description,
							 @"userId": userId
							 };
	NSError *error = nil;
	NSData *json = [NSJSONSerialization dataWithJSONObject:dict options:0 error: &error];
	str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:str];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"POST"];
	[request setHTTPBody:json];
	self.restAPI.delegate = self;
	[self.restAPI httpRequest:request];
}

-(void)httpUpdateRequest{
	NSNumber *userId = self.recebeuserId;
	NSString *title = self.titlePost.text;
	NSString *description = self.descriptionPost.text;
	NSNumber *postId = self.recebeId;
	NSString *str = [NSString stringWithFormat: @"https://jsonplaceholder.typicode.com/posts/%@", self.recebeId];
	NSDictionary *dict = @{
						   @"id": postId,
						   @"title": title,
						   @"body": description,
						   @"userId": userId
					   };
	NSError *error = nil;
	NSData *json = [NSJSONSerialization dataWithJSONObject:dict options:0 error: &error];
	str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:str];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"PUT"];
	[request setHTTPBody:json];
	self.restAPI.delegate = self;
	[self.restAPI httpRequest:request];
}

-(void)httpDeleteRequest{
	NSString *str = [NSString stringWithFormat: @"https://jsonplaceholder.typicode.com/posts/%@", self.recebeId];
	str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:str];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"DELETE"];
	self.restAPI.delegate = self;
	[self.restAPI httpRequest:request];
}

- (IBAction)addPostButton:(id)sender {
	if (self.flag == 0) {
		[self httpPostRequest];
	}
	else{
		[self httpUpdateRequest];
	}
	self.titlePost.text = @"";
	self.descriptionPost.text = @"";
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backButton:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deleteButton:(id)sender {
	[self httpDeleteRequest];
	self.titlePost.text = @"";
	self.descriptionPost.text = @"";
}

-(void)getReceivedData:(NSMutableData*) data sender:(RESTApi *) sender{
}
@end

