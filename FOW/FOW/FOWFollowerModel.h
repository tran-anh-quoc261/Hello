//
//  FOWFollowerModel.h
//  FOW
//
//  Created by Anh Quoc on 11/13/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FOWFollowerModel : NSObject

- (id)init;

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *numberFollowers;
@property (nonatomic, strong) NSString *numberFollowings;
@property (nonatomic, strong) NSString *numberOfPosts;
@property (nonatomic, strong) NSString *image_avatar_url;

@end
