//
//  NSDictionary+Extra.m
//  Pashadelic
//
//  Created on 20/7/12.
//  Copyright (c) 2013.  All rights reserved.
//

#import "NSDictionary+Extra.h"

@implementation NSDictionary (Extra)

- (NSDate *)dateForKey:(NSString *)key format:(NSString *)format
{
	id value = [self objectForKey:key];
	if (![value isKindOfClass:[NSString class]]) return nil;

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = format;
	return [dateFormatter dateFromString:value];
}

- (NSDate *)unixDateForKey:(NSString *)key
{
	NSTimeInterval interval = [self doubleForKey:key];
	return [NSDate dateWithTimeIntervalSince1970:interval/1000];
}

- (NSString *)stringForKey:(NSString *)key
{
	id value = [self objectForKey:key];
	if ([value isKindOfClass:[NSNull class]]) return @"";
	return value;
}

- (NSUInteger)intForKey:(NSString *)key
{
	id value = [self objectForKey:key];
    if ([value respondsToSelector:@selector(intValue)]) {
        return [value intValue];
    }
    return 0;
}

- (BOOL)boolForKey:(NSString *)key
{
	id value = [self objectForKey:key];
	if ([value isKindOfClass:[NSNull class]]) return 0;

	return [value boolValue];
}

- (double)doubleForKey:(NSString *)key
{
	id value = [self objectForKey:key];
	if ([value isKindOfClass:[NSNull class]]) return 0;

	return [value doubleValue];
}

- (float)floatForKey:(NSString *)key
{
	id value = [self objectForKey:key];
	if ([value isKindOfClass:[NSNull class]]) return 0;

	return [value floatValue];
}

- (NSNumber *)numberForKey:(NSString *)key
{
	id value = [self objectForKey:key];
	if ([value isKindOfClass:[NSNull class]]) return [NSNumber numberWithInt:0];

	if ([value isKindOfClass:[NSNumber class]]) {
		return value;
	} else if ([value isKindOfClass:[NSString class]]) {
		return [NSNumber numberWithDouble:[value doubleValue]];
	} else {
		return nil;
	}
}

- (NSArray *)arrayForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSMutableArray class]]) return value;
    return nil;
}

- (NSDictionary *)dictionaryWithValuesForOldKeys:(NSArray *)oldKeys andChangeToNewKeys:(NSArray *)newKeys;
{
    NSDictionary *dictionary = nil;
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionaryWithDictionary:[self dictionaryWithValuesForKeys:oldKeys]];
    
    if ([oldKeys count] == [newKeys count]) {
        for (int i = 0; i < [oldKeys count]; i++) {
            
            NSString *oldKey = [oldKeys objectAtIndex:i];
            NSString *newKey = [newKeys objectAtIndex:i];
            
            if(![oldKey isEqualToString:newKey])
            {
                [tempDict setObject:[tempDict objectForKey:oldKey] forKey:newKey];
                [tempDict removeObjectForKey:oldKey];
            }
        }
        dictionary = [NSDictionary dictionaryWithDictionary:tempDict];
    } else
        NSLog(@"Dictionary Values for keys: OldKeys array number is not equal NewKeys array number");
    
    return dictionary;
}

- (NSDictionary *)dictionaryByReplacingNullsWithStrings {
    NSMutableDictionary *prunedDictionary = [NSMutableDictionary dictionary];
    for (NSString * key in [self allKeys])
    {
        if (![[self objectForKey:key] isKindOfClass:[NSNull class]])
            [prunedDictionary setObject:[self objectForKey:key] forKey:key];
    }
    return [NSDictionary dictionaryWithDictionary:prunedDictionary];
}

@end
