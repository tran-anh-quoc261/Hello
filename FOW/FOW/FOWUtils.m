//
//  FOWUtils.m
//  FOW
//
//  Created by nguyenkhoi on 11/1/13.
//  Copyright (c) 2013 nguyenkhoi. All rights reserved.
//

#import "FOWUtils.h"
#import "AppDelegate.h"

@implementation FOWUtils
// Trim space of string
+ (NSString *)trimString:(NSString*)string {
    NSCharacterSet *charsToTrim = [NSCharacterSet characterSetWithCharactersInString:@" \n"];
    return [string stringByTrimmingCharactersInSet:charsToTrim];
}

#pragma mark - Dates
+ (NSDate*)stringToDate:(NSString*)stringDate withFormat:(NSString*)format {
    if( stringDate == nil || [stringDate length] == 0)return nil;
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
	dateFormatter.dateFormat = format;
	return [dateFormatter dateFromString:stringDate];
	
}
+ (NSString*)dateToString:(NSDate*)date withFormat:(NSString*)format {
	if( date == nil )return @"";
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
	dateFormatter.dateFormat = format;
	return [dateFormatter stringFromDate:date];
	
}

+ (UIView *) getMainView {
    return [kFOWAppDelegate window];
}

#pragma mark - Data
+ (BOOL) hasValidAPIKey {
    NSString * key = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Aviary-API-Key"];
    if ([key isEqualToString:@"<YOUR_API_KEY>"]) {
        [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"You forgot to add your API key!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return NO;
    }
    return YES;
}

@end
