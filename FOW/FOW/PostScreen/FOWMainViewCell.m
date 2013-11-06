//
//  FOWMainViewCell.m
//  FOW
//
//  Created by Anh Quoc on 11/4/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWMainViewCell.h"

@implementation FOWMainViewCell

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
    [self.txtDescription setPlaceholder:@"Write a description..."];
    UIImage * blueButton = [[UIImage imageNamed:@"blue_button.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    UIImage * blueButtonActive = [[UIImage imageNamed:@"blue_button_pressed.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    [[self btnAddPhoto] setBackgroundImage:blueButton forState:UIControlStateNormal];
    [[self btnAddPhoto] setBackgroundImage:blueButtonActive forState:UIControlStateHighlighted];
}

- (void)layoutSubviews {
    
}

- (void)dealloc {
    
}

@end
