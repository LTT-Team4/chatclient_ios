//
//  SKChatTableViewCell.m
//  socket.io
//
//  Created by Thanhnd on 12/5/13.
//  Copyright (c) 2013 THANHND. All rights reserved.
//

#import "SKChatTableViewCell.h"
#import "SKMessage.h"

@implementation SKChatTableViewCell

- (id)initWithNib
{
    NSArray *viewArrray = [[NSBundle mainBundle] loadNibNamed:@"SKChatTableViewCell" owner:nil options:nil];
    if (viewArrray) {
        self = [viewArrray objectAtIndex:0];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize sizeToFit = [self.message.text sizeWithFont:[UIFont boldSystemFontOfSize:13] constrainedToSize:CGSizeMake(290.0f, CGFLOAT_MAX)];
    CGRect frame = self.lblText.frame;
    frame.size.height = sizeToFit.height;
    self.lblText.frame = frame;
}

+ (CGFloat)heightForCellWithData:(SKMessage *)message
{
    float h = 56;
    CGSize sizeToFit = [message.text sizeWithFont:[UIFont boldSystemFontOfSize:13] constrainedToSize:CGSizeMake(290.0f, CGFLOAT_MAX)];
    
    h = h + sizeToFit.height - 20;
    
    return h;
}

- (void)updateContentCell:(SKMessage *)message
{
    self.message = message;
    [self.lblUsername setText:message.username];
    [self.lblText setText:message.text];
    [self setNeedsDisplay];
}



@end
