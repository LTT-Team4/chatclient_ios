//
//  SKViewController.m
//  socket.io
//
//  Created by Thanhnd on 12/5/13.
//  Copyright (c) 2013 THANHND. All rights reserved.
//

#import "SKViewController.h"
#import "SKChatViewController.h"

@interface SKViewController ()

@end
@interface SKViewController (SocketDelegate) <SocketIODelegate>

@end
@interface SKViewController (UITextField) <UITextFieldDelegate>

@end
@implementation SKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.socket = [[SocketIO alloc] initWithDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.socket connectToHost:@"192.168.1.175" onPort:8000];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

@implementation SKViewController (UITextField)

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField.text length] > 0 && [self.socket isConnected]) {
        SKChatViewController *chatViewController = [[SKChatViewController alloc] init];
        chatViewController.username = textField.text;
        [self.navigationController pushViewController:chatViewController animated:NO];
    }else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Not connect or username is empty" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertView show];
    }
    return YES;
}

@end
@implementation SKViewController (SocketDelegate)

- (void) socketIODidConnect:(SocketIO *)socket
{
    [self.lblStatus setText:@"Connected!"];
}

@end
