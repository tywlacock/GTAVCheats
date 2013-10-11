//
//  CheatDetailViewController.h
//  GTAVCheats
//
//  Created by Ty Lacock on 10/5/13.
//  Copyright (c) 2013 Ty Lacock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheatDetailViewController : UIViewController

@property (nonatomic, strong) NSDictionary *cheatDetail;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *codeLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UIWebView *video;

- (IBAction)speak:(UIButton *)sender;

@end
