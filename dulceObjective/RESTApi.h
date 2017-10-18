//
//  RESTApi.h
//  dulceObjective
//
//  Created by Gustavo Braghim on 17/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RESTApi;
@protocol RestAPIDelegate
-(void)getReceivedData:(NSMutableData*) data sender:(RESTApi *) sender;
@end

@interface RESTApi : NSObject

-(void)connection:(NSURLConnection *) connection didReceiveData:(NSData *)data;
-(void)connectionDidFinishLoading:(NSURLConnection *) connection;
-(void)connection:(NSURLConnection *) connection didFailWithError:(NSError *)error;
-(void)httpRequest: (NSMutableURLRequest *) request;

@property (nonatomic, weak) id <RestAPIDelegate> delegate;
@end
