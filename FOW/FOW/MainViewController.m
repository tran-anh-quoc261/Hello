//
//  MainViewController.m
//  FOW
//
//  Created by Anh Quoc on 10/24/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "MainViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "FOWPostPhotoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AFPhotoEditorController.h"
#import "AFPhotoEditorCustomization.h"
#import "AFOpenGLManager.h"
#import "FOWManagerImageProcess.h"


@interface MainViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, AFPhotoEditorControllerDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) ALAssetsLibrary * assetLibrary;

@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"Main View"];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    // Allocate Asset Library
    ALAssetsLibrary * assetLibrary = [[ALAssetsLibrary alloc] init];
    [self setAssetLibrary:assetLibrary];
    
    // Start the Aviary Editor OpenGL Load
    [AFOpenGLManager beginOpenGLLoad];
    
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Load View
- (void)setupView {
    UIColor * borderColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"border.png"]];
    [self.viewBorder setBackgroundColor:borderColor];
    
    CALayer * borderLayer = [self.viewBorder layer];
    [borderLayer setCornerRadius:5.0f];
    [borderLayer setBorderColor:[[UIColor blackColor] CGColor]];
    [borderLayer setBorderWidth:2.0f];
    [borderLayer setMasksToBounds:YES];
    
    UIImageView * previewView = [UIImageView new];
    [previewView setContentMode:UIViewContentModeCenter];
    
    // Customize UI Components
    UIImage * blueButton = [[UIImage imageNamed:@"blue_button.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    UIImage * blueButtonActive = [[UIImage imageNamed:@"blue_button_pressed.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    [[self btnTakeAPicture] setBackgroundImage:blueButton forState:UIControlStateNormal];
    [[self btnTakeAPicture] setBackgroundImage:blueButtonActive forState:UIControlStateHighlighted];
    
    UIImage * darkButton = [[UIImage imageNamed:@"dark_button.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    UIImage * darkButtonActive = [[UIImage imageNamed:@"dark_button_pressed.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    [[self btnChooseAPhoto] setBackgroundImage:darkButton forState:UIControlStateNormal];
    [[self btnChooseAPhoto] setBackgroundImage:darkButtonActive forState:UIControlStateHighlighted];
}

#pragma Photo Editor Delegate Methods
- (void) launchPhotoEditorWithImage:(UIImage *)editingResImage {    
    // Initialize the photo editor and set its delegate
    AFPhotoEditorController * photoEditor = [[AFPhotoEditorController alloc] initWithImage:editingResImage];
    [photoEditor setDelegate:self];
    
    // Present the photo editor.
    [self presentViewController:photoEditor animated:YES completion:nil];
}

// This is called when the user taps "Done" in the photo editor. 
- (void) photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image {
    [[self imgReview] setImage:image];
    [[self imgReview] setContentMode:UIViewContentModeScaleAspectFit];
    
    UIBarButtonItem *rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(barButtonAction:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [kFOWManagerEditPhoto addImage:image];
    FOWPostPhotoViewController *controller = [[FOWPostPhotoViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:controller animated:NO];
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
- (void)barButtonAction:(id)sender {
    UIImage *editImage = [self.imgReview image];
    [self launchPhotoEditorWithImage:editImage];
}

- (IBAction)takePictureAction:(id)sender {
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
}

- (IBAction)choosePhotoAction:(id)sender {
    if ([FOWUtils hasValidAPIKey]) {
        UIImagePickerController * imagePicker = [UIImagePickerController new];
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [imagePicker setDelegate:self];
        
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}
@end
