//
//  AsddPostsPresenter.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 25/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "AddPostsPresenter.h"
#import "AddPostsVC.h"
#import "RESTApi.h"

@interface AddPostsPresenter ()
@property (nonatomic, strong) RESTApi *restAPI;
@property (nonatomic, strong) NSMutableArray *webTitles;
@property (nonatomic, strong) NSMutableArray *sectionName;
@property (nonatomic, strong) NSMutableArray *postId;
@property (nonatomic, strong) NSMutableArray *userId;
@property (nonatomic, assign) int flag;

@end

@implementation AddPostsPresenter

-(void)initialize{
	if (self.addPostsVC.recebeId != nil) {
		[self.addPostsVC.titlePost setText:self.addPostsVC.recebeTitle];
		[self.addPostsVC.descriptionPost setText:self.addPostsVC.recebeDescription];
		self.flag = 1;
		
	} else{
		self.addPostsVC.titlePost.text = @"";
		self.addPostsVC.descriptionPost.text = @"";
		self.flag = 0;
	}
}

-(void)backButtonWasTapped{
	[self.addPostsVC dismissViewControllerAnimated:YES completion:nil];
}
-(void)deleteButtonWasTapped{
	[self httpDeleteRequest];
	self.addPostsVC.titlePost.text = @"";
	self.addPostsVC.descriptionPost.text = @"";
}

-(void)actionButtonWasTapped{
	if (self.flag == 0) {
		[self httpPostRequest];
	}
	else{
		[self httpUpdateRequest];
	}
	self.addPostsVC.titlePost.text = @"";
	self.addPostsVC.descriptionPost.text = @"";
	[self.addPostsVC dismissViewControllerAnimated:YES completion:nil];
}

- (void)httpPostRequest
{
	NSString *title = self.addPostsVC.titlePost.text;
	NSString *description = self.addPostsVC.descriptionPost.text;
	NSString *str = @"https://jsonplaceholder.typicode.com/posts";
	NSDictionary *dict = @{  @"title": title,
							 @"body": description
							 };
	NSError *error = nil;
	NSData *json = [NSJSONSerialization dataWithJSONObject:dict options:0 error: &error];
	str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:str];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"POST"];
	[request setHTTPBody:json];
}

-(void)httpUpdateRequest{
	NSString *title = self.addPostsVC.titlePost.text;
	NSString *description = self.addPostsVC.descriptionPost.text;
	NSNumber *postId = self.addPostsVC.recebeId;
	NSString *str = [NSString stringWithFormat: @"https://jsonplaceholder.typicode.com/posts/%@", self.addPostsVC.recebeId];
	NSDictionary *dict = @{
						   @"id": postId,
						   @"title": title,
						   @"body": description
						   };
	NSError *error = nil;
	NSData *json = [NSJSONSerialization dataWithJSONObject:dict options:0 error: &error];
	str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:str];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"PUT"];
	[request setHTTPBody:json];
}

-(void)httpDeleteRequest{
	NSString *str = [NSString stringWithFormat: @"https://jsonplaceholder.typicode.com/posts/%@", self.addPostsVC.recebeId];
	str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:str];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"DELETE"];
}
@end
