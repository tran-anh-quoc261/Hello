//
//  FOWReviewViewController.h
//  FOW
//
//  Created by Anh Quoc on 11/7/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FOWReviewViewControllerDelegate;

@interface FOWReviewViewController : UIViewController

@property (nonatomic, assign) NSInteger indexImage;
@property (weak, nonatomic) IBOutlet UIButton *btnEditPhoto;
@property (weak, nonatomic) IBOutlet UIButton *btnDeletePhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imaReview;
@property (nonatomic, assign) id <FOWReviewViewControllerDelegate> delegate;

@end

@protocol FOWReviewViewControllerDelegate <NSObject>

- (void)savePhotoDidFinish;

@end
