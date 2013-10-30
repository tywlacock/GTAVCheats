//
//  PS3ViewController.m
//  GTAVCheats
//
//  Created by Ty Lacock on 10/5/13.
//  Copyright (c) 2013 Ty Lacock. All rights reserved.
//

#import "PS3ViewController.h"
#import "CheatDetailViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPSessionManager.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "AFNetworkReachabilityManager.h"
#import "AFSecurityPolicy.h"
#import "AFURLConnectionOperation.h"
#import "AFURLRequestSerialization.h"
#import "AFURLResponseSerialization.h"
#import "AFURLSessionManager.h"
#import "UIActivityIndicatorView+AFNetworking.h"
#import "UIAlertView+AFNetworking.h"
#import "UIButton+AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "UIProgressView+AFNetworking.h"
#import "UIWebView+AFNetworking.h"

#define PRICEDOWN(s) [UIFont fontWithName:@"pricedown" size:s]


@interface PS3ViewController ()
@end

@implementation PS3ViewController
// --------------------------------------------------
// Data Request Methods
// --------------------------------------------------
- (void)makeJSONRequest
{
    NSString *cheatKey = [[NSString alloc] init];
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    
    if ([self.navigationItem.title  isEqual: @"PS3 Cheats"]) {
         cheatKey = @"ps3";
    } else {
        cheatKey = @"xbox";
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://www.tylacock.com/cheats.json" parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             self.jsonFromAFNetworking = [responseObject objectForKey:cheatKey];
             [self.jsonFromAFNetworking writeToFile:filePath atomically:YES];
             [self.tableView reloadData];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
    }];
    
    
}


// --------------------------------------------------
// Initializor Methods
// --------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeJSONRequest];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// --------------------------------------------------
// Data Source Methods
// --------------------------------------------------
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.jsonFromAFNetworking count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *tempDict = [self.jsonFromAFNetworking objectAtIndex:indexPath.row];
    
    if ([[tempDict objectForKey:@"type"] isEqualToString:@"player"]) {
        cell.textLabel.textColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1.0];
    } else if ([[tempDict objectForKey:@"type"] isEqualToString:@"world"]) {
        cell.textLabel.textColor = [UIColor colorWithRed:46.0/255.0 green:204.0/255.0 blue:113.0/255.0 alpha:1.0];
    } else {
        cell.textLabel.textColor = [UIColor colorWithRed:243.0/255.0 green:156.0/255.0 blue:18.0/255.0 alpha:1.0];
    }
    
    cell.textLabel.text = [tempDict objectForKey:@"name"];
    cell.detailTextLabel.text = [tempDict objectForKey:@"code"];
    
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    CheatDetailViewController *cheatDetailViewController = (CheatDetailViewController *)segue.destinationViewController;
    cheatDetailViewController.cheatDetail = [self.jsonFromAFNetworking objectAtIndex:indexPath.row];
}

@end
