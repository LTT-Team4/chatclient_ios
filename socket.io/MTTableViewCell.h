//
//  MTTableViewCell.h
//  meshtiles
//
//  Created by Thanhnd on 10/3/13.
//
//

#import <UIKit/UIKit.h>

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

typedef enum {
    ALTableViewCellSeclectionTypeClear,
    ALTableViewCellSeclectionTypeNone,
    ALTableViewCellSeclectionTypeDefault,
    ALTableViewCellSeclectionTypeYellowBackGround
}ALTableViewCellSeclectionType;


@protocol MTTableViewCellProtocol <NSObject>

- (void)updateContentCell:(id)object; // Update Content of cell with new object
+ (CGFloat)heightForCellWithData:(id)object; // Height of cell
@end

@interface MTTableViewCell : UITableViewCell<MTTableViewCellProtocol>
@property (nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, assign) ALTableViewCellSeclectionType alSelectionType;
@property (nonatomic) UIColor *cellColor;
@property (nonatomic) NSString *pageName;
@property (nonatomic) NSString *eventName;
@property (nonatomic) NSString *categoryName;
- (id)initWithNib;
+ (NSString *)reuseIdentifier;
+ (NSString *)nibName;
- (id)initWithNibName:(NSString *)nibName;
@end
