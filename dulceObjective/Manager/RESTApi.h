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
@optional
-(void)getReceivedData:(NSMutableData*) data sender:(RESTApi *) sender;
@end

@interface RESTApi : NSObject

-(void)connection:(NSURLConnection *) connection didReceiveData:(NSData *)data;
-(void)connection:(NSURLConnection *) connection didFailWithError:(NSError *)error;
-(void)httpRequest: (NSMutableURLRequest *) request;
-(void)connectionDidFinishLoading:(NSURLConnection *) connection;
@property (nonatomic, strong) id <RestAPIDelegate> delegate;
@end
