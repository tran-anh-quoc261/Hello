//
//  FOWListFollowerViewController.m
//  FOW
//
//  Created by Anh Quoc on 11/8/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWListFollowerViewController.h"
#import "FOWFollowerModel.h"

#define kTag_CustomViewCell         100

@interface FOWListFollowerViewController ()

@end

@implementation FOWListFollowerViewController
@synthesize arrayFollower = _arrayFollower;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    [self.tableView setSeparatorColor:[UIColor clearColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    for (NSInteger i = 0; i < [_arrayFollower count]; i++) {
        
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (_totalCurrentItems > _totalItems) {
        return _totalCurrentItems;
    }
    
    if (_totalItems == 0) {
        return _totalItems;
    }
    if (_totalCurrentItems == _totalItems) {
        return _totalItems;
    }
    return _totalCurrentItems + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < _totalCurrentItems) {
        return 125.0f;
    } else if (_totalCurrentItems < _totalItems) {
        return 50.0f;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < _totalCurrentItems) {
        static NSString *CellIdentifier = @"CellFollower";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        _viewCell = (FOWFollowersViewCell*)[cell viewWithTag:kTag_CustomViewCell];
        if (!_viewCell) {
            _viewCell = [FOWUtils loadView:[FOWFollowersViewCell class] FromNib:@"FOWFollowersViewCell"];
            [_viewCell setTag:kTag_CustomViewCell];
            [_viewCell setDelegate:self];
            [cell addSubview:_viewCell];
        }
        // Configure the cell...
        
        FOWFollowerModel *model = [self.arrayFollower objectAtIndex:[indexPath row]];
        [_viewCell.lblUserName setText:model.username];
        [_viewCell.lblFollower setText:model.numberFollowers];
        [_viewCell.lblFollowing setText:model.numberFollowings];
        [_viewCell.lblNumberOfPost setText:model.numberOfPosts];
        [_viewCell setImage_avatar_url:model.image_avatar_url];
        [_viewCell configView];
        [_viewCell setIndexPath:indexPath];
        
        return cell;
    } else if (_totalCurrentItems < _totalItems) {
        NSString *CellIdentifier = @"CellLoadMore";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            _loadMoreCell = [FOWUtils loadView:[FOWLoadMoreViewCell class] FromNib:@"FOWLoadMoreViewCell"];
            [cell.contentView addSubview:_loadMoreCell];
            cell.accessoryView = nil;
        }
        [_loadMoreCell.atvloadMore startAnimating];
        [self fowTableViewLoadMore:self.tableView];
        return cell;

    }
    return nil;
}

- (void)fowTableViewLoadMore:(UITableView *)tableView {}

#pragma mark - Indicator When loading
- (void)addActivityIndicator {
    CGRect activityIndicatorFrame = CGRectMake(0, 0, 20.0, 20.0);
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:activityIndicatorFrame];
    _activityIndicator.backgroundColor = [UIColor clearColor];
    _activityIndicator.color = [UIColor darkGrayColor];
    _activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [_indicatorView addSubview:_activityIndicator];
}

- (void)showWaitingViewWhenLoading {
    [self.tableView setScrollEnabled:NO];
    if (!_indicatorView) {
        CGRect frameView = [self.tableView bounds];
        frameView.size.height = [FOWUtils getMainView].frame.size.height - 64.0f;
        _indicatorView = [[UIView alloc] initWithFrame:frameView];
        _indicatorView.backgroundColor = [UIColor whiteColor];
        
        [self addActivityIndicator];
        [_activityIndicator startAnimating];
        [_activityIndicator setCenter:CGPointMake(_indicatorView.frame.size.width/2, _indicatorView.frame.size.height/2 - _activityIndicator.frame.size.height)];
        [self.view addSubview:_indicatorView];
    } else {
        [_activityIndicator startAnimating];
        [_activityIndicator setHidesWhenStopped:NO];
        [_indicatorView setHidden:NO];
        [self.view addSubview:_indicatorView];
    }
}

- (void)hideWaitingViewWhenDidLoad {
    [self.tableView setScrollEnabled:YES];
    [_activityIndicator stopAnimating];
    if (_indicatorView) {
        [_indicatorView setHidden:YES];
        [_indicatorView removeFromSuperview];
    }
    if (_activityIndicator) {
        [_activityIndicator setHidesWhenStopped:YES];
    }
}

#pragma mark - FOWFollowersViewCellDelegate Button Follow
- (void)buttonActionFollow:(NSIndexPath *)indexPath {}

@end
