//
//  MHGenealogyHomeRedpacketView.h
//  FamilyTree
//
//  Created by LeeSongtao on 16/8/11.
//  Copyright © 2016年 北京金色乐途网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat HomeRedpacketItemMargin = 15.0;
#define ITEMWIDTH ([UIScreen mainScreen].bounds.size.width - 5*HomeRedpacketItemMargin)/4
#define ITEMHEIGHT ITEMWIDTH*1.3

#define gScreenWidth [UIScreen mainScreen].bounds.size.width

@interface SWSrollViewReuseItemView : UIView

@property (nonatomic, strong) NSArray *itemsDataArray;

- (void)redpacketItemsWithStartPage:(NSInteger)startPage;

@end



@interface MHRedpacketItemButton : UIControl

@property (nonatomic, copy) NSString *redpacketStatus;

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *redpacketOwnerHeadImageView;
@property (nonatomic, strong) UILabel *redpacketOwnerName;
@property (nonatomic, strong) UILabel *redpacketAmount;

- (instancetype)initWithFrame:(CGRect)frame status:(NSString *)redpacketStatus;
- (void)updateItemWith:(CGRect)frame status:(NSString *)redpacketStatus;
@end