//
//  smkSettingsViewController.h
//  NoAdsWebView
//
//  Created by smk-dev on 01.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface smkSettingsViewController : UIViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)turnAllOnAction:(id)sender;
- (IBAction)turnAllOffAction:(id)sender;

@end
