//
//  FOWListFollowerViewController.h
//  FOW
//
//  Created by Anh Quoc on 11/8/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FOWFollowersViewCell.h"
#import "FOWLoadMoreViewCell.h"

@interface FOWListFollowerViewController : UITableViewController <FOWFollowersViewCellDelegate> {
    NSMutableArray              *_arrayFollower;
    FOWFollowersViewCell        *_viewCell;
    UIView                      *_indicatorView;
    UIActivityIndicatorView     *_activityIndicator;
    NSInteger                   _totalCurrentItems;
    NSInteger                   _totalItems;
    FOWLoadMoreViewCell         *_loadMoreCell;
}

@property (nonatomic, strong) NSMutableArray *arrayFollower;
@property (nonatomic, assign) NSInteger totalCurrentItems;
@property (nonatomic, assign) NSInteger totalItems;

- (void)showWaitingViewWhenLoading;
- (void)hideWaitingViewWhenDidLoad;
- (void)fowTableViewLoadMore:(UITableView *)tableView;


@end
