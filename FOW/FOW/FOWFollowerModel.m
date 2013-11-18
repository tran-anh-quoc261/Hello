//
//  FOWFollowerModel.m
//  FOW
//
//  Created by Anh Quoc on 11/13/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWFollowerModel.h"

@implementation FOWFollowerModel

- (id)init {
    self = [super init];
    
    self.username           = @"";
    self.numberFollowers    = @"";
    self.numberFollowings   = @"";
    self.numberOfPosts      = @"";
    self.image_avatar_url   = @"";
    
    return self;
}

@end
