//
//  FOWReviewViewController.m
//  FOW
//
//  Created by Anh Quoc on 11/7/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWReviewViewController.h"
#import "AFPhotoEditorController.h"
#import "FOWManagerImageProcess.h"

#define kButtonLeft                 100
#define kButtonEdit                 101
#define kButtonDelete               102

@interface FOWReviewViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, AFPhotoEditorControllerDelegate, UIActionSheetDelegate, UIAlertViewDelegate>

@end

@implementation FOWReviewViewController

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
    [self.navigationItem setTitle:@"View Photo"];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self setupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Load View
- (void)setupView {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" 
                                                                   style:UIBarButtonItemStyleBordered 
                                                                  target:self 
                                                                  action:@selector(buttonAction:)];
    [leftButton setTag:kButtonLeft];
    [self.navigationItem setLeftBarButtonItem:leftButton];
    
    // Customize UI Components
    UIImage *blueButton = [[UIImage imageNamed:@"blue_button.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    UIImage *blueButtonActive = [[UIImage imageNamed:@"blue_button_pressed.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    [[self btnEditPhoto] setBackgroundImage:blueButton forState:UIControlStateNormal];
    [[self btnEditPhoto] setBackgroundImage:blueButtonActive forState:UIControlStateHighlighted];
    [self.btnEditPhoto setTag:kButtonEdit];
    [self.btnEditPhoto addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *redButton = [[UIImage imageNamed:@"red_button.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    UIImage *redButtonActive = [[UIImage imageNamed:@"red_button_pressed.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    [[self btnDeletePhoto] setBackgroundImage:redButton forState:UIControlStateNormal];
    [[self btnDeletePhoto] setBackgroundImage:redButtonActive forState:UIControlStateHighlighted];
    [self.btnDeletePhoto setTag:kButtonDelete];
    [self.btnDeletePhoto addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - AlertView Delegate and ActionSheet Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != alertView.cancelButtonIndex) {
        
    }
}


#pragma mark - Button Action
- (void)buttonAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    switch (button.tag) {
        case kButtonLeft: {
            [self dismissModalViewControllerAnimated:YES];
            break;
        }
            
        case kButtonEdit: {
            
            break;
        }
            
        case kButtonDelete: {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Notice"
                                                                message:@"Do you want to delete this image?"
                                                               delegate:self
                                                      cancelButtonTitle:@"Cancel"
                                                      otherButtonTitles:@"OK", nil];
            [alertView show];
            break;
        }
            
        default:
            break;
    }
}


@end
