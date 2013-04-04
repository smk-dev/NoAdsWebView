//
//  smkWebViewController.m
//  NoAdsWebView
//
//  Created by smk-dev on 24.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkWebViewController.h"
#import "smkAppDelegate.h"

@interface smkWebViewController()

- (NSString *)encodeString:(NSString *)string;
- (void)layoutToolbar:(UIInterfaceOrientation)orientation;
- (void)updateNavigationButtons;

@end

@implementation smkWebViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    // assign url filter
    self.webView.urlFilter = [(smkAppDelegate *)[UIApplication sharedApplication].delegate urlFilter];
    
    // update buttons
    [self updateNavigationButtons];
}

- (void)dealloc {
    self.webView.urlFilter = nil;
}

#pragma mark - Rotation

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    // handle layout
    [self layoutToolbar:[UIApplication sharedApplication].statusBarOrientation];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    // handle layout
    [self layoutToolbar:[UIApplication sharedApplication].statusBarOrientation];
    
    self.webView.userInteractionEnabled = NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    // handle layout
    [self layoutToolbar:[UIApplication sharedApplication].statusBarOrientation];

    self.webView.userInteractionEnabled = YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // resign responder
    [textField resignFirstResponder];
    
    // get typed text
    NSString *urlString = [self encodeString:textField.text];
    
    // check if user typed something
    if (urlString.length > 0) {
        
        // load request
        [self.webView loadRequest:urlString];
    }
    
    // hide keyboard
    return YES;
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // update text field
    self.urlTextField.text = webView.request.URL.absoluteString;
    
    // update buttons
    [self updateNavigationButtons];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    // host not found - use google
    if (error.code == -1003) {
        NSString *query = [self encodeString:self.webView.lastLoadedUrlString];
        [self.webView loadRequest:[@"https://google.com/search?q=" stringByAppendingString:query]];
    }
}

#pragma mark - Actions

- (IBAction)reloadButtonAction:(id)sender {
    [self.webView reload];
}

- (IBAction)previousButtonAction:(id)sender {
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}

- (IBAction)nextButtonAction:(id)sender {
    if (self.webView.canGoForward) {
        [self.webView goForward];
    }
}

#pragma mark - Private methods

- (NSString *)encodeString:(NSString *)string {
	return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, CFSTR("%"), CFSTR(":/=,!$&'()*+;[]@#?"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
}

- (void)layoutToolbar:(UIInterfaceOrientation)orientation {
    
    // current frame
    CGRect screenSize = [UIScreen mainScreen].bounds;
    __block CGRect newFrame = self.toolbar.frame;
    
    // portrait
    if (UIDeviceOrientationIsPortrait(orientation)) {
        
        // resize
        if (self.urlTextField.isFirstResponder) {
            
            // animation
            [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
                newFrame.size.width = screenSize.size.height;
                self.toolbar.frame = newFrame;
            } completion:nil];
        } else {
            // normal size
            [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
                newFrame.size.width = screenSize.size.width;
                self.toolbar.frame = newFrame;
            } completion:nil];
        }
        
    } else {
        // landscape
        if (self.urlTextField.isFirstResponder) {
            // animation
            [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
                newFrame.size.width = screenSize.size.height;
                self.toolbar.frame = newFrame;
            } completion:nil];
        }
    }
}

- (void)updateNavigationButtons {
    self.previousButton.enabled = self.webView.canGoBack;
    self.nextButton.enabled = self.webView.canGoForward;
}

@end
