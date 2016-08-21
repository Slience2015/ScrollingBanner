# ScrollingBanner
rolling banner

SWScrollPromptView 内部拥有一个scrollView，实现了无线平滑的滚动效果

/**
 *  根据数组中的数据内容，初始化items
 *
 *  @param array 数据数组
 */
- (void)itemsWith:(NSArray *)array;


SWSrollViewReuseItemView 内部拥有一个srollView,实现对其内部item的简单复用
/**
 *  数据数组 其setter中计算pageControl的numbersOfPage
 */
@property (nonatomic, strong) NSArray *itemsDataArray;
/**
 *  根据startPage 重用或者创建item
 *
 *  @param startPage 当前页
 */
- (void)redpacketItemsWithStartPage:(NSInteger)startPage;


