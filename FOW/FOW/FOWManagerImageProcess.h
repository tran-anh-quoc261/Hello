//
//  FOWManagerImageProcess.h
//  FOW
//
//  Created by Anh Quoc on 11/4/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FOWManagerImageProcess : NSObject

@property (nonatomic, strong) NSMutableArray *arrayImage;
@property (nonatomic, assign) NSInteger numberImage;

+ (id)instance;
- (void)clearData;
- (void)addImage:(UIImage *)imgae;
- (void)removeImageAtIndex:(NSInteger)index;
- (BOOL)isFullImage;
- (NSInteger)numberOfImages;
- (void)editImage:(UIImage *)image atIndex:(NSInteger)index;
- (BOOL)isEmptyImage;

@end
