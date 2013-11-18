//
//  FOWManagerFacebookProcess.m
//  FOW
//
//  Created by Anh Quoc on 11/13/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import "FOWManagerFacebookProcess.h"

static FOWManagerFacebookProcess *_Instance = nil;

@implementation FOWManagerFacebookProcess

+ (id)instance {
    @synchronized(self) {
        if (_Instance == nil) {
            _Instance = [[FOWManagerFacebookProcess alloc] init];
        }
    }
    return _Instance;
}

- (BOOL)isFacebookConnectActive {
    return [self isConnect];
}

@end
