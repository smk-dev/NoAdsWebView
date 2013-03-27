//
//  smkUrlFilter.h
//  NoAdsWebView
//
//  Created by Seba on 26.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface smkUrlFilter : NSObject

@property (nonatomic, assign) BOOL blockFacebookLike;

- (BOOL)acceptURL:(NSURL *)url;

@end
