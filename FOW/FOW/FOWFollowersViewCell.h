//
//  FOWFollowersViewCell.h
//  FOW
//
//  Created by Anh Quoc on 11/11/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWViewCell.h"

@protocol FOWFollowersViewCellDelegate;

@interface FOWFollowersViewCell : FOWViewCell

@property (weak, nonatomic) IBOutlet UIImageView        *imgAvatar;
@property (weak, nonatomic) IBOutlet UIButton           *btnFollow;

@property (weak, nonatomic) IBOutlet UILabel            *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel            *lblFollower;
@property (weak, nonatomic) IBOutlet UILabel            *lblFollowing;
@property (weak, nonatomic) IBOutlet UILabel            *lblNumberOfPost;
@property (strong, nonatomic) NSString                  *image_avatar_url;
@property (strong, nonatomic) NSIndexPath               *indexPath;
@property (assign, nonatomic) id <FOWFollowersViewCellDelegate> delegate;

- (void)configView;

@end

@protocol FOWFollowersViewCellDelegate <NSObject>

- (void)buttonActionFollow:(NSIndexPath *)indexPath;

@end
