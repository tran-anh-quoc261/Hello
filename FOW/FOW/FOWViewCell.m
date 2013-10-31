//
//  FOWViewCell.m
//  FOW
//
//  Created by Anh Quoc on 10/31/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWViewCell.h"

@implementation FOWViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(CGFloat)getHeight {
	return height;
}
-(void)caliculateHeight {
    if (isConfigHeight) return;
    
    height = self.frame.size.height;
}

-(void)configHeight:(float)h {
    isConfigHeight = YES;
    height = h;
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height)];
}

@end
