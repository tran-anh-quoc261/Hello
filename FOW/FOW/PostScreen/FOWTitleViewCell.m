//
//  FOWTitleViewCell.m
//  FOW
//
//  Created by Anh Quoc on 11/4/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWTitleViewCell.h"

@implementation FOWTitleViewCell

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

- (void)layoutSubviews {
    // Called when load view
    
}

- (IBAction)txtChangeValue:(id)sender {
    UITextField *textField = (UITextField *)sender;
    NSInteger textLength = [FOWUtils trimString:textField.text].length;
    [_lblCountCharactor setText:[NSString stringWithFormat:@"%d/15", textLength]];
    if (textLength > 15) {
        [_lblCountCharactor setTextColor:[UIColor redColor]];
        _flagTextViewError = YES;
    } else {
        [_lblCountCharactor setTextColor:[UIColor lightGrayColor]];
        _flagTextViewError = NO;
    }
}
@end
