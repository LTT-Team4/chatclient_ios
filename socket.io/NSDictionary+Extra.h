//
//  NSDictionary+Extra.h
//  Pashadelic
//
//  Created on 20/7/12.
//  Copyright (c) 2013.  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extra)

- (NSDate *)dateForKey:(NSString *)key format:(NSString *)format;
- (NSDate *)unixDateForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSUInteger)intForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key;
- (float)floatForKey:(NSString *)key;
- (NSNumber *)numberForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryWithValuesForOldKeys:(NSArray *)oldKeys andChangeToNewKeys:(NSArray *)newKeys;
- (NSDictionary *)dictionaryByReplacingNullsWithStrings;

@end
