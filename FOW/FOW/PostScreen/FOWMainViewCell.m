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
            [self.imgEdit1 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0]];
            [self.imgEdit1 setContentMode:UIViewContentModeScaleAspectFit];
            break;
        }
            
        case 2: {
            [self.imgEdit1 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0]];
            [self.imgEdit1 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit2 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:1]];
            [self.imgEdit2 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit3 setImage:nil];
            [self.imgEdit4 setImage:nil];
            [self.imgEdit5 setImage:nil];
            break;
        }
            
        case 3: {
            [self.imgEdit1 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0]];
            [self.imgEdit1 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit2 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:1]];
            [self.imgEdit2 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit3 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:2]];
            [self.imgEdit3 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit4 setImage:nil];
            [self.imgEdit5 setImage:nil];
            break;
        }
            
        case 4: {
            [self.imgEdit1 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0]];
            [self.imgEdit1 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit2 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:1]];
            [self.imgEdit2 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit3 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:2]];
            [self.imgEdit3 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit4 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:3]];
            [self.imgEdit4 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit5 setImage:nil];
            break;
        }
            
        case 5: {
            [self.imgEdit1 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0]];
            [self.imgEdit1 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit2 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:1]];
            [self.imgEdit2 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit3 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0]];
            [self.imgEdit3 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit4 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:1]];
            [self.imgEdit4 setContentMode:UIViewContentModeScaleAspectFit];
            
            [self.imgEdit5 setImage:[[kFOWManagerEditPhoto arrayImage] objectAtIndex:0]];
            [self.imgEdit5 setContentMode:UIViewContentModeScaleAspectFit];
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
            [self.imgEdit2 setImage:nil];
            [self.imgEdit3 setImage:nil];
            [self.imgEdit4 setImage:nil];
            [self.imgEdit5 setImage:nil];
            
            [self.imgEdit1 setHidden:NO];
            [self.imgEdit2 setHidden:YES];
            [self.imgEdit3 setHidden:YES];
            [self.imgEdit4 setHidden:YES];
            [self.imgEdit5 setHidden:YES];
            break;
        }
            
        case 2: {
            [self.imgEdit3 setImage:nil];
            [self.imgEdit4 setImage:nil];
            [self.imgEdit5 setImage:nil];
            
            [self.imgEdit1 setHidden:NO];
            [self.imgEdit2 setHidden:NO];
            [self.imgEdit3 setHidden:YES];
            [self.imgEdit4 setHidden:YES];
            [self.imgEdit5 setHidden:YES];
            break;
        }
            
        case 3: {
            [self.imgEdit4 setImage:nil];
            [self.imgEdit5 setImage:nil];
            
            [self.imgEdit1 setHidden:NO];
            [self.imgEdit2 setHidden:NO];
            [self.imgEdit3 setHidden:NO];
            [self.imgEdit4 setHidden:YES];
            [self.imgEdit5 setHidden:YES];
            break;
        }
            
        case 4: {
            [self.imgEdit5 setImage:nil];
            
            [self.imgEdit1 setHidden:NO];
            [self.imgEdit2 setHidden:NO];
            [self.imgEdit3 setHidden:NO];
            [self.imgEdit4 setHidden:NO];
            [self.imgEdit5 setHidden:YES];
            break;
        }
            
        case 5: {
            [self.imgEdit1 setHidden:NO];
            [self.imgEdit2 setHidden:NO];
            [self.imgEdit3 setHidden:NO];
            [self.imgEdit4 setHidden:NO];
            [self.imgEdit5 setHidden:NO];
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
