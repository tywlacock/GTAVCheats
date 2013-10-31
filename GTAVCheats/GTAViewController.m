//
//  GTAViewController.m
//  GTAVCheats
//
//  Created by Ty Lacock on 10/4/13.
//  Copyright (c) 2013 Ty Lacock. All rights reserved.
//

#import "GTAViewController.h"

#define PRICEDOWN(s) [UIFont fontWithName:@"pricedown" size:s]

@interface GTAViewController ()

@end

@implementation GTAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.banner.delegate = self;
    
    // Set Font styling
    self.playerLabel.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1.0];
    self.worldLabel.backgroundColor = [UIColor colorWithRed:46.0/255.0 green:204.0/255.0 blue:113.0/255.0 alpha:1.0];
    self.spawnLabel.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:156.0/255.0 blue:18.0/255.0 alpha:1.0];
    
    self.testLabel.font = PRICEDOWN(30.0f);
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
