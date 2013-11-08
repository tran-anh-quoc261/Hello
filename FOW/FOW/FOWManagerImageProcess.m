//
//  FOWManagerImageProcess.m
//  FOW
//
//  Created by Anh Quoc on 11/4/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWManagerImageProcess.h"

static FOWManagerImageProcess *_Instance = nil;

@implementation FOWManagerImageProcess

+ (id)instance {
    @synchronized(self) {
        if (_Instance == nil) {
            _Instance = [[FOWManagerImageProcess alloc] init];
            _Instance.arrayImage = [[NSMutableArray alloc] init];
        }
    }
    return _Instance;
}

- (void)clearData {
    [_Instance.arrayImage removeAllObjects];
    _Instance.numberImage = 0;
}

- (void)addImage:(UIImage *)imgae {
    [_Instance.arrayImage addObject:imgae];
}

- (void)removeImageAtIndex:(NSInteger)index {
    [_Instance.arrayImage removeObjectAtIndex:index];
}

- (void)editImage:(UIImage *)image atIndex:(NSInteger)index {
    [_Instance.arrayImage removeObjectAtIndex:index];
    [_Instance.arrayImage insertObject:image atIndex:index];
}

- (NSInteger)numberOfImages {
    return [_Instance.arrayImage count];
}

- (BOOL)isFullImage {
    if ([_Instance.arrayImage count] >= 5) 
        return YES;
    else
        return NO;
}

- (BOOL)isEmptyImage {
    if ([_Instance.arrayImage count] <= 0) 
        return YES;
    else
        return NO;
}

@end
