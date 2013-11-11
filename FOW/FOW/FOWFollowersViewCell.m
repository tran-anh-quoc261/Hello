//
//  FOWFollowersViewCell.m
//  FOW
//
//  Created by Anh Quoc on 11/11/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWFollowersViewCell.h"

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
    
}

- (void)layoutSubviews {
    [self.btnFollow addTarget:self action:@selector(actionButtonFollow:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnFollow setExclusiveTouch:YES];
    
    UIView *lineBotView = [[UIView alloc] initWithFrame:CGRectMake(0, 124, 320, 1)];
    [lineBotView setBackgroundColor:[UIColor lightGrayColor]];
    [lineBotView setAlpha:0.5f];
    [self addSubview:lineBotView];
}

- (void)actionButtonFollow:(id)sender {
    if([_delegate respondsToSelector:@selector(buttonActionFollow)])
        [_delegate buttonActionFollow];
}

@end
