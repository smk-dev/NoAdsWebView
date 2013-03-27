//
//  smkUrlFilter.m
//  NoAdsWebView
//
//  Created by Seba on 26.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkUrlFilter.h"

@implementation smkUrlFilter

@synthesize blockFacebookLike;

- (BOOL)acceptURL:(NSURL *)url {
    
    // don't load about:blank
    if (!url.host) {
        return NO;
    }
    
    // blocking facebook like button
    if (self.blockFacebookLike && [self isFacebookLikeURL:url]) {
        LogInfo(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if (self.blockFacebookLike && [self isFacebookConnectURL:url]) {
        LogInfo(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if (self.blockFacebookLike && [self isFacebookLikeBoxURL:url]) {
        LogInfo(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if ([url.host isEqualToString:@"www.facebook.com"]) {
        return NO;
    }
    
    
    LogInfo(@"Accept: %@", [self simpleUrlString:url]);
    
    return YES;
}


#pragma mark - Private methods

- (BOOL)isFacebookLikeURL:(NSURL *)url {
    return [url.host isEqualToString:@"www.facebook.com"]
        && [url.relativePath isEqualToString:@"/plugins/like.php"];
}

- (BOOL)isFacebookConnectURL:(NSURL *)url {
    return ([url.host isEqualToString:@"static.ak.facebook.com"]
         || [url.host isEqualToString:@"s-static.ak.facebook.com"])
         && [url.relativePath isEqualToString:@"/connect/xd_arbiter.php"];
}

- (BOOL)isFacebookLikeBoxURL:(NSURL *)url {
    return [url.host isEqualToString:@"www.facebook.com"]
        && [url.relativePath isEqualToString:@"/plugins/likebox.php"];
}

- (BOOL)isTwitterFollowURL:(NSURL *)url {
    return [url.host isEqualToString:@"platform.twitter.com"];
}

- (BOOL)isGoogleAnalyticsURL:(NSURL *)url {
    return [url.host isEqualToString:@"www.google-analytics.com"];
}

- (BOOL)isGooglePlusURL:(NSURL *)url {
    return [url.host isEqualToString:@"plus.google.com"];
}



- (NSString *)simpleUrlString:(NSURL *)url {
    return [NSString stringWithFormat:@"%@://%@%@", url.scheme, url.host, url.relativePath];
}

@end
