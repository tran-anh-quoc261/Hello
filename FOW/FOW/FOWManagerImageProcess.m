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
        }
    }
    return _Instance;
}

@end
