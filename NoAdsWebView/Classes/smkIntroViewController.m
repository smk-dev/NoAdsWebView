//
//  smkIntroViewController.m
//  NoAdsWebView
//
//  Created by smk-dev on 01.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkIntroViewController.h"

@implementation smkIntroViewController

#pragma mark - Actions

- (IBAction)githubButtonAction:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/smk-dev"]];
}

@end
