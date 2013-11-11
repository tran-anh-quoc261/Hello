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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!viewCell) {
        viewCell = [FOWUtils loadView:[FOWFollowersViewCell class] FromNib:@"FOWFollowersViewCell"];
        [viewCell caliculateHeight];
    }
    
    return [viewCell getHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellFollower";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        viewCell = [FOWUtils loadView:[FOWFollowersViewCell class] FromNib:@"FOWFollowersViewCell"];
        [cell addSubview:viewCell];
    }
    
    // Configure the cell...
    return cell;
}

/*
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 */

@end
