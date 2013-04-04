//
//  smkAppDelegate.m
//  NoAdsWebView
//
//  Created by smk-dev on 24.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkAppDelegate.h"

@implementation smkAppDelegate

@synthesize urlFilter = _urlFilter;

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // init url filter
    int memory = 1024 * 1024;
    int capacity = 10 * 1024 * 1024;
    NSString *path = @"webview.cache";
    _urlFilter = [[smkUrlFilter alloc] initWithMemoryCapacity:memory diskCapacity:capacity diskPath:path];
    [NSURLCache setSharedURLCache:_urlFilter];
    
    return YES;
}

@end
