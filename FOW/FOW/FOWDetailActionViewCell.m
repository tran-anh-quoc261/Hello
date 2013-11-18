//
//  FOWDetailActionViewCell.m
//  FOW
//
//  Created by Anh Quoc on 11/14/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWDetailActionViewCell.h"

@implementation FOWDetailActionViewCell

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
}

-(CGFloat)getHeight {
	return height;
}

- (void)configView {
    
}

- (void)layoutSubviews {
    
}

@end
