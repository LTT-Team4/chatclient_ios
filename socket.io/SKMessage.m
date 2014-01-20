//
//  SKMessage.m
//  socket.io
//
//  Created by Thanhnd on 12/5/13.
//  Copyright (c) 2013 THANHND. All rights reserved.
//

#import "SKMessage.h"

@implementation SKMessage
- (void)loadFullDataFromDictionary:(NSDictionary *)dictionary
{
    self.username  = [dictionary stringForKey:@"sender"];
    self.text = [dictionary stringForKey:@"message"];
}

+ (id)objectFullDataFromDictionary:(NSDictionary *)dictionary
{
    SKMessage *message = [[SKMessage alloc] init];
    [message loadFullDataFromDictionary:dictionary];
    return message;
}

+ (NSArray *)arrayFullDataFromArrayDictionary:(NSArray *)array
{
    if (array)
    {
        NSMutableArray *tempArray = [[NSMutableArray alloc] init] ;
        for (NSDictionary *dictionary in array)
        {
            SKMessage *message = [[SKMessage alloc] init];
            [message loadFullDataFromDictionary:dictionary];
            [tempArray addObject:message];
        }
        return [NSArray arrayWithArray:tempArray];
    }
    return nil;
}
@end
