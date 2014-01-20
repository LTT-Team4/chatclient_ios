//
//  SKViewController.h
//  socket.io
//
//  Created by Thanhnd on 12/5/13.
//  Copyright (c) 2013 THANHND. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketIO.h"

@interface SKViewController : UIViewController
@property (nonatomic) SocketIO *socket;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@end
