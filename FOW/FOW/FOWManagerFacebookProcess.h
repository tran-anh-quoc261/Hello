//
//  FOWManagerFacebookProcess.h
//  FOW
//
//  Created by Anh Quoc on 11/13/13.
//  Copyright (c) 2013 Mulodo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FOWManagerFacebookProcess : NSObject

@property (nonatomic, assign) BOOL isConnect;

+ (id)instance;
- (BOOL)isFacebookConnectActive;

@end
