//
//  MTTableViewCell.m
//  meshtiles
//
//  Created by Thanhnd on 10/3/13.
//
//

#import "MTTableViewCell.h"

@implementation MTTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.alSelectionType = ALTableViewCellSeclectionTypeDefault;
        self.cellColor = self.contentView.backgroundColor;
    }
    return self;
}

- (id)initWithNib
{
    UITableViewCellStyle style = UITableViewCellStyleDefault;
    NSString *identifier = NSStringFromClass([self class]);
    
    if ((self = [super initWithStyle:style reuseIdentifier:identifier])) {
        
        NSString *nibName = [[self class] nibName];
        if (nibName) {
            
            [[NSBundle mainBundle] loadNibNamed:nibName
                                          owner:self
                                        options:nil];
            
            [self addSubview:self.containerView];
        }
    }
    return self;
}

+ (CGFloat)heightForCellWithData:(id)object
{
    return 44.0f;
}

- (id)initWithNibName:(NSString *)nibName
{
    UITableViewCellStyle style = UITableViewCellStyleDefault;
    
    if ((self = [super initWithStyle:style reuseIdentifier:nibName])) {
        if (nibName) {
            
            [[NSBundle mainBundle] loadNibNamed:nibName
                                          owner:self
                                        options:nil];
            
            [self addSubview:self.containerView];
        }
    }
    return self;
}

- (void)updateContentCell:(id)object
{
    return;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.containerView.frame = self.contentView.bounds;
}
+ (NSString *)reuseIdentifier {
    
    return NSStringFromClass([self class]);
}

+ (NSString *)nibName {
    return [self reuseIdentifier];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    self.backgroundColor = [UIColor clearColor];
    self.cellColor = self.contentView.backgroundColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.alSelectionType = ALTableViewCellSeclectionTypeClear;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


@end
