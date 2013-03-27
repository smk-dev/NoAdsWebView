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
@synthesize blockFacebookLikeBox;
@synthesize blockFacebookConnect;

#pragma mark - Public methods

- (BOOL)acceptURL:(NSURL *)url {
    
    // don't load about:blank
    if ([url.absoluteString isEqualToString:@"about:blank"]) {
        return NO;
    }
    
    // facebook like button
    if (self.blockFacebookLike && [self isFacebookLikeURL:url]) {
        LogInfo(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    // facebook like box
    if (self.blockFacebookLikeBox && [self isFacebookLikeBoxURL:url]) {
        LogInfo(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    // facebook connect
    if (self.blockFacebookConnect && [self isFacebookConnectURL:url]) {
        LogInfo(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    
    
    
    
    
    
    
    
    
    // twitter follow button
    if (self.blockTwitterFolow && [self isTwitterFollowURL:url]) {
        LogInfo(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    LogInfo(@"Accept: %@", [self simpleUrlString:url]);
    
    return YES;
}

#pragma mark - Facebook

- (BOOL)isFacebookLikeURL:(NSURL *)url {
    return [url.host isEqualToString:@"www.facebook.com"] && [url.relativePath isEqualToString:@"/plugins/like.php"];
}

- (BOOL)isFacebookConnectURL:(NSURL *)url {
    
    if ([url.host isEqualToString:@"static.ak.facebook.com"] && [url.relativePath isEqualToString:@"/connect/xd_arbiter.php"]) {
        return YES;
    }
    
    if ([url.host isEqualToString:@"s-static.ak.facebook.com"] && [url.relativePath isEqualToString:@"/connect/xd_arbiter.php"]) {
        return YES;
    }
    
    if ([url.host isEqualToString:@"www.facebook.com"] && [url.relativePath isEqualToString:@"/dialog/oauth"]) {
        return YES;
    }
    
    if ([url.host isEqualToString:@"www.facebook.com"] && [url.relativePath isEqualToString:@"/plugins/login_button.php"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isFacebookLikeBoxURL:(NSURL *)url {
    return [url.host isEqualToString:@"www.facebook.com"] && [url.relativePath isEqualToString:@"/plugins/likebox.php"];
}

- (BOOL)isFacebookRecomendations:(NSURL *)url {
    return [url.host isEqualToString:@"www.facebook.com"] && [url.relativePath isEqualToString:@"/plugins/recommendations.php"];
}

#pragma mark - Twitter

- (BOOL)isTwitterFollowURL:(NSURL *)url {
    return [url.host isEqualToString:@"platform.twitter.com"];
}

#pragma mark - Google

- (BOOL)isGoogleAnalyticsURL:(NSURL *)url {
    return [url.host isEqualToString:@"www.google-analytics.com"];
}

- (BOOL)isGooglePlusOneURL:(NSURL *)url {
    return [url.host isEqualToString:@"plusone.google.com"];
}

- (BOOL)isGoogleDoubleClickURL:(NSURL *)url {
    return [url.host isEqualToString:@"googleads.g.doubleclick.net"];
}

#pragma mark - Ads



#pragma mark - Private methods

- (NSString *)simpleUrlString:(NSURL *)url {
    return [NSString stringWithFormat:@"%@://%@%@", url.scheme, url.host, url.relativePath];
}

@end
