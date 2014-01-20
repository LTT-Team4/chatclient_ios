//
//  SKChatViewController.h
//  socket.io
//
//  Created by Thanhnd on 12/5/13.
//  Copyright (c) 2013 THANHND. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketIO.h"

@interface SKChatViewController : UITableViewController
@property (nonatomic) SocketIO *socket;
@property (nonatomic) NSString *username;
@property (nonatomic) NSMutableArray *messages;
@property (nonatomic) UITextField *txtChat;

@end
