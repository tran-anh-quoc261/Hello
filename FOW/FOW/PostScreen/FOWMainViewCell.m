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
    
    NSInteger numberImages = [kFOWManagerEditPhoto numberOfImages];
    switch (numberImages) {
        case 1: {
            [self.imgEdit1 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0] forState:UIControlStateNormal];
            [self.imgEdit1.imageView setContentMode:UIViewContentModeScaleAspectFit];
            break;
        }
            
        case 2: {
            [self.imgEdit1 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0] forState:UIControlStateNormal];
            [self.imgEdit1.imageView setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit2 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:1] forState:UIControlStateNormal];
            [self.imgEdit2.imageView setContentMode:UIViewContentModeScaleAspectFit];
            break;
        }
            
        case 3: {
            [self.imgEdit1 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0] forState:UIControlStateNormal];
            [self.imgEdit1.imageView setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit2 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:1] forState:UIControlStateNormal];
            [self.imgEdit2.imageView setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit3 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:2] forState:UIControlStateNormal];
            [self.imgEdit3.imageView setContentMode:UIViewContentModeScaleAspectFit];
            break;
        }
            
        case 4: {
            [self.imgEdit1 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0] forState:UIControlStateNormal];
            [self.imgEdit1.imageView setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit2 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:1] forState:UIControlStateNormal];
            [self.imgEdit2.imageView setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit3 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:2] forState:UIControlStateNormal];
            [self.imgEdit3.imageView setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit4 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:3] forState:UIControlStateNormal];
            [self.imgEdit4.imageView setContentMode:UIViewContentModeScaleAspectFit];
            break;
        }
            
        case 5: {
            [self.imgEdit1 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0] forState:UIControlStateNormal];
            [self.imgEdit1.imageView setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit2 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:1] forState:UIControlStateNormal];
            [self.imgEdit2.imageView setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit3 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:2] forState:UIControlStateNormal];
            [self.imgEdit3.imageView setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit4 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:3] forState:UIControlStateNormal];
            [self.imgEdit4.imageView setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit5 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:4] forState:UIControlStateNormal];
            [self.imgEdit5.imageView setContentMode:UIViewContentModeScaleAspectFit];
            break;
        }
            
        default:
            break;
    }
    
    [self configGUIWithNumberImage:numberImages];
}

- (void)configGUIWithNumberImage:(NSInteger)number {
    switch (number) {
        case 1: {
            [self.imgEdit2 setImage:nil forState:UIControlStateNormal];
            [self.imgEdit3 setImage:nil forState:UIControlStateNormal];
            [self.imgEdit4 setImage:nil forState:UIControlStateNormal];
            [self.imgEdit5 setImage:nil forState:UIControlStateNormal];
            
            [self.imgEdit1 setHidden:NO];
            [self.imgEdit2 setHidden:YES];
            [self.imgEdit3 setHidden:YES];
            [self.imgEdit4 setHidden:YES];
            [self.imgEdit5 setHidden:YES];
            
            [self.imgEdit1 setEnabled:YES];
            [self.imgEdit2 setEnabled:NO];
            [self.imgEdit3 setEnabled:NO];
            [self.imgEdit4 setEnabled:NO];
            [self.imgEdit5 setEnabled:NO];
            break;
        }
            
        case 2: {
            [self.imgEdit3 setImage:nil forState:UIControlStateNormal];
            [self.imgEdit4 setImage:nil forState:UIControlStateNormal];
            [self.imgEdit5 setImage:nil forState:UIControlStateNormal];
            
            [self.imgEdit1 setHidden:NO];
            [self.imgEdit2 setHidden:NO];
            [self.imgEdit3 setHidden:YES];
            [self.imgEdit4 setHidden:YES];
            [self.imgEdit5 setHidden:YES];
            
            [self.imgEdit1 setEnabled:YES];
            [self.imgEdit2 setEnabled:YES];
            [self.imgEdit3 setEnabled:NO];
            [self.imgEdit4 setEnabled:NO];
            [self.imgEdit5 setEnabled:NO];
            break;
        }
            
        case 3: {
            [self.imgEdit4 setImage:nil forState:UIControlStateNormal];
            [self.imgEdit5 setImage:nil forState:UIControlStateNormal];
            
            [self.imgEdit1 setHidden:NO];
            [self.imgEdit2 setHidden:NO];
            [self.imgEdit3 setHidden:NO];
            [self.imgEdit4 setHidden:YES];
            [self.imgEdit5 setHidden:YES];
            
            [self.imgEdit1 setEnabled:YES];
            [self.imgEdit2 setEnabled:YES];
            [self.imgEdit3 setEnabled:YES];
            [self.imgEdit4 setEnabled:NO];
            [self.imgEdit5 setEnabled:NO];
            break;
        }
            
        case 4: {
            [self.imgEdit5 setImage:nil forState:UIControlStateNormal];
            
            [self.imgEdit1 setHidden:NO];
            [self.imgEdit2 setHidden:NO];
            [self.imgEdit3 setHidden:NO];
            [self.imgEdit4 setHidden:NO];
            [self.imgEdit5 setHidden:YES];
            
            [self.imgEdit1 setEnabled:YES];
            [self.imgEdit2 setEnabled:YES];
            [self.imgEdit3 setEnabled:YES];
            [self.imgEdit4 setEnabled:YES];
            [self.imgEdit5 setEnabled:NO];
            break;
        }
            
        case 5: {
            [self.imgEdit1 setHidden:NO];
            [self.imgEdit2 setHidden:NO];
            [self.imgEdit3 setHidden:NO];
            [self.imgEdit4 setHidden:NO];
            [self.imgEdit5 setHidden:NO];
            
            [self.imgEdit1 setEnabled:YES];
            [self.imgEdit2 setEnabled:YES];
            [self.imgEdit3 setEnabled:YES];
            [self.imgEdit4 setEnabled:YES];
            [self.imgEdit5 setEnabled:YES];
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
    [self.imgEdit1 setExclusiveTouch:YES];
    [self.imgEdit2 setExclusiveTouch:YES];
    [self.imgEdit3 setExclusiveTouch:YES];
    [self.imgEdit4 setExclusiveTouch:YES];
    [self.imgEdit5 setExclusiveTouch:YES];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 80.0, 320.0, 20.0)];
    [lineView setBackgroundColor:[UIColor darkGrayColor]];
    [lineView setAlpha:0.1f];
    [self addSubview:lineView];
    
    [self configView];
}

@end
