//
//  smkWebViewController.m
//  NoAdsWebView
//
//  Created by smk-dev on 24.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkWebViewController.h"
#import "smkAppDelegate.h"

@implementation smkWebViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    // assign delegate
    self.urlTextField.delegate = self;
    self.webView.delegate = self;
    
    // assign url filter
    self.webView.urlFilter = [(smkAppDelegate *)[UIApplication sharedApplication].delegate urlFilter];
    
    
    
    
    
    [self.view bringSubviewToFront:self.toolbarFirst];
    
    
    // hide by default
    //[self hideToolbar];
    
    
    
    
}

- (void)hideToolbar {
    
    
    CGRect oldFrame = self.webView.frame;
    oldFrame.origin.y = self.toolbarSecond.frame.origin.y;
    
    CGRect aa = self.toolbarSecond.frame;
    aa.origin.y = 0;
    
    // animation
    [UIView animateWithDuration:0.3f animations:^{
        
        self.toolbarSecond.frame = aa;
        
        self.webView.frame = oldFrame;
        
    } completion:^(BOOL finished) {
        self.toolbarSecond.alpha = 0;
    }];
}

- (void)showToolbar {
    
    
    CGRect oldFrame = self.webView.frame;
    oldFrame.origin.y = 2 * self.toolbarSecond.frame.size.height;
    
    CGRect aa = self.toolbarSecond.frame;
    aa.origin.y = self.toolbarSecond.frame.size.height;
    
    [UIView animateWithDuration:0.3f animations:^{
        self.toolbarSecond.alpha = 1;
        
        
        self.toolbarSecond.frame = aa;
        self.webView.frame = oldFrame;
    }];
    
    //self.showToolbarButton.image =
    
    
    
    CGRect aaaa = self.tabBarController.tabBar.frame;
    //aaaa.origin.y = ;
    
    self.tabBarController.tabBar.frame = aaaa;
    
}

#pragma mark - Rotation

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    
    
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    NSLog(@"# %d", textField.isFirstResponder);
    
    // in portrait
    if (UIDeviceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        
        //resize toolbar
        CGRect screenSize = [UIScreen mainScreen].bounds;
        CGRect newFrame = self.toolbarFirst.frame;
        newFrame.size.width = screenSize.size.height;
        
        // animation
        [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.toolbarFirst.frame = newFrame;
        } completion:nil];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSLog(@"# %d", textField.isFirstResponder);
    
    
    // in portrait
    if (UIDeviceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        
        //resize toolbar
        CGRect screenSize = [UIScreen mainScreen].bounds;
        CGRect newFrame = self.toolbarFirst.frame;
        newFrame.size.width = screenSize.size.width;
        
        // animation
        [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.toolbarFirst.frame = newFrame;
        } completion:nil];
    }
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
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    // host not found - use google
    if (error.code == -1003) {
        NSString *query = [self encodeString:self.webView.lastLoadedUrlString];
        [self.webView loadRequest:[@"https://google.com/search?q=" stringByAppendingString:query]];
    }
}

#pragma mark - Actions

- (IBAction)toggleToolbarAction:(id)sender {
    if (self.toolbarSecond.alpha == 0.0f) {
        [self showToolbar];
    } else {
        [self hideToolbar];
    }
}

- (IBAction)reloadButtonAction:(id)sender {
    
}

#pragma mark - Private methods

- (NSString *)encodeString:(NSString *)string {
	return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, CFSTR("%"), CFSTR(":/=,!$&'()*+;[]@#?"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
}

- (void)layoutToolbar {
    
    if (self.urlTextField.isFirstResponder) {
        
    } else {
        
    }
}

@end
