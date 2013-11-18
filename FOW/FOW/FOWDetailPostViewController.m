//
//  FOWDetailPostViewController.m
//  FOW
//
//  Created by Anh Quoc on 11/14/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWDetailPostViewController.h"
#import "FOWDetailMainViewCell.h"
#import "FOWDetailActionViewCell.h"
#import "FOWDetailDescriptionViewCell.h"
#import "FOWManagerFacebookProcess.h"

#define kButtonLeft                 100
#define kButtonRight                101
#define kButtonAddPhoto             102
#define kButtonShowPhoto1           103
#define kButtonShowPhoto2           104
#define kButtonShowPhoto3           105
#define kButtonShowPhoto4           106
#define kButtonShowPhoto5           107
#define kButtonChooseCategory       108
#define kButtonActiveFacebook       109

@interface FOWDetailPostViewController () {
    
}

@end

@implementation FOWDetailPostViewController

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
    [self.navigationItem setTitle:@"Title of Post"];
    
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    _dataSource = [[NSMutableArray alloc] init];
    
    FOWDetailMainViewCell *cell0 = [FOWUtils loadView:[FOWDetailMainViewCell class] FromNib:@"FOWDetailMainViewCell"];
    [_dataSource addObject:cell0];
    
    FOWDetailActionViewCell *cell1 = [FOWUtils loadView:[FOWDetailActionViewCell class] FromNib:@"FOWDetailActionViewCell"];
    [_dataSource addObject:cell1];
    
    FOWDetailDescriptionViewCell *cell2 = [FOWUtils loadView:[FOWDetailDescriptionViewCell class] FromNib:@"FOWDetailDescriptionViewCell"];
    [_dataSource addObject:cell2];
}

#pragma mark - Private method Helper
- (void)hideKeyboard:(id)sender {
    [FOWUtils hideKeyboard:self.view];
}

#pragma mark - Data and API Area


#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_dataSource count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FOWViewCell *cell = [_dataSource objectAtIndex:indexPath.row];
    [cell caliculateHeight];
    return [cell getHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Configure the cell...
    FOWViewCell *customCell = (FOWViewCell*)[_dataSource objectAtIndex:indexPath.row];
    [cell addSubview:customCell];
    
    return cell;
}

#pragma mark - Button Action
- (void)buttonAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    switch (button.tag) {
        case 0: {
            
            break;
        }
            
        default:
            break;
    }
    
}


@end
