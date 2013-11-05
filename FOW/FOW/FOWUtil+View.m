//
//  FOWUtil+View.m
//  FOW
//
//  Created by Anh Quoc on 11/1/13.
//  Copyright (c) 2013 nguyenkhoi. All rights reserved.
//

#import "FOWUtil+View.h"

@implementation FOWUtils (View)

+(id)loadView:(Class)class FromNib:(NSString*)nibName {
	NSArray* nibViews =  [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
	for( id obj in nibViews ) {
		if( [obj isMemberOfClass:class] ) {
			return obj;
		}
	}
	for( id obj in nibViews ) {
		if( [obj isKindOfClass:class] ) {
			return obj;
		}
	}
	return nil;
}

+ (void)hideKeyboard:(UIView *)topView {
    for (UIView *v in [topView subviews]) {
        if ([v isKindOfClass:[UITextView class]] || [v isKindOfClass:[UITextField class]] ) {
            [v resignFirstResponder];
        }
        else {
            [self hideKeyboard:v];
        }
    }
}

+ (void)hideKeyboard:(UIView *)topView completion:(void (^)(BOOL finished))completion {
    int i = 0;
    for (UIView *v in [topView subviews]) {
        ++i;
        if ([v isKindOfClass:[UITextView class]] || [v isKindOfClass:[UITextField class]] ) {
            [v resignFirstResponder];
        }
        else {
            [self hideKeyboard:v];
        }
        if (i==[[topView subviews] count]) {
            completion(YES);
        }
    }
}

@end
