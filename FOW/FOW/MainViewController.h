//
//  MainViewController.h
//  FOW
//
//  Created by Anh Quoc on 10/24/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnTakeAPicture;
@property (weak, nonatomic) IBOutlet UIButton *btnChooseAPhoto;


- (IBAction)takePictureAction:(id)sender;
- (IBAction)choosePhotoAction:(id)sender;

@end
