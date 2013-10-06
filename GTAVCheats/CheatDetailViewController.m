//
//  CheatDetailViewController.m
//  GTAVCheats
//
//  Created by Ty Lacock on 10/5/13.
//  Copyright (c) 2013 Ty Lacock. All rights reserved.
//

#import "CheatDetailViewController.h"
#import <AVFoundation/AVSpeechSynthesis.h>

@interface CheatDetailViewController ()

@end

@implementation CheatDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nameLabel.text = [self.cheatDetail objectForKey:@"name"];
    self.descriptionLabel.text = [self.cheatDetail objectForKey:@"description"];
    self.codeLabel.text = [self.cheatDetail objectForKey:@"code"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)speak:(UIButton *)sender {
    AVSpeechUtterance *utterance = [AVSpeechUtterance
                                    speechUtteranceWithString: self.codeLabel.text];
    AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc] init];
    utterance.rate = AVSpeechUtteranceMinimumSpeechRate; // Speech Rate
    
    [synth speakUtterance:utterance];
}
@end
