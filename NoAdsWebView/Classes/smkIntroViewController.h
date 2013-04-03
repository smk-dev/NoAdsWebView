//
//  smkIntroViewController.h
//  NoAdsWebView
//
//  Created by smk-dev on 01.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "smkButton.h"

@interface smkIntroViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet smkButton *githubButton;

- (IBAction)githubButtonAction:(id)sender;

@end
