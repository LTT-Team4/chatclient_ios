//
//  ALItem.h
//  Alike
//
//  Created  on 4/1/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+Extra.h"
    
#define kDateFormatting @"yyyy-MM-dd HH:mm"
#define kDateFormattingYYYYMMDD @"yyyy.MM.dd"
#define kDateFormattingYYYYMM @"yyyy-MM"
#define kDateFormattingYYYY @"yyyy"

#define kDateFormattingYYYYMMDDPost @"yyyyMMdd"
#define kDateFormattingYYYYMMPost @"yyyyMM"
#define kDateFormattingYYYYPost @"yyyy"

#define kDateFormattingYYYYMMDDInfo @"yyyy/MM/dd"
#define kDateFormattingYYYYMMInfo @"yyyy/MM"
#define kDateFormattingYYYYInfo @"yyyy"
@interface MTItem : NSObject

@property (nonatomic, retain) NSDictionary *rootData;
@property (nonatomic) NSInteger itemId;
@property (nonatomic, retain) NSString *itemName;

+ (NSString *)distanceValueInString:(int)value;
+ (NSString *)countValueInString:(int)value;
+ (NSString *)stringYearMonthDayForDate:(NSDate *)date;
+ (NSString *)stringHourMinuteForDate:(NSDate *)date;
+ (BOOL)boolFromFlag:(NSString *)flag;
+ (NSString *)stringFromInteger:(NSUInteger)value;
+ (NSString *)stringFormatDateCreated:(NSDate *)date;

- (void)loadFullDataFromDictionary:(NSDictionary *)dictionary;
- (void)loadShortDataFromDictionary:(NSDictionary *)dictionary;
- (void)loadSimpleDataFromDictionary:(NSDictionary *)dictionary;

+ (NSArray *)arrayFullDataFromArrayDictionary:(NSArray *)array;
+ (NSArray *)arrayShortDataFromArrayDictionary:(NSArray *)array;
+ (NSArray *)arraySimpleDataFromArrayDictionary:(NSArray *)array;

+ (id)objectFullDataFromDictionary:(NSDictionary *)dictionary;
+ (id)objectShortDataFromDictionary:(NSDictionary *)dictionary;
+ (id)objectSimpleDataFromDictionary:(NSDictionary *)dictionary;

@end
