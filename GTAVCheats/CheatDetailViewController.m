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
//    NSString *videoURL = @"<iframe width=\"420\" height=\"315\" src=\"www.youtube.com/embed/hIsNTRm2GlE\" frameborder=\"0\" allowfullscreen></iframe>";
//    
//    NSString *html = @"\
//    <html><head>\
//    <style type=\"text/css\">\
//    body {\
//    background-color: transparent;\
//    color: white;\
//    }\
//    </style>\
//    </head><body style=\"margin:0\">\
//    <embed id=\"yt\" src=\"www.youtube.com/v/hIsNTRm2GlE?version=3&amp;hl=en_US\" type=\"application/x-shockwave-flash\" \
//    width=\"320\" height=\"200\"></embed>\
//    </body></html>";
//    
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.youtube.com/watch?v=hIsNTRm2GlE"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.video loadRequest:request];
    
    
    
    self.navigationItem.title = [self.cheatDetail objectForKey:@"name"];
    self.nameLabel.text = [self.cheatDetail objectForKey:@"name"];
    self.descriptionLabel.text = [self.cheatDetail objectForKey:@"description"];
    self.codeLabel.text = [self.cheatDetail objectForKey:@"code"];
    
//    [self.video loadHTMLString:html baseURL:nil];
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
