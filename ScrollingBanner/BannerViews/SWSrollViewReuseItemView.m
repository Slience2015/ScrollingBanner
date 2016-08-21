//
//  MHGenealogyHomeRedpacketView.m
//  FamilyTree
//
//  Created by LeeSongtao on 16/8/11.
//  Copyright © 2016年 北京金色乐途网络科技有限公司. All rights reserved.
//

#import "SWSrollViewReuseItemView.h"

@interface SWSrollViewReuseItemView()<UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger numbersOfPages;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *separateLine;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSMutableArray <MHRedpacketItemButton *> *visibleItems;

@end

@implementation SWSrollViewReuseItemView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initializeMainView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializeMainView];
    }
    return self;
}

- (void)initializeMainView {
    
    _scrollView = [[UIScrollView alloc] init];
    [self addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = false;
    _scrollView.pagingEnabled = true;
    
    _separateLine = [[UIView alloc] init];
    [self addSubview:_separateLine];
    _separateLine.backgroundColor = [UIColor grayColor];
    
    _pageControl = [[UIPageControl alloc] init];
    [self addSubview:_pageControl];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _scrollView.frame = CGRectMake(0, 0, gScreenWidth, CGRectGetHeight(self.frame));
    _pageControl.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 10 - 10, gScreenWidth, 10);
    
    _separateLine.frame = CGRectMake(0, HomeRedpacketItemMargin*2 + ITEMHEIGHT , (_itemsDataArray.count/8 > 4 ? _numbersOfPages : --_numbersOfPages)*gScreenWidth  , 0.5);
}

- (void)redpacketItemsWithStartPage:(NSInteger)startPage {
    
    _pageControl.currentPage = startPage;
    NSInteger maxIndexOfItem = (startPage + 1)*8;
    if (startPage + 1 >= _numbersOfPages) {
        maxIndexOfItem = _itemsDataArray.count;
    }
    NSInteger startpage = 0;
    NSInteger numbersOfLimitCycle = _itemsDataArray.count > 8 ? 8 : _itemsDataArray.count;
    for (; startpage < numbersOfLimitCycle; startpage ++) {
        
        NSInteger row = startpage/4;
        NSInteger col = startpage%4;
        
        MHRedpacketItemButton *item;
        if (self.visibleItems.count == 24) {
            if (startPage >= 3) {
                item = [self.visibleItems objectAtIndex:startPage%3*8 + startpage];
            } else {
                item = [self.visibleItems objectAtIndex:startPage*8 + startpage];
            }
        }
        
        if (!item) {
           item = [[MHRedpacketItemButton alloc] initWithFrame:CGRectMake(startPage*CGRectGetWidth(_scrollView.frame) + col*(ITEMWIDTH + HomeRedpacketItemMargin) + HomeRedpacketItemMargin + startpage/8*gScreenWidth, row*(ITEMHEIGHT + 2*HomeRedpacketItemMargin) + HomeRedpacketItemMargin, ITEMWIDTH, ITEMHEIGHT) status:@"0"];
            [_scrollView addSubview:item];
            [item addTarget:self action:@selector(updateItemStatus:) forControlEvents:UIControlEventTouchUpInside];
            if (self.visibleItems.count < 24) {
                [self.visibleItems addObject:item];
            }
        } else {
//            [UIView animateWithDuration:0.25 animations:^{
                [item updateItemWith:CGRectMake(startPage*CGRectGetWidth(_scrollView.frame) + col*(ITEMWIDTH + HomeRedpacketItemMargin) + HomeRedpacketItemMargin + startpage/8*gScreenWidth, row*(ITEMHEIGHT + 2*HomeRedpacketItemMargin) + HomeRedpacketItemMargin, ITEMWIDTH, ITEMHEIGHT) status:@"0"];
//            }];
        }
        NSLog(@"startpage/8 = %ld gScreenWidth = %f",startpage/8,gScreenWidth);
    }
}

- (void)updateItemStatus:(MHRedpacketItemButton *)item {
    item.redpacketStatus = @"1";
}

#pragma mark UIScrollViewDelegate 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x/gScreenWidth;
    if (currentPage != _pageControl.currentPage) {
        _pageControl.currentPage = currentPage;
        [self redpacketItemsWithStartPage:currentPage];
    }
}

#pragma mark getter
- (void)setItemsDataArray:(NSArray *)itemsDataArray {
    
    _itemsDataArray = itemsDataArray;
    _numbersOfPages = itemsDataArray.count/8 + (itemsDataArray.count%8 > 0? 1 : 0);
    _pageControl.numberOfPages = _numbersOfPages;
    _scrollView.contentSize = CGSizeMake(gScreenWidth*_numbersOfPages, 0);
    
}

#pragma mark setter
- (NSMutableArray <MHRedpacketItemButton *>*)visibleItems {
    if (!_visibleItems) {
        _visibleItems = [NSMutableArray new];
    }
    return _visibleItems;
}

@end



@interface MHRedpacketItemButton()

@end

@implementation MHRedpacketItemButton

- (instancetype)initWithFrame:(CGRect)frame status:(NSString *)redpacketStatus {
    if (self = [super initWithFrame:frame]) {
        _redpacketStatus = redpacketStatus;
        [self initializedButton];
    }
    return self;
}

- (void)updateItemWith:(CGRect)frame status:(NSString *)redpacketStatus {
    self.frame = frame;
    self.redpacketStatus = redpacketStatus;
}

- (void)initializedButton {
    
    self.layer.masksToBounds = true;
    self.layer.cornerRadius = 8.0;
    
    _backgroundImageView = [[UIImageView alloc] init];
    [self addSubview:_backgroundImageView];
    [_backgroundImageView setImage:[UIImage imageNamed:@"home_fulienvelope_btn"]];
    
    _redpacketAmount = [[UILabel alloc] init];
    [self addSubview:_redpacketAmount];
    _redpacketAmount.text = @"0.78";
    _redpacketAmount.font = [UIFont systemFontOfSize:14];
    _redpacketAmount.textColor = [UIColor yellowColor];
    _redpacketAmount.textAlignment = NSTextAlignmentCenter;
    
    _redpacketOwnerHeadImageView = [[UIImageView alloc] init];
    [self addSubview:_redpacketOwnerHeadImageView];
    _redpacketOwnerHeadImageView.layer.masksToBounds = true;
    [_redpacketOwnerHeadImageView setImage:[UIImage imageNamed:@"tabbar_village"]];
    
    _redpacketOwnerName = [[UILabel alloc] init];
    [self addSubview:_redpacketOwnerName];
    _redpacketOwnerName.text = @"张三";
    _redpacketOwnerName.font = [UIFont systemFontOfSize:14];
    _redpacketOwnerName.textColor = [UIColor whiteColor];
    _redpacketOwnerName.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _backgroundImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    _redpacketAmount.frame = CGRectMake(0, 6, CGRectGetWidth(_backgroundImageView.frame), 20);
    
    CGFloat headImageWidth = CGRectGetWidth(self.frame)*0.4;
    _redpacketOwnerHeadImageView.layer.cornerRadius = headImageWidth*0.5;
    if ([_redpacketStatus isEqualToString:@"0"]) {
        _redpacketAmount.hidden = true;
        _redpacketOwnerHeadImageView.frame = CGRectMake(CGRectGetWidth(self.frame)*0.6*0.5, CGRectGetWidth(self.frame)*0.25, headImageWidth, headImageWidth);
    } else {
        _redpacketAmount.hidden = false;
        _redpacketOwnerHeadImageView.frame = CGRectMake(CGRectGetWidth(self.frame)*0.6*0.5, CGRectGetMaxY(_redpacketAmount.frame) + 10, headImageWidth, headImageWidth);
    }
    
    _redpacketOwnerName.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 25, CGRectGetWidth(_backgroundImageView.frame), 20);
}

#pragma getter 
- (void)setRedpacketStatus:(NSString *)redpacketStatus {
    _redpacketStatus = redpacketStatus;
    [self layoutSubviews];
}

@end
