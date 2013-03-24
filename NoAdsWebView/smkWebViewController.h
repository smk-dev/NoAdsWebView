//
//  smkWebViewController.h
//  NoAdsWebView
//
//  Created by Seba on 24.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "smkWebView.h"

@interface smkWebViewController : UIViewController<UITextFieldDelegate, UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet smkWebView *webView;

- (IBAction)reloadButtonAction:(id)sender;

@end
