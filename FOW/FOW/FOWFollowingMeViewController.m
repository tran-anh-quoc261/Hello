//
//  FOWFollowingMeViewController.m
//  FOW
//
//  Created by Anh Quoc on 11/11/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWFollowingMeViewController.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FOWFollowersViewCellDelegate Button Follow
- (void)buttonActionFollow {
    
}

@end
