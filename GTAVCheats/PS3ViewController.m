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
#pragma mark - Data loading
// --------------------------------------------------


- (void)loadData {
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"cheats" ofType:@"plist"];
    NSDictionary *cheatsDict = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
    
    if ([self.navigationItem.title  isEqual: @"PS3 Cheats"]) {
        self.cheatsArray = cheatsDict[@"ps3"];
    } else {
        self.cheatsArray = cheatsDict[@"xbox"];
    }
}

// --------------------------------------------------
#pragma mark - Initial things
// --------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// --------------------------------------------------
#pragma mark - Data Source Methods
// --------------------------------------------------


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cheatsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Set the correct color of the label based on cheat type
    if ([self.cheatsArray[indexPath.row][@"type"] isEqualToString:@"player"]) {
        cell.textLabel.textColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1.0];
    } else if ([self.cheatsArray[indexPath.row][@"type"] isEqualToString:@"world"]) {
        cell.textLabel.textColor = [UIColor colorWithRed:46.0/255.0 green:204.0/255.0 blue:113.0/255.0 alpha:1.0];
    } else {
        cell.textLabel.textColor = [UIColor colorWithRed:243.0/255.0 green:156.0/255.0 blue:18.0/255.0 alpha:1.0];
    }
    
    
    // Configure the cell
    cell.textLabel.text = self.cheatsArray[indexPath.row][@"name"];
    cell.detailTextLabel.text = self.cheatsArray[indexPath.row][@"code"];
    
    
    return cell;
}

// --------------------------------------------------
#pragma mark - Segue
// --------------------------------------------------

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    CheatDetailViewController *cheatDetailViewController = (CheatDetailViewController *)segue.destinationViewController;
    cheatDetailViewController.cheatDetail = [self.cheatsArray objectAtIndex:indexPath.row];
}

@end
