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
@property (nonatomic, strong) NSMutableArray *webTitles;
@property (nonatomic, strong) NSMutableArray *sectionName;
@property (readwrite) IBOutlet UITextField *description;
@property (readwrite) IBOutlet UILabel *title;



@end

@implementation PostsTableViewController
@synthesize description;
@synthesize title;


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
    
    for (int i=0; i<results.count; i++) {
        NSDictionary *resultItems = [results objectAtIndex:i];
        NSString *webTitle= [resultItems objectForKey:@"webTitle"];
        [self.webTitles addObject:webTitle];
        NSString *sectionName= [resultItems objectForKey:@"sectionName"];
        [self.sectionName addObject:sectionName];
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
@end

