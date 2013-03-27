//
//  smkUrlFilter.h
//  NoAdsWebView
//
//  Created by Seba on 26.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface smkUrlFilter : NSObject

// Facebook
@property (nonatomic, assign) BOOL blockFacebookLike;
@property (nonatomic, assign) BOOL blockFacebookLikeBox;
@property (nonatomic, assign) BOOL blockFacebookConnect;

// Google
@property (nonatomic, assign) BOOL blockGooglePlus;
@property (nonatomic, assign) BOOL blockGoogleAnalytics;

// Twitter
@property (nonatomic, assign) BOOL blockTwitterFolow;

- (BOOL)acceptURL:(NSURL *)url;

@end
