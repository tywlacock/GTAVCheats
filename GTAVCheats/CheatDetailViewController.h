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

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;

@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;

@property (weak, nonatomic) IBOutlet UIWebView *video;


- (IBAction)speak:(UIButton *)sender;

@end
