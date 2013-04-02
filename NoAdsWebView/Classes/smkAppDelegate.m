//
//  smkAppDelegate.m
//  NoAdsWebView
//
//  Created by smk-dev on 24.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkAppDelegate.h"

@implementation smkAppDelegate

@synthesize urlFilter;

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    urlFilter = [[smkUrlFilter alloc] init];
    return YES;
}

@end
