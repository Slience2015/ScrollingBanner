//
//  MHGenealogyHomeVisitorsView.m
//  FamilyTree
//
//  Created by LeeSongtao on 16/8/11.
//  Copyright © 2016年 北京金色乐途网络科技有限公司. All rights reserved.
//

#import "SWScrollPromptView.h"

@interface SWScrollPromptView()

@property (nonatomic, strong) UILabel *visitLabel;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation SWScrollPromptView

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
    _visitLabel = [[UILabel alloc] init];
    [self addSubview:_visitLabel];
    _visitLabel.backgroundColor = [UIColor cyanColor];
    _visitLabel.text = @"  串门：";
    _visitLabel.font = [UIFont systemFontOfSize:14];
    
    _scrollView = [[UIScrollView alloc] init];
    [self addSubview:_scrollView];
    _scrollView.userInteractionEnabled = false;
    _scrollView.backgroundColor = [UIColor yellowColor];
    _scrollView.showsVerticalScrollIndicator = false;
    _scrollView.showsHorizontalScrollIndicator = false;
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame), 30);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _visitLabel.frame = CGRectMake(0, 0, 80, 30);
    _scrollView.frame = CGRectMake(CGRectGetWidth(_visitLabel.frame), 0, [UIScreen mainScreen].bounds.size.width - 10, 30);
}

- (void)itemsWith:(NSArray *)array {
    for (UIView *view in _scrollView.subviews) {
        [view removeFromSuperview];
    }
    
    NSInteger itemX = 0;
    for (NSInteger i = 0; i < array.count; i ++) {
        NSDictionary *dict = array[i];
        UILabel *visitorInfo = [[UILabel alloc] initWithFrame:CGRectMake(itemX + 10, 0, 0, 30)];
        [_scrollView addSubview:visitorInfo];
        visitorInfo.backgroundColor = [UIColor redColor];
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:dict[@"name"] attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:16]}];
        [text appendAttributedString:[[NSAttributedString alloc] initWithString:dict[@"time"] attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:13]}]];
        visitorInfo.attributedText = text;
        [visitorInfo sizeToFit];
        
        CGRect rect =[text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30.f) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) context:nil];
        visitorInfo.frame = CGRectMake(itemX + 10, 0, CGRectGetWidth(rect), 30);
        
        itemX = itemX + CGRectGetWidth(rect) + 10;
    }
    _scrollView.contentSize = CGSizeMake(itemX, 30);
    
    [self private_startTimer];
}

- (void)private_startTimer {
    [_timer invalidate];
    
    _scrollView.contentOffset = CGPointMake( - CGRectGetWidth(_scrollView.frame), 0);

    _timer = [NSTimer timerWithTimeInterval:0.02 target:self selector:@selector(private_timeLoad) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)private_timeLoad {
    if (_scrollView.contentOffset.x >= _scrollView.contentSize.width + 20) {
        [self private_startTimer];
    } else {
        CGFloat scrollMargin = CGRectGetWidth(_scrollView.frame)/400;
        CGFloat currentScroll =  _scrollView.contentOffset.x + scrollMargin;
        _scrollView.contentOffset = CGPointMake(currentScroll, 0);
    }
}

@end
