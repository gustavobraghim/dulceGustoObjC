//
//  RESTApi.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 17/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "RESTApi.h"

@interface RESTApi () <NSURLConnectionDelegate>
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, strong) NSURLConnection *requestConnection;
@end

@implementation RESTApi

- (NSMutableData *)receivedData
{
	if (!_receivedData)
	{
		self.receivedData = [[NSMutableData alloc] init];
	}
	return _receivedData;
}

-(NSURLConnection *) requestConnection {
	if (_requestConnection)
	{
		self.requestConnection = [[NSURLConnection alloc] init];
	}
	return _requestConnection;
}

-(void)httpRequest: (NSMutableURLRequest *)request{
	self.requestConnection = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	[self.receivedData appendData:data];
}

//CHAMANDO AQUI
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	[self.delegate getReceivedData:self.receivedData sender:self];
	self.delegate = nil;
	self.requestConnection = nil;
	self.receivedData = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	NSLog(@"%@", error.description);
}
@end

