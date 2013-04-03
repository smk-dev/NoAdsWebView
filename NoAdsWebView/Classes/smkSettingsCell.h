//
//  smkSettingsCell.h
//  NoAdsWebView
//
//  Created by smk-dev on 01.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "smkUrlFilter.h"

@interface smkSettingsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *switchButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) smkUrlFilter *urlFilter;
@property (strong, nonatomic) NSString *urlFilterKey;

- (IBAction)switchDidChanged:(id)sender;

@end
