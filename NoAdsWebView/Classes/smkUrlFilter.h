//
//  smkUrlFilter.h
//  NoAdsWebView
//
//  Created by smk-dev on 26.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface smkUrlFilter : NSObject

// Facebook
@property (nonatomic, assign) BOOL blockFacebookLike;
@property (nonatomic, assign) BOOL blockFacebookLikeBox;
@property (nonatomic, assign) BOOL blockFacebookConnect;
@property (nonatomic, assign) BOOL blockFacebookComment;
@property (nonatomic, assign) BOOL blockFacebookRecomendations;

// Google
@property (nonatomic, assign) BOOL blockGooglePlusOne;
@property (nonatomic, assign) BOOL blockGoogleAnalytics;
@property (nonatomic, assign) BOOL blockGoogleDoubleClick;

// Twitter
@property (nonatomic, assign) BOOL blockTwitterFolowButton;
@property (nonatomic, assign) BOOL blockTwitterShareButton;
@property (nonatomic, assign) BOOL blockTwitterTweetButton;

// Other
@property (nonatomic, assign) BOOL blockImages;
@property (nonatomic, assign) BOOL blockJavaScript;

- (BOOL)acceptURL:(NSURL *)url;

@end
