//
//  smkWebView.h
//  NoAdsWebView
//
//  Created by smk-dev on 24.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "smkUrlFilter.h"

@interface smkWebView : UIWebView<UIWebViewDelegate>

@property (strong, nonatomic) smkUrlFilter *urlFilter;
@property (strong, nonatomic) NSString *lastLoadedUrlString;

- (void)loadRequest:(NSString *)urlString;

@end
