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
#import "FOWCategoryViewCell.h"
#import "FOWNomalViewCell.h"

#define kButtonLeft                 100
#define kButtonRight                101
#define kButtonAddPhoto             102

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
    [self.navigationItem setHidesBackButton:YES];
    gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    [self setupGUI];
}

- (void)dealloc {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupGUI {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" 
                                                                   style:UIBarButtonItemStyleBordered 
                                                                  target:self 
                                                                  action:@selector(buttonAction:)];
    [leftButton setTag:kButtonLeft];
    [self.navigationItem setLeftBarButtonItem:leftButton];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Post" 
                                                                   style:UIBarButtonItemStyleBordered 
                                                                  target:self 
                                                                  action:@selector(buttonAction:)];
    [rightButton setTag:kButtonRight];
    [self.navigationItem setRightBarButtonItem:rightButton];
    
    dataSource = [[NSMutableArray alloc] init];
    
    NSMutableArray *section0 = [[NSMutableArray alloc] init];
    FOWMainViewCell *cell0_1 = [FOWUtils loadView:[FOWMainViewCell class] FromNib:@"FOWMainViewCell"];
    [cell0_1.txtDescription setDelegate:self];
    [cell0_1.btnAddPhoto setTag:kButtonAddPhoto];
    [cell0_1.btnAddPhoto addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [section0 addObject:cell0_1];
    
    [dataSource addObject:section0];
    
    NSMutableArray *section1 = [[NSMutableArray alloc] init];
    FOWTitleViewCell *cell1_1 = [FOWUtils loadView:[FOWTitleViewCell class] FromNib:@"FOWTitleViewCell"];
    [section1 addObject:cell1_1];
    [cell1_1.txtTitle setDelegate:self];
    [dataSource addObject:section1];
    
    NSMutableArray *section2 = [[NSMutableArray alloc] init];
    FOWCategoryViewCell *cell2_1 = [FOWUtils loadView:[FOWCategoryViewCell class] FromNib:@"FOWCategoryViewCell"];
    [section2 addObject:cell2_1];
    
    [dataSource addObject:section2];
    
    NSMutableArray *section3 = [[NSMutableArray alloc] init];
    FOWNomalViewCell *cell3_1 = [FOWUtils loadView:[FOWNomalViewCell class] FromNib:@"FOWNomalViewCell"];
    [section3 addObject:cell3_1];
    
    [dataSource addObject:section3];
}

#pragma mark - Private method Helper
- (void)hideKeyboard:(id) sender {
    [FOWUtils hideKeyboard:self.view];
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[dataSource objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FOWViewCell *cell = [[dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
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
    FOWViewCell *customCell = (FOWViewCell*)[[dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
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


#pragma mark - TextView Delegate
- (void) textViewDidBeginEditing:(UITextView *)textView {
    [self.view addGestureRecognizer:gesture];
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    [self.view removeGestureRecognizer:gesture];
}

#pragma mark - TextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.view addGestureRecognizer:gesture];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.view removeGestureRecognizer:gesture];
}

#pragma mark - AlertView Delegate and ActionSheet Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != alertView.cancelButtonIndex) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
}

#pragma mark - Add and EditPhoto



#pragma mark - Button Action
- (void)buttonAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    switch (button.tag) {
        case kButtonLeft: {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" 
                                                            message:@"This action will be delete all photo you have just taken!"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }
            
        case kButtonRight: {
            
            break;
        }
            
        case kButtonAddPhoto: {
            
            break;
        }
            
        default:
            break;
    }
}


@end
