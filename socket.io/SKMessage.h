//
//  SKMessage.h
//  socket.io
//
//  Created by Thanhnd on 12/5/13.
//  Copyright (c) 2013 THANHND. All rights reserved.
//

#import "MTItem.h"

@interface SKMessage : MTItem
@property (nonatomic) NSString *username;
@property (nonatomic) NSString *text;
@end
