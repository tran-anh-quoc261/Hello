//
//  FOWUtils.h
//  FOW
//
//  Created by nguyenkhoi on 11/1/13.
//  Copyright (c) 2013 nguyenkhoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FOWUtils : NSObject

//Date
+ (NSDate*)stringToDate:(NSString*)stringDate withFormat:(NSString*)format;
+ (NSString*)dateToString:(NSDate*)date withFormat:(NSString*)format;

+ (NSString *)trimString:(NSString*)string;
+ (BOOL) hasValidAPIKey;

@end
