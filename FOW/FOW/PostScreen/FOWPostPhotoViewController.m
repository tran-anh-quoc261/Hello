//
//  FOWPostPhotoViewController.m
//  FOW
//
//  Created by Anh Quoc on 10/31/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWPostPhotoViewController.h"
#import "FOWMainViewCell.h"
#import "FOWTitleViewCell.h"

@interface FOWPostPhotoViewController ()

@end

@implementation FOWPostPhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"Post Photo"];
    [self setupGUI];
}

- (void)dealloc {
    DEBUG_LOG(@"Dealloc");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupGUI {
    _dataSource = [[NSMutableArray alloc] init];
    
    NSMutableArray *section0 = [[NSMutableArray alloc] init];
    FOWMainViewCell *cell0_1 = [FOWUtils loadView:[FOWMainViewCell class] FromNib:@"FOWMainViewCell"];
    [section0 addObject:cell0_1];
    
    [_dataSource addObject:section0];
    
    NSMutableArray *section1 = [[NSMutableArray alloc] init];
    FOWTitleViewCell *cell1_1 = [FOWUtils loadView:[FOWTitleViewCell class] FromNib:@"FOWTitleViewCell"];
    [section1 addObject:cell1_1];
    
    [_dataSource addObject:section1];
    
//    NSMutableArray *section2 = [[NSMutableArray alloc] init];
    
//    NSMutableArray *section3 = [[NSMutableArray alloc] init];
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [_dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[_dataSource objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FOWViewCell *cell = [[_dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    [cell caliculateHeight];
    return [cell getHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Configure the cell...
    FOWViewCell *customCell = (FOWViewCell*)[[_dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    [cell addSubview:customCell];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            
            break;
            
        case 1:
            return @"Title";
            
        case 2:
            
            return @"Categories";
            
        case 3:
            
            return @"Social";
            
        default:
            break;
    }
    
    return nil;
}

@end
