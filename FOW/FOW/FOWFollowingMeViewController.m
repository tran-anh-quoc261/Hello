//
//  FOWFollowingMeViewController.m
//  FOW
//
//  Created by Anh Quoc on 11/11/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWFollowingMeViewController.h"
#import "FOWFollowerModel.h"

@interface FOWFollowingMeViewController ()

@end

@implementation FOWFollowingMeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"My Followers"];
    [self performSelector:@selector(dataTest) withObject:nil afterDelay:1];
    [self showWaitingViewWhenLoading];
}

- (void)viewDidUnload {
    _indicatorView = nil;
    _activityIndicator = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data and API Area
- (void)dataTest {
    self.arrayFollower = [[NSMutableArray alloc] init];
    
    FOWFollowerModel *object0 = [[FOWFollowerModel alloc] init];
    [object0 setUsername:[NSString stringWithFormat:@"%d", 1]];
    [object0 setNumberFollowers:[NSString stringWithFormat:@"%d", 1]];
    [object0 setNumberFollowings:[NSString stringWithFormat:@"%d", 1]];
    [object0 setNumberOfPosts:[NSString stringWithFormat:@"%d", 1]];
    [object0 setImage_avatar_url:@"http://t3.gstatic.com/images?q=tbn:ANd9GcTuN2qL_o18f76O_hoB1LEebnKZ1ZSNxJkE63opZsxotY7eQPV6"];
    [self.arrayFollower addObject:object0];
    
    FOWFollowerModel *object1 = [[FOWFollowerModel alloc] init];
    [object1 setUsername:[NSString stringWithFormat:@"%d", 2]];
    [object1 setNumberFollowers:[NSString stringWithFormat:@"%d", 2]];
    [object1 setNumberFollowings:[NSString stringWithFormat:@"%d", 2]];
    [object1 setNumberOfPosts:[NSString stringWithFormat:@"%d", 2]];
    [object1 setImage_avatar_url:@"http://img.tamtay.vn/files/photo2/2009/12/13/22/667336/4b250b44_206f6946_25.jpg"];
    [self.arrayFollower addObject:object1];
    
    FOWFollowerModel *object2 = [[FOWFollowerModel alloc] init];
    [object2 setUsername:[NSString stringWithFormat:@"%d", 3]];
    [object2 setNumberFollowers:[NSString stringWithFormat:@"%d", 3]];
    [object2 setNumberFollowings:[NSString stringWithFormat:@"%d", 3]];
    [object2 setNumberOfPosts:[NSString stringWithFormat:@"%d", 3]];
    [object2 setImage_avatar_url:@"http://img.photo.yume.vn/photo/pictures/20090730/tams2linh/origin/images1544670-sad-396666.jpg"];
    [self.arrayFollower addObject:object2];
    
    FOWFollowerModel *object3 = [[FOWFollowerModel alloc] init];
    [object3 setUsername:[NSString stringWithFormat:@"%d", 4]];
    [object3 setNumberFollowers:[NSString stringWithFormat:@"%d", 4]];
    [object3 setNumberFollowings:[NSString stringWithFormat:@"%d", 4]];
    [object3 setNumberOfPosts:[NSString stringWithFormat:@"%d", 4]];
    [object3 setImage_avatar_url:@"http://t1.gstatic.com/images?q=tbn:ANd9GcQtL1RbydkfM0bhsOhzhD46318x2V-Q94BXNR5tBM1bzChZV94nPg"];
    [self.arrayFollower addObject:object3];
    
    FOWFollowerModel *object4 = [[FOWFollowerModel alloc] init];
    [object4 setUsername:[NSString stringWithFormat:@"%d", 5]];
    [object4 setNumberFollowers:[NSString stringWithFormat:@"%d", 5]];
    [object4 setNumberFollowings:[NSString stringWithFormat:@"%d", 5]];
    [object4 setNumberOfPosts:[NSString stringWithFormat:@"%d", 5]];
    [object4 setImage_avatar_url:@"http://i188.photobucket.com/albums/z269/hoanglong7/462958dd2uycoyg0-1.jpg"];
    [self.arrayFollower addObject:object4];
    
    FOWFollowerModel *object5 = [[FOWFollowerModel alloc] init];
    [object5 setUsername:[NSString stringWithFormat:@"%d", 6]];
    [object5 setNumberFollowers:[NSString stringWithFormat:@"%d", 6]];
    [object5 setNumberFollowings:[NSString stringWithFormat:@"%d", 6]];
    [object5 setNumberOfPosts:[NSString stringWithFormat:@"%d", 6]];
    [object5 setImage_avatar_url:@"http://i486.photobucket.com/albums/rr230/yuc9x/07102423409205.jpg"];
    [self.arrayFollower addObject:object5];
    
    FOWFollowerModel *object6 = [[FOWFollowerModel alloc] init];
    [object6 setUsername:[NSString stringWithFormat:@"%d", 7]];
    [object6 setNumberFollowers:[NSString stringWithFormat:@"%d", 7]];
    [object6 setNumberFollowings:[NSString stringWithFormat:@"%d", 7]];
    [object6 setNumberOfPosts:[NSString stringWithFormat:@"%d", 7]];
    [object6 setImage_avatar_url:@"http://truongton.net/forum/imagehosting/5806844aa25a614b5d0.jpg"];
    [self.arrayFollower addObject:object6];
    
    FOWFollowerModel *object7 = [[FOWFollowerModel alloc] init];
    [object7 setUsername:[NSString stringWithFormat:@"%d", 8]];
    [object7 setNumberFollowers:[NSString stringWithFormat:@"%d", 8]];
    [object7 setNumberFollowings:[NSString stringWithFormat:@"%d", 8]];
    [object7 setNumberOfPosts:[NSString stringWithFormat:@"%d", 8]];
    [object7 setImage_avatar_url:@"http://api.ning.com/files/ue5aMBz0mAjZcm8pC9HGlmjX*vx5P*KYBvB9D74ADyg8QorUBmCS*UcjphQmKiL0Fzefxx6cc2dwIaQI2NQ3McUhaS*vnqUO/sad47.jpg"];
    [self.arrayFollower addObject:object7];
    
    FOWFollowerModel *object8 = [[FOWFollowerModel alloc] init];
    [object8 setUsername:[NSString stringWithFormat:@"%d", 9]];
    [object8 setNumberFollowers:[NSString stringWithFormat:@"%d", 9]];
    [object8 setNumberFollowings:[NSString stringWithFormat:@"%d", 9]];
    [object8 setNumberOfPosts:[NSString stringWithFormat:@"%d", 9]];
    [object8 setImage_avatar_url:@"http://www.taochu.com/pictures/love/taochu.com_love252.jpg"];
    [self.arrayFollower addObject:object8];
    
    FOWFollowerModel *object9 = [[FOWFollowerModel alloc] init];
    [object9 setUsername:[NSString stringWithFormat:@"%d", 10]];
    [object9 setNumberFollowers:[NSString stringWithFormat:@"%d", 10]];
    [object9 setNumberFollowings:[NSString stringWithFormat:@"%d", 10]];
    [object9 setNumberOfPosts:[NSString stringWithFormat:@"%d", 10]];
    [object9 setImage_avatar_url:@"http://i181.photobucket.com/albums/x58/blackisrad/alone.jpg"];
    [self.arrayFollower addObject:object9];
    
    self.totalCurrentItems = [self.arrayFollower count];
    self.totalItems = self.totalCurrentItems + 1;
    
    [self.tableView reloadData];
    [self hideWaitingViewWhenDidLoad];
}

// function load more call
- (void)fowTableViewLoadMore:(UITableView *)tableView { 
    
}

#pragma mark - FOWFollowersViewCellDelegate Button Follow
- (void)buttonActionFollow:(NSIndexPath *)indexPath {
    
}

@end
