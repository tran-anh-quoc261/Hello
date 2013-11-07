//
//  FOWNavigationController.m
//  FOW
//
//  Created by Anh Quoc on 10/31/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWNavigationController.h"

@interface FOWNavigationController ()

@end

@implementation FOWNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_topBar.png"] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *topShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20 + 44, 320, 4)];
    [topShadow setImage:[UIImage imageNamed:@"bg_shadow_topBar.png"]];
    [self.view addSubview:topShadow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
