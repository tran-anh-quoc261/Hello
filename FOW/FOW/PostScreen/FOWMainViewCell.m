//
//  FOWMainViewCell.m
//  FOW
//
//  Created by Anh Quoc on 11/4/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWMainViewCell.h"
#import "FOWManagerImageProcess.h"

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
}

-(CGFloat)getHeight {
	return height;
}

- (void)configView {
    if ([kFOWManagerEditPhoto isFullImage]) {
        [self.btnAddPhoto setEnabled:NO];
        [self.btnAddPhoto setAlpha:0.5f];
    }
    
    switch ([kFOWManagerEditPhoto numberOfImages]) {
        case 1: {
            [self.imgEdit1 setImage:[kFOWManagerEditPhoto editImage]];
            [self.imgEdit1 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self configGUIWithNumberImage:[kFOWManagerEditPhoto numberOfImages]];
            break;
        }
            
        case 2: {
            
            break;
        }
            
        case 3: {
            
            break;
        }
            
        case 4: {
            
            break;
        }
            
        case 5: {
            
            break;
        }
            
        default:
            break;
    }
}

- (void)configGUIWithNumberImage:(NSInteger)number {
    switch (number) {
        case 1: {
            [self.imgEdit1 setHidden:YES];
            [self.imgEdit2 setHidden:NO];
            [self.imgEdit3 setHidden:NO];
            [self.imgEdit4 setHidden:NO];
            [self.imgEdit5 setHidden:NO];
            break;
        }
            
        case 2: {
            [self.imgEdit1 setHidden:YES];
            [self.imgEdit2 setHidden:YES];
            [self.imgEdit3 setHidden:NO];
            [self.imgEdit4 setHidden:NO];
            [self.imgEdit5 setHidden:NO];
            break;
        }
            
        case 3: {
            [self.imgEdit1 setHidden:YES];
            [self.imgEdit2 setHidden:YES];
            [self.imgEdit3 setHidden:YES];
            [self.imgEdit4 setHidden:NO];
            [self.imgEdit5 setHidden:NO];
            break;
        }
            
        case 4: {
            [self.imgEdit1 setHidden:YES];
            [self.imgEdit2 setHidden:YES];
            [self.imgEdit3 setHidden:YES];
            [self.imgEdit4 setHidden:YES];
            [self.imgEdit5 setHidden:NO];
            break;
        }
            
        case 5: {
            [self.imgEdit1 setHidden:YES];
            [self.imgEdit2 setHidden:YES];
            [self.imgEdit3 setHidden:YES];
            [self.imgEdit4 setHidden:YES];
            [self.imgEdit5 setHidden:YES];
            break;
        }
    }
}

- (void)layoutSubviews {
    [self.txtDescription setPlaceholder:@"Write a description..."];
    UIImage * blueButton = [[UIImage imageNamed:@"blue_button.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    UIImage * blueButtonActive = [[UIImage imageNamed:@"blue_button_pressed.png"] stretchableImageWithLeftCapWidth:7.0f topCapHeight:0.0f];
    [[self btnAddPhoto] setBackgroundImage:blueButton forState:UIControlStateNormal];
    [[self btnAddPhoto] setBackgroundImage:blueButtonActive forState:UIControlStateHighlighted];
    [self.btnAddPhoto setExclusiveTouch:YES];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 85.0, 320.0, 20.0)];
    [lineView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [lineView setAlpha:0.5f];
    [self addSubview:lineView];
    
    [self configView];
}

- (void)dealloc {
    
}

@end
