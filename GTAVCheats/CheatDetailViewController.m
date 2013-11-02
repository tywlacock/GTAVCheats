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
    [self configureLabel];
    
}

- (void)configureLabel {
    // Loads Video URL from JSON into webview
    NSURL *url = [NSURL URLWithString:[self.cheatDetail objectForKey:@"url"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.video loadRequest:request];
    
    // Sets Labels and Titles from JSON
    self.navigationItem.title = [self.cheatDetail objectForKey:@"name"];
    self.nameLabel.text = [self.cheatDetail objectForKey:@"name"];
    self.codeLabel.text = [self.cheatDetail objectForKey:@"code"];
    
    if ([[self.cheatDetail objectForKey:@"description"] isEqualToString: @""]) {
        self.descriptionLabel.text = [self.cheatDetail objectForKey:@"name"];
    } else {
        self.descriptionLabel.text = [self.cheatDetail objectForKey:@"description"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}





- (IBAction)speak:(UIButton *)sender {
    AVSpeechUtterance *utterance = [AVSpeechUtterance
                                    speechUtteranceWithString: self.codeLabel.text];
    AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc] init];
    utterance.rate = AVSpeechUtteranceMinimumSpeechRate; // Speech Rate
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-us"];
    
    [synth speakUtterance:utterance];
}
@end
