//
//  FOWFollowersViewCell.m
//  FOW
//
//  Created by Anh Quoc on 11/11/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWFollowersViewCell.h"

@interface FOWFollowersViewCell ()

@property (strong, nonatomic) NSCache *imageCache;

@end

@implementation FOWFollowersViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)caliculateHeight {
    height = self.frame.size.height;
    [self configView];
}

-(CGFloat)getHeight {
	return height;
}

- (void)configView {
    UIImage *image = [_imageCache objectForKey:self.image_avatar_url];
    if (image) {
        [self.imgAvatar setImage:image];
    } else {
        [self.imgAvatar setImage:nil];
        dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(q, ^{
            /* Fetch the image from the server... */
            NSURL *url = [NSURL URLWithString:self.image_avatar_url];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [[UIImage alloc] initWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                /* This is the main thread again, where we set the tableView's image to
                 be what we just fetched. */
                [self.imgAvatar setImage:image];
                [_imageCache setObject:image forKey:self.image_avatar_url];
            });
        });
    }
    
    [self.imgAvatar setContentMode:UIViewContentModeScaleAspectFit];
    
}

- (void)layoutSubviews {
    [self.btnFollow addTarget:self action:@selector(actionButtonFollow:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnFollow setExclusiveTouch:YES];
    
    _imageCache = [[NSCache alloc] init];
    [_imageCache setName:@"FOWImageCache"];
    
    UIView *lineBotView = [[UIView alloc] initWithFrame:CGRectMake(0, 124, 320, 1)];
    [lineBotView setBackgroundColor:[UIColor lightGrayColor]];
    [lineBotView setAlpha:0.5f];
    [self addSubview:lineBotView];
}

- (void)actionButtonFollow:(id)sender {
    if([_delegate respondsToSelector:@selector(buttonActionFollow:)])
        [_delegate buttonActionFollow:self.indexPath];
}

@end
