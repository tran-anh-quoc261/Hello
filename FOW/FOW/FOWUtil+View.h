//
//  FOWUtil+View.h
//  FOW
//
//  Created by Anh Quoc on 11/1/13.
//  Copyright (c) 2013 nguyenkhoi. All rights reserved.
//

#import "FOWUtils.h"

@interface FOWUtils (View)

+(id)loadView:(Class)class FromNib:(NSString*)nibName;
+ (void)hideKeyboard:(UIView *)topView;
+ (void)hideKeyboard:(UIView *)topView completion:(void (^)(BOOL finished))completion;

@end
