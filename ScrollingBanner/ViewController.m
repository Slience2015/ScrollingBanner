//
//  ViewController.m
//  ScrollingBanner
//
//  Created by LeeSongtao on 16/8/21.
//  Copyright © 2016年 CANG. All rights reserved.
//

#import "ViewController.h"
#import "SWScrollPromptView.h"
#import "SWSrollViewReuseItemView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SWScrollPromptView *promptView;
@property (weak, nonatomic) IBOutlet SWSrollViewReuseItemView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_promptView itemsWith:@[@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "},@{@"name":@"了刻录机",@"time":@" 2016-08-13 "}]];
    
    _scrollView.itemsDataArray = @[@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "},@{@"name":@"了刻录机",@"time":@" 2016-08-13 "},@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "},@{@"name":@"了刻录机",@"time":@" 2016-08-13 "},@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "},@{@"name":@"了刻录机",@"time":@" 2016-08-13 "},@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "},@{@"name":@"了刻录机",@"time":@" 2016-08-13 "},@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "},@{@"name":@"了刻录机",@"time":@" 2016-08-13 "},@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "},@{@"name":@"了刻录机",@"time":@" 2016-08-13 "},@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "},@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "},@{@"name":@"了刻录机",@"time":@" 2016-08-13 "},@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "},@{@"name":@"了刻录机",@"time":@" 2016-08-13 "},@{@"name":@"人力",@"time":@" 08-09 "},@{@"name":@"人力哈哈",@"time":@" 08-10 "},@{@"name":@"天天",@"time":@" 08-11 "},@{@"name":@"也一样",@"time":@" 2016-08-09 "},@{@"name":@"快快快",@"time":@" 2016-08-12 "}];
    [_scrollView redpacketItemsWithStartPage:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
