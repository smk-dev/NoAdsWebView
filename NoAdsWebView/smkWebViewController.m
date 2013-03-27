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
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // resign responder
    [textField resignFirstResponder];
    
    // get typed text
    NSString *urlString = textField.text;
    
    // check if user typed something
    if (urlString.length > 0) {
        
        // load request
        [self.webView loadRequest:urlString];
    }
    
    // hide keyboard
    return YES;
}

#pragma mark - Actions

- (IBAction)reloadButtonAction:(id)sender {
    
}

@end
