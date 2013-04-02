//
//  smkWebViewController.h
//  NoAdsWebView
//
//  Created by smk-dev on 24.03.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "smkWebView.h"

@interface smkWebViewController : UIViewController<UITextFieldDelegate, UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet smkWebView *webView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *previousButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reloadButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *showToolbarButton;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbarFirst;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbarSecond;




- (IBAction)toggleToolbarAction:(id)sender;


@end
