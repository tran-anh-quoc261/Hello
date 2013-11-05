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
}

@end
