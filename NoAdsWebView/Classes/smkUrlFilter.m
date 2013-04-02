//
//  smkUrlFilter.m
//  NoAdsWebView
//
//  Created by smk-dev on 26.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkUrlFilter.h"

@implementation smkUrlFilter

@synthesize blockFacebookLike;
@synthesize blockFacebookLikeBox;
@synthesize blockFacebookConnect;
@synthesize blockFacebookComment;
@synthesize blockFacebookRecomendations;

@synthesize blockGooglePlusOne;
@synthesize blockGoogleAnalytics;
@synthesize blockGoogleDoubleClick;

@synthesize blockTwitterFolowButton;
@synthesize blockTwitterShareButton;
@synthesize blockTwitterTweetButton;

@synthesize blockImages;
@synthesize blockJavaScript;

#pragma mark - Public methods

- (BOOL)acceptURL:(NSURL *)url {
    
    // don't load about:blank
    if ([url.absoluteString isEqualToString:@"about:blank"]) {
        return NO;
    }
    
    // facebook
    if (self.blockFacebookLike && [self isFacebookLikeURL:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if (self.blockFacebookLikeBox && [self isFacebookLikeBoxURL:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if (self.blockFacebookConnect && [self isFacebookConnectURL:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if (self.blockFacebookComment && [self isFacebookCommentURL:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if (self.blockFacebookRecomendations && [self isFacebookRecomendations:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    // twitter
    if (self.blockTwitterFolowButton && [self isTwitterFollowURL:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if (self.blockTwitterShareButton && [self isTwitterShareURL:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if (self.blockTwitterTweetButton && [self isTwitterTweetURL:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    // google
    if (self.blockGoogleAnalytics && [self isGoogleAnalyticsURL:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if (self.blockGoogleDoubleClick && [self isGoogleDoubleClickURL:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    if (self.blockGooglePlusOne && [self isGooglePlusOneURL:url]) {
        LogTrace(@"Reject: %@", [self simpleUrlString:url]);
        return NO;
    }
    
    LogTrace(@"Accept: %@", [self simpleUrlString:url]);
    
    return YES;
}

#pragma mark - Facebook

- (BOOL)isFacebookLikeURL:(NSURL *)url {
    return [url.host.lowercaseString hasSuffix:@"www.facebook.com"] && [url.relativePath.lowercaseString isEqualToString:@"/plugins/like.php"];
}

- (BOOL)isFacebookConnectURL:(NSURL *)url {
    
    if ([url.host.lowercaseString hasSuffix:@"static.ak.facebook.com"] && [url.relativePath.lowercaseString isEqualToString:@"/connect/xd_arbiter.php"]) {
        return YES;
    }
    
    if ([url.host.lowercaseString hasSuffix:@"www.facebook.com"] && [url.relativePath.lowercaseString isEqualToString:@"/dialog/oauth"]) {
        return YES;
    }
    
    if ([url.host.lowercaseString hasSuffix:@"www.facebook.com"] && [url.relativePath.lowercaseString isEqualToString:@"/plugins/login_button.php"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isFacebookLikeBoxURL:(NSURL *)url {
    return [url.host.lowercaseString hasSuffix:@"facebook.com"] && [url.relativePath.lowercaseString isEqualToString:@"/plugins/likebox.php"];
}

- (BOOL)isFacebookRecomendations:(NSURL *)url {
    return [url.host.lowercaseString hasSuffix:@"facebook.com"] && [url.relativePath.lowercaseString isEqualToString:@"/plugins/recommendations.php"];
}

- (BOOL)isFacebookCommentURL:(NSURL *)url {
    return [url.host.lowercaseString hasSuffix:@"facebook.com"] && [url.relativePath.lowercaseString isEqualToString:@"/plugins/comments.php"];
}

#pragma mark - Twitter

- (BOOL)isTwitterFollowURL:(NSURL *)url {
    return [url.host.lowercaseString hasSuffix:@"platform.twitter.com"] && [url.relativePath hasPrefix:@"/widgets/follow_button"];
}

- (BOOL)isTwitterShareURL:(NSURL *)url {
    return [url.host.lowercaseString hasSuffix:@"platform.twitter.com"] && [url.relativePath hasPrefix:@"/widgets/share_button"];
}

- (BOOL)isTwitterTweetURL:(NSURL *)url {
    return [url.host.lowercaseString hasSuffix:@"platform.twitter.com"] && [url.relativePath hasPrefix:@"/widgets/tweet_button"];
}

#pragma mark - Google

- (BOOL)isGoogleAnalyticsURL:(NSURL *)url {
    return [url.host.lowercaseString hasSuffix:@"google-analytics.com"];
}

- (BOOL)isGooglePlusOneURL:(NSURL *)url {
    return [url.host.lowercaseString hasSuffix:@"plusone.google.com"];
}

- (BOOL)isGoogleDoubleClickURL:(NSURL *)url {
    return [url.host.lowercaseString hasSuffix:@"googleads.g.doubleclick.net"] && [url.relativePath.lowercaseString hasPrefix:@"/pagead/"];
}

#pragma mark - Private methods

- (NSString *)simpleUrlString:(NSURL *)url {
    return [NSString stringWithFormat:@"%@://%@%@", url.scheme, url.host, url.relativePath];
}

@end
