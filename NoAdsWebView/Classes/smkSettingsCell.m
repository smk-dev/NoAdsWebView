//
//  smkSettingsCell.m
//  NoAdsWebView
//
//  Created by smk-dev on 01.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkSettingsCell.h"

@implementation smkSettingsCell

@synthesize titleLabel;
@synthesize switchButton;
@synthesize urlFilter;
@synthesize urlFilterKey;

- (IBAction)switchDidChanged:(id)sender {
    
    // update filter
    if (self.urlFilter && self.urlFilterKey) {
        [urlFilter setValue:@(self.switchButton.on) forKey:self.urlFilterKey];
        
        LogTrace(@"Updating URL filter key: %@ %@", self.urlFilterKey, (self.switchButton.on ? @"YES" : @"NO"));
    }
}

@end
