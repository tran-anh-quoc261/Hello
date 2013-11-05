//
//  FOWManagerImageProcess.h
//  FOW
//
//  Created by Anh Quoc on 11/4/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FOWManagerImageProcess : NSObject

@property (nonatomic, strong) UIImage *editImage;
@property (nonatomic, strong) NSMutableArray *arrayImage;

+ (id)instance;

@end
