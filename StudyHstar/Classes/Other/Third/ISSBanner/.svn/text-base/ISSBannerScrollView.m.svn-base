//
//  AutoScrollView.m
//  BannerView
//
//  Created by likai on 14-11-28.
//  Copyright (c) 2014年 ffcs. All rights reserved.
//

#import "ISSBannerScrollView.h"
#import "UIImageView+WebCache.h"
#import "NSTimer+EOCBlockSupport.h"
#import "HLCommonInfoProtocol.h"

static const int TitleLabelFont = 13;
static const float BottomContainerViewAlpha = 0.6;

@interface ISSBannerScrollView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (strong, nonatomic) UIView *bottomContainerView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) NSTimer *scrollTimer;

@property (strong, nonatomic) UIImageView *placeholderImageView;

//@property (weak, nonatomic) IBOutlet UIView *bottomContainerView;

@property (nonatomic, strong) NSMutableArray *imageViews;

@end

@implementation ISSBannerScrollView


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        
    }
    
    return self;
}

-(void)dealloc
{
    [self.scrollTimer invalidate];
    _contentScrollView.delegate = nil;
}

-(UIScrollView *)contentScrollView
{
    if(!_contentScrollView)
    {
        _contentScrollView = [UIScrollView new];
        _contentScrollView.translatesAutoresizingMaskIntoConstraints = NO;
        _contentScrollView.delegate = self;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.bounces = NO;
        UIGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [_contentScrollView addGestureRecognizer:tap];
        [self addSubview:_contentScrollView];
        
        //ScrollView 的大小和 self 一样
        NSMutableArray *constrains = [NSMutableArray new];
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[_contentScrollView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentScrollView)];
        [constrains addObjectsFromArray:horizontalConstraints];
        NSArray *verticalConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_contentScrollView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentScrollView)];
        [constrains addObjectsFromArray:verticalConstrains];
        [self addConstraints:constrains];
        [self setNeedsUpdateConstraints];
    }
    return _contentScrollView;
}

-(UIImageView *)placeholderImageView
{
    if(!_placeholderImageView)
    {
        _placeholderImageView = [UIImageView new];
        _placeholderImageView.userInteractionEnabled = YES;
        _placeholderImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _placeholderImageView.backgroundColor = [UIColor blueColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(placeholderImageViewTapped:)];
        [_placeholderImageView addGestureRecognizer:tap];
        
        [self addSubview:_placeholderImageView];
        
        //placeholderImageView 的大小和 self 一样
        NSMutableArray *constrains = [NSMutableArray new];
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[_placeholderImageView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_placeholderImageView)];
        [constrains addObjectsFromArray:horizontalConstraints];
        NSArray *verticalConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_placeholderImageView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_placeholderImageView)];
        [constrains addObjectsFromArray:verticalConstrains];
        [self addConstraints:constrains];
        [self setNeedsUpdateConstraints];

    }
    return _placeholderImageView;
}
- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [UIPageControl new];
        _pageControl.userInteractionEnabled = NO;
        _pageControl.hidesForSinglePage = YES;
        _pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.bottomContainerView addSubview:_pageControl];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        //_pageControl 的大小和 _bottomContainerView 一样
        _pageControl.translatesAutoresizingMaskIntoConstraints = NO;
//        _pageControl.backgroundColor=[UIColor blueColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        NSMutableArray *constrains = [NSMutableArray new];
        NSArray *horizontalConstraints;
        if (KScreenWidth==320) {
            horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-190-[_pageControl]-0-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_pageControl)];
        }else if (KScreenWidth==375) {
            horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-245-[_pageControl]-0-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_pageControl)];
        }else{
            horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-294-[_pageControl]-0-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_pageControl)];
        }
//        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-14-[_pageControl]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_pageControl)];
        [constrains addObjectsFromArray:horizontalConstraints];
        NSArray *verticalConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_pageControl]-25-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_pageControl)];
        [constrains addObjectsFromArray:verticalConstrains];
//        self.bottomContainerView.backgroundColor=[UIColor greenColor];
        [self.bottomContainerView addConstraints:constrains];
        [self.bottomContainerView setNeedsUpdateConstraints];
    }
    
    
    
    return _pageControl;
}
- (UIView *)bottomContainerView
{
    if (!_bottomContainerView) {
        _bottomContainerView = [UIView new];
        _bottomContainerView.backgroundColor = [UIColor clearColor];
        _bottomContainerView.alpha = BottomContainerViewAlpha;
        _bottomContainerView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_bottomContainerView];
        
        NSMutableArray *constrains = [NSMutableArray new];
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[_bottomContainerView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomContainerView)];
        [constrains addObjectsFromArray:horizontalConstraints];
        NSArray *verticalConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bottomContainerView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomContainerView)];
        [constrains addObjectsFromArray:verticalConstrains];
        NSArray *heightConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bottomContainerView(==28)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomContainerView)];
        [constrains addObjectsFromArray:heightConstrains];
        [self addConstraints:constrains];
    }
    
    return _bottomContainerView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:TitleLabelFont];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [self.bottomContainerView addSubview:_titleLabel];
        
        //titleLabel 的大小和 _bottomContainerView 一样, _bottomContainerView的高度由titleLabel确定
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        NSMutableArray *constrains = [NSMutableArray new];
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-14-[_titleLabel]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel)];
        [constrains addObjectsFromArray:horizontalConstraints];
        NSArray *verticalConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_titleLabel]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel)];
        [constrains addObjectsFromArray:verticalConstrains];
        [self.bottomContainerView addConstraints:constrains];
        
        [self.bottomContainerView setNeedsUpdateConstraints];

    }
    
    
    return _titleLabel;
}

-(NSMutableArray *)imageViews
{
    if(!_imageViews)
    {
        _imageViews = NSMutableArray.new;
    }
    return _imageViews;
}


-(void)removeAllImageViewsFromContentScrollView
{
    for (UIImageView *imageView in self.imageViews) {
        [imageView removeFromSuperview];
    }
    [self.imageViews removeAllObjects];
    [self.contentScrollView removeConstraints: self.contentScrollView.constraints];
    
    [self.scrollTimer invalidate];
}

- (void)handleTap:(UITapGestureRecognizer *)tap {
    if ([_delegate respondsToSelector:@selector(bannerScrollView:didSelectedAtIndex:)]) {
        [_delegate bannerScrollView:self didSelectedAtIndex:self.pageControl.currentPage];
    }
}

-(void)placeholderImageViewTapped:(UITapGestureRecognizer *)tap
{
    if ([_delegate respondsToSelector:@selector(placeholderSelectedInBannerScrollView:)]) {
        [_delegate placeholderSelectedInBannerScrollView:self];
    }
}

-(void)reload
{
    [self removeAllImageViewsFromContentScrollView];
    if(self.banners.count == 0)
    {
        self.placeholderImageView.image = self.loadingPlaceholderImage;
        self.placeholderImageView.hidden = NO;
        self.contentScrollView.hidden = YES;
        return;
    }
    
    self.placeholderImageView.hidden = YES;
    self.contentScrollView.hidden = NO;
    self.contentScrollView.contentSize = CGSizeMake(self.bounds.size.width * self.banners.count, self.bounds.size.height);
    for (int i = 0; i < [self.banners count]; i++)
    {
        id<HLCommonInfoProtocol> commonInfo = self.banners[i];
        NSString *imageString = [commonInfo commonInfoImageURLString];
        
        UIImageView *imageView = [UIImageView new];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageString] placeholderImage:self.loadingPlaceholderImage options:SDWebImageAllowInvalidSSLCertificates];
        [self.imageViews addObject:imageView];
        [self.contentScrollView addSubview:imageView];
    }
    [self.contentScrollView addConstraints:[self createConstrainsInContentScrollView]];
    

    self.pageControl.numberOfPages = [self.banners count];
    self.pageControl.currentPage = 0;
    self.titleLabel.text = [((id<HLCommonInfoProtocol>)self.banners[0]) commonInfoTitle];
    [self.contentScrollView setContentOffset:CGPointZero animated:YES];
    [self startTimmering];
    [self.contentScrollView setNeedsUpdateConstraints];
}

-(void)startTimmering
{
    self.scrollTimer = nil;
    if([self.banners count] == 1) return;
    
    __weak __typeof(self) weakSelf = self;
    if(self.timeInterval == 0) self.timeInterval = 3;
    self.scrollTimer = [NSTimer eoc_scheduledTimerWithTimeInterval:self.timeInterval block:^{
        __typeof(self) strongSelf = weakSelf;
        [strongSelf scrollImageViews];
    } repeats:YES];
}


-(NSArray *)createConstrainsInContentScrollView
{
    if([self.imageViews count] == 0) return nil;
    NSMutableArray *constrains = [NSMutableArray new];
    UIImageView *firstImageView = self.imageViews.firstObject;
    //添加第一张imageview视图的大小约束，大小和ScrollView的bounds一样
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[firstImageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(firstImageView)];
    [constrains addObjectsFromArray:horizontalConstraints];
    NSArray *verticalConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[firstImageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(firstImageView)];
    [constrains addObjectsFromArray:verticalConstrains];
    NSArray *widthConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"[firstImageView(==_contentScrollView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(firstImageView, _contentScrollView)];
    [constrains addObjectsFromArray:widthConstrains];

    NSArray *heightConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[firstImageView(==_contentScrollView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(firstImageView, _contentScrollView)];
    [constrains addObjectsFromArray:heightConstrains];
    
    //从第二个ImageView起，每个大小和第一个一样，距离ScrollView顶部的距离为0
    for (int i = 1; i < self.imageViews.count; i++) {
        UIImageView *previousImageView = self.imageViews[i - 1];
        UIImageView *currentImageView = self.imageViews[i];
        
        NSArray *equalWidthConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"[previousImageView(==currentImageView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousImageView, currentImageView)];
        [constrains addObjectsFromArray:equalWidthConstrains];
        
        NSArray *equalHeightConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousImageView(==currentImageView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousImageView, currentImageView)];
        [constrains addObjectsFromArray:equalHeightConstrains];
        
        
        NSArray *zeroDistanceConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"[previousImageView]-0-[currentImageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousImageView, currentImageView)];
        [constrains addObjectsFromArray:zeroDistanceConstrains];
        
        //对齐约束
        NSArray *topSpaceConstrain = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[currentImageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousImageView, currentImageView)];
        [constrains addObjectsFromArray:topSpaceConstrain];
    }
    
    
    return constrains;
}


#pragma mark - 计时器
- (void)scrollImageViews
{
    CGFloat pageWidth = self.contentScrollView.bounds.size.width;
    NSInteger page = self.pageControl.currentPage;
    page++;
    if (page == [self.banners count]) {
        page = 0;
        [self.contentScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        self.titleLabel.text = [((id<HLCommonInfoProtocol>)self.banners[page]) commonInfoTitle];
    }
    [self.contentScrollView setContentOffset:CGPointMake(pageWidth * page, 0) animated:YES];
     self.titleLabel.text = [((id<HLCommonInfoProtocol>)self.banners[page]) commonInfoTitle];
     self.pageControl.currentPage = page;
}
#pragma mark - 松手时
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    NSInteger page = offset.x / bounds.size.width;
    [self.pageControl setCurrentPage:page];
    self.titleLabel.text = [((id<HLCommonInfoProtocol>)self.banners[page]) commonInfoTitle];
}

@end
