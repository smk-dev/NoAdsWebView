//
//  smkSettingsViewController.m
//  NoAdsWebView
//
//  Created by smk-dev on 01.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkSettingsViewController.h"
#import "smkSettingsCell.h"
#import "smkUrlFilter.h"
#import "smkAppDelegate.h"

#define kCellID @"CELL_ID"

@interface smkSettingsViewController() {
    smkUrlFilter *urlFilter;
    NSArray *sectionTitles;
    NSInteger cellCount[4];
}

- (void)updateUrlFilter:(BOOL)value;

@end

@implementation smkSettingsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    urlFilter = [(smkAppDelegate *)[UIApplication sharedApplication].delegate urlFilter];
    sectionTitles = [[NSArray alloc] initWithObjects:@"Facebook", @"Twitter", @"Google", @"Other", nil];
    // number of cells in sections
    cellCount[0] = 5;
    cellCount[1] = 3;
    cellCount[2] = 3;
    cellCount[3] = 2;
}

- (void)dealloc {
    urlFilter = nil;
    sectionTitles = nil;
    free(cellCount);
}

#pragma mark - UITableViewDataSourceDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cellCount[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // configure cell
    smkSettingsCell* cell = (smkSettingsCell *)[tableView dequeueReusableCellWithIdentifier:kCellID forIndexPath:indexPath];
    cell.titleLabel.text = @"";
    cell.switchButton.on = NO;
    cell.urlFilter = urlFilter;
    cell.urlFilterKey = nil;
    
    switch (indexPath.section) {
        // Facebook section
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.titleLabel.text = @"Block Like Button";
                    cell.switchButton.on = urlFilter.blockFacebookLike;
                    cell.urlFilterKey = @"blockFacebookLike";
                    break;
                    
                case 1:
                    cell.titleLabel.text = @"Block Comments";
                    cell.switchButton.on = urlFilter.blockFacebookComment;
                    cell.urlFilterKey = @"blockFacebookComment";
                    break;
                    
                case 2:
                    cell.titleLabel.text = @"Block Connect";
                    cell.switchButton.on = urlFilter.blockFacebookConnect;
                    cell.urlFilterKey = @"blockFacebookConnect";
                    break;
                    
                case 3:
                    cell.titleLabel.text = @"Block Like Box";
                    cell.switchButton.on = urlFilter.blockFacebookLikeBox;
                    cell.urlFilterKey = @"blockFacebookLikeBox";
                    break;
                    
                case 4:
                    cell.titleLabel.text = @"Block Recomendations";
                    cell.switchButton.on = urlFilter.blockFacebookRecomendations;
                    cell.urlFilterKey = @"blockFacebookRecomendations";
                    break;
                    
                default:
                    break;
            }
            break;
            
        // Twitter section
        case 1:
            switch (indexPath.row) {
                case 0:
                    cell.titleLabel.text = @"Block Follow Button";
                    cell.switchButton.on = urlFilter.blockTwitterFolowButton;
                    cell.urlFilterKey = @"blockTwitterFolowButton";
                    break;
                    
                case 1:
                    cell.titleLabel.text = @"Block Share Button";
                    cell.switchButton.on = urlFilter.blockTwitterShareButton;
                    cell.urlFilterKey = @"blockTwitterShareButton";
                    break;
                    
                case 2:
                    cell.titleLabel.text = @"Block Tweet Button";
                    cell.switchButton.on = urlFilter.blockTwitterTweetButton;
                    cell.urlFilterKey = @"blockTwitterTweetButton";
                    break;
                    
                default:
                    break;
            }
            break;
            
        // Google section
        case 2:
            switch (indexPath.row) {
                case 0:
                    cell.titleLabel.text = @"Block Google Analytics";
                    cell.switchButton.on = urlFilter.blockGoogleAnalytics;
                    cell.urlFilterKey = @"blockGoogleAnalytics";
                    break;
                    
                case 1:
                    cell.titleLabel.text = @"Block DoubleClick";
                    cell.switchButton.on = urlFilter.blockGoogleDoubleClick;
                    cell.urlFilterKey = @"blockGoogleDoubleClick";
                    break;
                    
                case 2:
                    cell.titleLabel.text = @"Block Google+";
                    cell.switchButton.on = urlFilter.blockGooglePlusOne;
                    cell.urlFilterKey = @"blockGooglePlusOne";
                    break;
                    
                default:
                    break;
            }
            break;
            
        // Other section
        case 3:
            switch (indexPath.row) {
                case 0:
                    cell.titleLabel.text = @"Block Images";
                    cell.switchButton.on = urlFilter.blockImages;
                    cell.urlFilterKey = @"blockImages";
                    break;
                    
                case 1:
                    cell.titleLabel.text = @"Block JavaScript";
                    cell.switchButton.on = urlFilter.blockJavaScript;
                    cell.urlFilterKey = @"blockJavaScript";
                    break;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [sectionTitles objectAtIndex:section];
}

- (IBAction)ssss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Actions

- (IBAction)turnAllOnAction:(id)sender {
    [self updateUrlFilter:YES];
    [self.tableView reloadData];
}

- (IBAction)turnAllOffAction:(id)sender {
    [self updateUrlFilter:NO];
    [self.tableView reloadData];
}

#pragma mark - Private methods

- (void)updateUrlFilter:(BOOL)value {
    
    LogTrace(@"All URL filter options are %@", (value ? @"ON" : @"OFF"));
    
    // Facebook
    urlFilter.blockFacebookComment = value;
    urlFilter.blockFacebookConnect = value;
    urlFilter.blockFacebookLike = value;
    urlFilter.blockFacebookLikeBox = value;
    urlFilter.blockFacebookRecomendations = value;
    
    // Twitter
    urlFilter.blockTwitterFolowButton = value;
    urlFilter.blockTwitterShareButton = value;
    urlFilter.blockTwitterTweetButton = value;
    
    // Google
    urlFilter.blockGoogleAnalytics = value;
    urlFilter.blockGoogleDoubleClick = value;
    urlFilter.blockGooglePlusOne = value;
    
    // Other
    urlFilter.blockImages = value;
    urlFilter.blockJavaScript = value;
}

@end
