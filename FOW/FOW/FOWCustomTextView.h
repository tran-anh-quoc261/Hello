//
//  FOWCustomTextView.h
//  FOW
//
//  Created by Anh Quoc on 11/4/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FOWCustomTextView : UITextView {
    BOOL _shouldDrawPlaceholder;
}

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

@end
