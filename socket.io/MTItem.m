//
//  ALItem.m
//  Alike
//
//  Created  on 4/1/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "MTItem.h"

@implementation MTItem

- (void)loadFullDataFromDictionary:(NSDictionary *)dictionary;
{
    self.rootData = [dictionary dictionaryByReplacingNullsWithStrings];
}

- (void)loadShortDataFromDictionary:(NSDictionary *)dictionary
{
    self.rootData = dictionary;
}

- (void)loadSimpleDataFromDictionary:(NSDictionary *)dictionary
{
    self.rootData = dictionary;
}

+ (NSString *)countValueInString:(int)value
{
    if (value > 999999) {
		return [NSString stringWithFormat:@"%dm", value / 1000000];
	} else if (value > 9999) {
		return [NSString stringWithFormat:@"%dk", value / 10000];
	} else {
		return [NSString stringWithFormat:@"%d", value];
	}
}

+ (NSString *)distanceValueInString:(int)value
{
    if (value > 999) {
		return [NSString stringWithFormat:@"%dkm", value / 1000];
	} else {
		return [NSString stringWithFormat:@"%dm", value];
	}
}

+ (NSString *)stringYearMonthDayForDate:(NSDate *)date
{
    
    NSDateFormatter* df_local = [[NSDateFormatter alloc] init];
    [df_local setTimeZone:[NSTimeZone timeZoneWithName:@"EST"]];
    [df_local setDateFormat:kDateFormattingYYYYMMDD];

    return [df_local stringFromDate:date];
}

+ (NSString *)stringHourMinuteForDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = @"HH:mm";
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFormatDateCreated:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = @"yyyy/MM/dd HH:mm";
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFromInteger:(NSUInteger)value
{
    return [NSString stringWithFormat:@"%d", value];
}

+ (NSArray *)arrayFullDataFromArrayDictionary:(NSArray *)array
{
    return nil;
}

+ (NSArray *)arrayShortDataFromArrayDictionary:(NSArray *)array
{
    return nil;
}

+ (NSArray *)arraySimpleDataFromArrayDictionary:(NSArray *)array
{
    return nil;
}

+ (id)objectShortDataFromDictionary:(NSDictionary *)dictionary
{
    return nil;
}

+ (id)objectFullDataFromDictionary:(NSDictionary *)dictionary;
{
    return nil;
}

+ (id)objectSimpleDataFromDictionary:(NSDictionary *)dictionary
{
    return nil;
}

+ (BOOL)boolFromFlag:(NSString *)flag
{
    return [flag isEqualToString:@"t"];
}
@end
