//
//  FOWCategoryViewCell.m
//  FOW
//
//  Created by Anh Quoc on 11/5/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWCategoryViewCell.h"

@implementation FOWCategoryViewCell

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
    UIView *lineTopView = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.btnCategory.frame.origin.y, 320.0, 1.0)];
    lineTopView.backgroundColor = [UIColor lightGrayColor];
    [lineTopView setAlpha:0.5f];
    [self addSubview:lineTopView];
    
    UIView *lineBotView = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.btnCategory.frame.origin.y + self.btnCategory.frame.size.height, 320.0, 1.0)];
    lineBotView.backgroundColor = [UIColor lightGrayColor];
    [lineBotView setAlpha:0.5f];
    [self addSubview:lineBotView];
}

@end
