//
//  smkWebView.m
//  NoAdsWebView
//
//  Created by smk-dev on 24.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkWebView.h"
#import "smkCache.h"

@interface smkWebView()
@property (strong, nonatomic) id<UIWebViewDelegate> dummyWebViewDelegate;
@end

@implementation smkWebView

@synthesize urlFilter;
@synthesize dummyWebViewDelegate;
@synthesize lastLoadedUrlString;

#pragma mark - Lifecycle

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.scalesPageToFit = YES;
        
        
        
        
        super.delegate = self;
        self.urlFilter = [[smkUrlFilter alloc] init];
        
        self.urlFilter.blockFacebookLike = YES;
        self.urlFilter.blockFacebookLikeBox = YES;
        self.urlFilter.blockFacebookConnect = YES;
        self.urlFilter.blockFacebookComment = YES;
        self.urlFilter.blockFacebookRecomendations = YES;
        
        
        self.urlFilter.blockTwitterFolowButton = YES;
        self.urlFilter.blockTwitterShareButton = YES;
        self.urlFilter.blockTwitterTweetButton = YES;
        
        
        self.urlFilter.blockGoogleAnalytics = YES;
        self.urlFilter.blockGooglePlusOne = YES;
        self.urlFilter.blockGoogleDoubleClick = YES;
        
        
        int memory = 512 * 1024;
        int capacity = 10 * 1024 * 1024;
        NSString *path = @"aa";
        smkCache *cache = [[smkCache alloc] initWithMemoryCapacity:memory diskCapacity:capacity diskPath:path];
        
        [NSURLCache setSharedURLCache:cache];
        
    }
    return self;
}

- (void)dealloc {
    self.urlFilter = nil;
    self.dummyWebViewDelegate = nil;
    self.lastLoadedUrlString = nil;
}

#pragma mark - Public methods

- (void)loadRequest:(NSString *)urlString {
    
    // save url string
    self.lastLoadedUrlString = [urlString copy];
    
    // make sure that url has protocol prefix
    if (![urlString.lowercaseString hasPrefix:@"http://"] && ![urlString hasPrefix:@"https://"]) {
        urlString = [@"http://" stringByAppendingString:urlString];
    }
    
    // make URL from string
    NSURL *url = [NSURL URLWithString:urlString];
    
    // make request from URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // load request
    LogInfo(@"Started loading: %@", url);
    [super loadRequest:request];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    // filter
    BOOL result = [self.urlFilter acceptURL:request.URL];
    
    // make delegation
    if (result && self.dummyWebViewDelegate && [self.dummyWebViewDelegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]) {
        [self.dummyWebViewDelegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    
    return result;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    // make delegation
    if (self.dummyWebViewDelegate && [self.dummyWebViewDelegate respondsToSelector:@selector(webViewDidStartLoad:)]) {
        [self.dummyWebViewDelegate webViewDidStartLoad:webView];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    // not fuly loaded
    if (webView.loading) {
        return;
    }
    
    LogInfo(@"Finished loading: %@", webView.request.URL);
    
    // make delegation
    if (self.dummyWebViewDelegate && [self.dummyWebViewDelegate respondsToSelector:@selector(webViewDidFinishLoad:)]) {
        [self.dummyWebViewDelegate webViewDidFinishLoad:webView];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    LogError(@"WebView error: %@", error);
    
    // make delegation
    if (self.dummyWebViewDelegate && [self.dummyWebViewDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
        [self.dummyWebViewDelegate webView:webView didFailLoadWithError:error];
    }
}

#pragma mark - Dummy WebViewDelegate

- (id<UIWebViewDelegate>)delegate {
    return self.dummyWebViewDelegate;
}

- (void)setDelegate:(id<UIWebViewDelegate>)delegate {
    self.dummyWebViewDelegate = delegate;
}

@end
