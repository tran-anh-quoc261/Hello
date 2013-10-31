//
//  MainViewController.m
//  FOW
//
//  Created by Anh Quoc on 10/24/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "MainViewController.h"
#import "FOWFlipViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>
#import "AFPhotoEditorController.h"
#import "AFPhotoEditorCustomization.h"
#import "AFOpenGLManager.h"

#define kAFSDKDemoImageViewInset 10.0f
#define kAFSDKDemoBorderAspectRatioPortrait 3.0f/4.0f
#define kAFSDKDemoBorderAspectRatioLandscape 4.0f/3.0f

@interface MainViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, AFPhotoEditorControllerDelegate>

@property (nonatomic, strong) ALAssetsLibrary *assetLibrary;
@property (nonatomic, strong) NSMutableArray *sessions;

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
    ALAssetsLibrary *assetLibrary = [[ALAssetsLibrary alloc] init];
    [self setAssetLibrary:assetLibrary];
    
    // Allocate Sessions Array
    NSMutableArray *sessions = [NSMutableArray new];
    [self setSessions:sessions];
    
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

#pragma mark - Support Rotate Orientation
- (BOOL)shouldAutorotate {
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"Rotate");
}

- (NSUInteger)supportedInterfaceOrientations { 
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

#pragma mark - Private Helper Methods
- (BOOL) hasValidAPIKey {
    NSString * key = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Aviary-API-Key"];
    if ([key isEqualToString:@"<YOUR_API_KEY>"]) {
        [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"You forgot to add your API key!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return NO;
    }
    return YES;
}

- (void) launchEditorWithAsset:(ALAsset *)asset {
    UIImage *editingResImage = [self editingResImageForAsset:asset];
    [self launchPhotoEditorWithImage:editingResImage highResolutionImage:nil];
}

#pragma mark - ALAssets Helper Methods
- (UIImage *)editingResImageForAsset:(ALAsset*)asset {
    CGImageRef image = [[asset defaultRepresentation] fullScreenImage];
    
    return [UIImage imageWithCGImage:image scale:1.0 orientation:UIImageOrientationUp];
}

#pragma mark - Photo Editor Creation and Presentation
- (void) launchPhotoEditorWithImage:(UIImage *)editingResImage highResolutionImage:(UIImage *)highResImage {    
    // Initialize the photo editor and set its delegate
    AFPhotoEditorController * photoEditor = [[AFPhotoEditorController alloc] initWithImage:editingResImage];
    [photoEditor setDelegate:self];
    
    // Customize the editor's apperance. The customization options really only need to be set once in this case since they are never changing, so we used dispatch once here.
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self setPhotoEditorCustomizationOptions];
    });
    
    // If a high res image is passed, create the high res context with the image and the photo editor.
    if (highResImage) {
        [self setupHighResContextForPhotoEditor:photoEditor withImage:highResImage];
    }
    
    // Present the photo editor.
    [self presentViewController:photoEditor animated:YES completion:nil];
}

- (void) setupHighResContextForPhotoEditor:(AFPhotoEditorController *)photoEditor withImage:(UIImage *)highResImage
{
    // Capture a reference to the editor's session, which internally tracks user actions on a photo.
    __block AFPhotoEditorSession *session = [photoEditor session];
    
    // Add the session to our sessions array. We need to retain the session until all contexts we create from it are finished rendering.
    [[self sessions] addObject:session];
    
    // Create a context from the session with the high res image.
    AFPhotoEditorContext *context = [session createContextWithImage:highResImage];
    
    __block MainViewController *blockSelf = self;
    
    // Call render on the context. The render will asynchronously apply all changes made in the session (and therefore editor)
    // to the context's image. It will not complete until some point after the session closes (i.e. the editor hits done or
    // cancel in the editor). When rendering does complete, the completion block will be called with the result image if changes
    // were made to it, or `nil` if no changes were made. In this case, we write the image to the user's photo album, and release
    // our reference to the session. 
    [context render:^(UIImage *result) {
        if (result) {
            UIImageWriteToSavedPhotosAlbum(result, nil, nil, NULL);
        }
        
        [[blockSelf sessions] removeObject:session];
        
        blockSelf = nil;
        session = nil;
        
    }];
}

#pragma mark - Photo Editor Customization
- (void) setPhotoEditorCustomizationOptions {
    // Set Tool Order
    NSArray * toolOrder = @[kAFEffects, kAFFocus, kAFFrames, kAFStickers, kAFEnhance, kAFOrientation, kAFCrop, kAFAdjustments, kAFSplash, kAFDraw, kAFText, kAFRedeye, kAFWhiten, kAFBlemish, kAFMeme];
    [AFPhotoEditorCustomization setToolOrder:toolOrder];
    
    // Set Custom Crop Sizes
    [AFPhotoEditorCustomization setCropToolOriginalEnabled:NO];
    [AFPhotoEditorCustomization setCropToolCustomEnabled:YES];
    NSDictionary * fourBySix = @{kAFCropPresetHeight : @(4.0f), kAFCropPresetWidth : @(6.0f)};
    NSDictionary * fiveBySeven = @{kAFCropPresetHeight : @(5.0f), kAFCropPresetWidth : @(7.0f)};
    NSDictionary * square = @{kAFCropPresetName: @"Square", kAFCropPresetHeight : @(1.0f), kAFCropPresetWidth : @(1.0f)};
    [AFPhotoEditorCustomization setCropToolPresets:@[fourBySix, fiveBySeven, square]];
    
    // Set Supported Orientations
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        NSArray * supportedOrientations = @[@(UIInterfaceOrientationPortrait), @(UIInterfaceOrientationPortraitUpsideDown), @(UIInterfaceOrientationLandscapeLeft), @(UIInterfaceOrientationLandscapeRight)];
        [AFPhotoEditorCustomization setSupportedIpadOrientations:supportedOrientations];
    }
}

#pragma Photo Editor Delegate Methods
// This is called when the user taps "Done" in the photo editor. 
- (void) photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image {
    [[self imgReview] setImage:image];
    [[self imgReview] setContentMode:UIViewContentModeScaleAspectFit];
    
    UIBarButtonItem *rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(barButtonAction:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
//    FlipViewController *controller = [[FlipViewController alloc] initWithNibName:@"FlipViewController" bundle:nil];
//    [editor.navigationController pushViewController:controller animated:YES];
}

// This is called when the user taps "Cancel" in the photo editor.
- (void) photoEditorCanceled:(AFPhotoEditorController *)editor {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIImagePicker Delegate
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSURL *assetURL = [info objectForKey:UIImagePickerControllerReferenceURL];
    if (assetURL) {
        void(^completion)(void)  = ^(void){
            
            [[self assetLibrary] assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                if (asset){
                    [self launchEditorWithAsset:asset];
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
                [self launchPhotoEditorWithImage:editImage highResolutionImage:nil];
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
    [self launchPhotoEditorWithImage:editImage highResolutionImage:nil];
}

- (IBAction)takePictureAction:(id)sender {
    if ([self hasValidAPIKey]) {
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
    if ([self hasValidAPIKey]) {
        UIImagePickerController * imagePicker = [UIImagePickerController new];
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [imagePicker setDelegate:self];
        
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}
@end
