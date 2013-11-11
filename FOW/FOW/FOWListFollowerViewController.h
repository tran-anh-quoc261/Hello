//
//  FOWListFollowerViewController.h
//  FOW
//
//  Created by Anh Quoc on 11/8/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FOWFollowersViewCell.h"

@interface FOWListFollowerViewController : UITableViewController {
    NSMutableArray *_arrayFollower;
    FOWFollowersViewCell *viewCell;
}

@property (nonatomic, strong) NSMutableArray *arrayFollower;

@end
