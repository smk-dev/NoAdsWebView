//
//  smkWebViewController.m
//  NoAdsWebView
//
//  Created by smk-dev on 24.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkWebViewController.h"

@implementation smkWebViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    // assign delegate
    self.urlTextField.delegate = self;
    self.webView.delegate = self;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // resign responder
    [textField resignFirstResponder];
    
    // get typed text
    NSString *urlString = textField.text;
    
    // check if user typed something
    if (urlString.length > 0) {
        
        // make URL from string
        NSURL *url = [NSURL URLWithString:urlString];
        
        // make request from URL
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // load request
        [self.webView loadRequest:request];
    }
    
    // hide keyboard
    return YES;
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"start");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSLog(@"done");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    LogError(@"WebView error: %@", error);
}

#pragma mark - Actions

- (IBAction)reloadButtonAction:(id)sender {
    
}

@end
