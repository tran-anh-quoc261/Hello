//
//  FOWEditViewController.m
//  FOW
//
//  Created by Anh Quoc on 10/30/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWEditViewController.h"

@interface FOWEditViewController ()

@end

@implementation FOWEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image {
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(barButtonAction:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

@end
