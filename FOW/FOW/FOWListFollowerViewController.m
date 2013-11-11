//
//  FOWListFollowerViewController.m
//  FOW
//
//  Created by Anh Quoc on 11/8/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWListFollowerViewController.h"

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
//    return [_arrayFollower count];
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 125.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellFollower";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        viewCell = [FOWUtils loadView:[FOWFollowersViewCell class] FromNib:@"FOWFollowersViewCell"];
        [viewCell setDelegate:self];
        // Configure the cell...
        
        
        [cell addSubview:viewCell];
    }
    return cell;
}

#pragma mark - FOWFollowersViewCellDelegate Button Follow
- (void)buttonActionFollow {}

@end
