//
//  SKChatTableViewCell.h
//  socket.io
//
//  Created by Thanhnd on 12/5/13.
//  Copyright (c) 2013 THANHND. All rights reserved.
//

#import "MTTableViewCell.h"


@class SKMessage;

@interface SKChatTableViewCell : MTTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblUsername;
@property (weak, nonatomic) IBOutlet UILabel *lblText;
@property (nonatomic) SKMessage *message;
@end
