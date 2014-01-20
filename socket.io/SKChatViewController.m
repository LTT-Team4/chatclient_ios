//
//  SKChatViewController.m
//  socket.io
//
//  Created by Thanhnd on 12/5/13.
//  Copyright (c) 2013 THANHND. All rights reserved.
//

#import "SKChatViewController.h"
#import "SKChatTableViewCell.h"
#import "SKMessage.h"
#import "SocketIOPacket.h"

@interface SKChatViewController ()

@end
@interface SKChatViewController (SocketDelegate) <SocketIODelegate>

@end

@interface SKChatViewController (UITextField) <UITextFieldDelegate>

@end
@implementation SKChatViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.socket = [[SocketIO alloc] initWithDelegate:self];
    [self.socket connectToHost:@"192.168.1.175" onPort:8000];
    
    
    self.messages = [[NSMutableArray alloc] init];
    self.txtChat = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, 300, 30)];
    [self.txtChat setBackgroundColor:RGB(111, 111, 111)];
    [self.txtChat setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.socket connectToHost:@"162.243.151.197" onPort:8000];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return self.txtChat.frame.size.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return self.txtChat;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SKChatTableViewCell heightForCellWithData:[self.messages objectAtIndex:indexPath.row]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SKChatTableViewCell";
    SKChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SKChatTableViewCell alloc] initWithNib];
    }
    [cell updateContentCell:[self.messages objectAtIndex:indexPath.row]];
    // Configure the cell...
    
    return cell;
}

@end


@implementation SKChatViewController (SocketDelegate)
- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet
{
    if (![packet.type isEqualToString:@"event"]) {
        return;
    }
    NSArray *messages = [SKMessage arrayFullDataFromArrayDictionary:packet.args];
    [self.messages addObjectsFromArray:messages];
    [self.tableView reloadData];
    
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:([self.messages count]-1) inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end

@implementation SKChatViewController (UITextField)

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.socket isConnected] && [textField.text length] >0) {
        SKMessage *message = [[SKMessage alloc] init];
        [message setUsername:self.username];
        [message setText:textField.text];
        
        NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
        [data setValue:message.username forKey:@"sender"];
        [data setValue:message.text forKey:@"message"];
        
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:data options:0 error:nil];
        NSString* jsonString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];

        
        [self.socket sendMessage:jsonString];
        
        
        self.txtChat.text = @"";
        [self.messages addObject:message];
        [self.tableView reloadData];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:([self.messages count]-1) inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    return YES;
}

@end
