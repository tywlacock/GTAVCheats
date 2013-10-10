//
//  GTAViewController.m
//  GTAVCheats
//
//  Created by Ty Lacock on 10/4/13.
//  Copyright (c) 2013 Ty Lacock. All rights reserved.
//

#import "GTAViewController.h"

@interface GTAViewController ()

@end

@implementation GTAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.banner.delegate = self;
    UIImage *backgroundImage = [[UIImage alloc]init];
    backgroundImage = [UIImage imageNamed:@"gta5small.jpg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:backgroundImage]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// -------------------------------------------------------------------------- //
//                           iAd Banner Methods                               //
// -------------------------------------------------------------------------- //
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    return YES;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
}

@end
