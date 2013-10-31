//
//  FOWViewCell.h
//  FOW
//
//  Created by Anh Quoc on 10/31/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FOWViewCell : UIView {
    BOOL        isConfigHeight;
    CGFloat		height;
}

-(CGFloat)getHeight;
-(void)caliculateHeight;
-(void)configHeight:(float)h;

@end
