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
#import "FOWManagerImageProcess.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "AFPhotoEditorController.h"
#import "FOWReviewViewController.h"

#define kButtonLeft                 100
#define kButtonRight                101
#define kButtonAddPhoto             102
#define kButtonShowPhoto1           103
#define kButtonShowPhoto2           104
#define kButtonShowPhoto3           105
#define kButtonShowPhoto4           106
#define kButtonShowPhoto5           107

@interface FOWPostPhotoViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, AFPhotoEditorControllerDelegate, UIActionSheetDelegate, UIAlertViewDelegate, FOWReviewViewControllerDelegate>

@property (nonatomic, strong) ALAssetsLibrary * assetLibrary;

@end

@implementation FOWPostPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"Post Photo"];
    [self.navigationItem setHidesBackButton:YES];
    gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    
    // Allocate Asset Library
    ALAssetsLibrary * assetLibrary = [[ALAssetsLibrary alloc] init];
    [self setAssetLibrary:assetLibrary];
    
    [self setupView];
}

- (void)dealloc {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
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
    
    [cell0_1.imgEdit1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell0_1.imgEdit1 setTag:kButtonShowPhoto1];
    
    [cell0_1.imgEdit2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell0_1.imgEdit2 setTag:kButtonShowPhoto2];
    
    [cell0_1.imgEdit3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell0_1.imgEdit3 setTag:kButtonShowPhoto3];
    
    [cell0_1.imgEdit4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell0_1.imgEdit4 setTag:kButtonShowPhoto4];
    
    [cell0_1.imgEdit5 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell0_1.imgEdit5 setTag:kButtonShowPhoto5];
    
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
- (void)hideKeyboard:(id)sender {
    [FOWUtils hideKeyboard:self.view];
}

- (void)showReviewControllerWithIndexImage:(NSInteger)index {
    FOWReviewViewController *controller = [[FOWReviewViewController alloc] initWithNibName:@"FOWReviewViewController" bundle:nil];
    [controller setIndexImage:index];
    [controller setDelegate:self];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self.navigationController presentModalViewController:navController animated:YES];
}

- (void)savePhotoDidFinish {
    // Action receive when edit image did finish
    FOWMainViewCell *cell = (FOWMainViewCell*)[[dataSource objectAtIndex:0] objectAtIndex:0];
    if (cell) {
        [cell configView];
    }
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
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.destructiveButtonIndex ==  buttonIndex) {
        if ([FOWUtils hasValidAPIKey]) {
            @try {
                UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];  
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePicker.delegate = self; 
                
                [self presentModalViewController:imagePicker animated:YES];
            }
            @catch (NSException *exception) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Camera" message:@"Camera is not available" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
            }
        }
    } else if (buttonIndex == 1) {
        if ([FOWUtils hasValidAPIKey]) {
            UIImagePickerController * imagePicker = [UIImagePickerController new];
            [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [imagePicker setDelegate:self];
            
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != alertView.cancelButtonIndex) {
        [self.navigationController popToRootViewControllerAnimated:NO];
        [kFOWManagerEditPhoto clearData];
    }
}

#pragma mark - Photo Editor Delegate Methods
- (void) launchPhotoEditorWithImage:(UIImage *)editingResImage {    
    // Initialize the photo editor and set its delegate
    AFPhotoEditorController * photoEditor = [[AFPhotoEditorController alloc] initWithImage:editingResImage];
    [photoEditor setDelegate:self];
    
    // Present the photo editor.
    [self presentViewController:photoEditor animated:YES completion:nil];
}

// This is called when the user taps "Done" in the photo editor. 
- (void) photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image {
    void(^completion)(void)  = ^(void){
        [kFOWManagerEditPhoto addImage:image];
        FOWMainViewCell *cell = (FOWMainViewCell*)[[dataSource objectAtIndex:0] objectAtIndex:0];
        if (cell) {
            [cell configView];
        }
    };
    
    [self dismissViewControllerAnimated:YES completion:completion];
}

// This is called when the user taps "Cancel" in the photo editor.
- (void) photoEditorCanceled:(AFPhotoEditorController *)editor {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIImagePicker Delegate
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSURL * assetURL = [info objectForKey:UIImagePickerControllerReferenceURL];
    if (assetURL) {
        void(^completion)(void)  = ^(void){
            [[self assetLibrary] assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                if (asset){
                    CGImageRef image = [[asset defaultRepresentation] fullScreenImage];
                    UIImage * editImage = [UIImage imageWithCGImage:image scale:1.0 orientation:UIImageOrientationUp];
                    if (editImage) {
                        [self launchPhotoEditorWithImage:editImage];
                    }
                }
            } failureBlock:^(NSError *error) {
                [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enable access to your device's photos." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }];
        };
        
        [self dismissViewControllerAnimated:YES completion:completion];
    } else {
        void(^completion)(void)  = ^(void){
            UIImage *editImage = [info objectForKey:UIImagePickerControllerOriginalImage];
            if (editImage) {
                [self launchPhotoEditorWithImage:editImage];
            }
        };
        
        [self dismissViewControllerAnimated:YES completion:completion];
    }
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Button Action
- (void)buttonAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    switch (button.tag) {
        case kButtonLeft: {
            // Cancel post and go to the root view
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" 
                                                            message:@"This action will be delete all photo you have just taken!"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }
            
        case kButtonRight: {
            // Post Photo
            
            break;
        }
            
        case kButtonAddPhoto: {
            // Add photo to post (max 5 photos)
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                                     delegate:self
                                                            cancelButtonTitle:@"Cancel"
                                                       destructiveButtonTitle:@"Take A Picture"
                                                            otherButtonTitles:@"Choose A Photo", nil];
            [actionSheet showInView:self.view];
            break;
        }
            
        case kButtonShowPhoto1: {
            [self showReviewControllerWithIndexImage:0];
            break;
        }
            
        case kButtonShowPhoto2: {
            [self showReviewControllerWithIndexImage:1];
            break;
        }
            
        case kButtonShowPhoto3: {
            [self showReviewControllerWithIndexImage:2];
            break;
        }
            
        case kButtonShowPhoto4: {
            [self showReviewControllerWithIndexImage:3];
            break;
        }
            
        case kButtonShowPhoto5: {
            [self showReviewControllerWithIndexImage:4];
            break;
        }
            
        default:
            break;
    }
}


@end
