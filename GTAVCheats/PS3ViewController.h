//
//  PS3ViewController.h
//  GTAVCheats
//
//  Created by Ty Lacock on 10/5/13.
//  Copyright (c) 2013 Ty Lacock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PS3ViewController : UITableViewController <UITableViewDataSource>

@property (nonatomic, strong) NSArray *jsonFromAFNetworking;
@property (nonatomic, strong) NSArray *finishedCheatArray;



@end
