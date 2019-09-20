//
//  AutoScrollView.m
//  BannerView
//
//  Created by likai on 14-11-28.
//  Copyright (c) 2014年 ffcs. All rights reserved.
//

#import "HLImagesScrollView.h"
#import "UIImageView+WebCache.h"
#import "NSTimer+EOCBlockSupport.h"
#import "HLCommonInfoProtocol.h"


@interface HLImagesScrollView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (strong, nonatomic) NSTimer *scrollTimer;
@property (nonatomic, strong) NSMutableArray *imageViews;


@end

@implementation HLImagesScrollView


-(void)dealloc
{
    [self.scrollTimer invalidate];
    _contentScrollView.delegate = nil;
}

////使用AutoLayout  autolayout的布局的子视图直接添加在UIWindow，而不是ViewController的view上，子视图的大小为0
//-(UIScrollView *)contentScrollView
//{
//    if(!_contentScrollView)
//    {
//        _contentScrollView = [UIScrollView new];
//        _contentScrollView.translatesAutoresizingMaskIntoConstraints = NO;
//        _contentScrollView.delegate = self;
//        _contentScrollView.showsHorizontalScrollIndicator = NO;
//        _contentScrollView.showsHorizontalScrollIndicator = NO;
//        _contentScrollView.pagingEnabled = YES;
//        _contentScrollView.bounces = NO;
//        UIGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//        [_contentScrollView addGestureRecognizer:tap];
//        [self addSubview:_contentScrollView];
//        
//        //ScrollView 的大小和 self 一样
//        NSMutableArray *constrains = [NSMutableArray new];
//        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[_contentScrollView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentScrollView)];
//        [constrains addObjectsFromArray:horizontalConstraints];
//        NSArray *verticalConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_contentScrollView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentScrollView)];
//        [constrains addObjectsFromArray:verticalConstrains];
//        [self addConstraints:constrains];
//        [self setNeedsUpdateConstraints];
//    }
//    return _contentScrollView;
//}


//不使用AutoLayout
-(UIScrollView *)contentScrollView
{
    if(!_contentScrollView)
    {
        _contentScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _contentScrollView.translatesAutoresizingMaskIntoConstraints = NO;
        _contentScrollView.delegate = self;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.bounces = NO;
        UIGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [_contentScrollView addGestureRecognizer:tap];
        [self addSubview:_contentScrollView];

//        //ScrollView 的大小和 self 一样
//        NSMutableArray *constrains = [NSMutableArray new];
//        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[_contentScrollView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentScrollView)];
//        [constrains addObjectsFromArray:horizontalConstraints];
//        NSArray *verticalConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_contentScrollView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentScrollView)];
//        [constrains addObjectsFromArray:verticalConstrains];
//        [self addConstraints:constrains];
//        [self setNeedsUpdateConstraints];
    }
    return _contentScrollView;
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
    if ([_delegate respondsToSelector:@selector(imagesScrollView:didSelectedAtIndex:)]) {
        [_delegate imagesScrollView:self didSelectedAtIndex:[self currentPageIndex]];
    }
}

////使用AutoLayout
//-(void)reload
//{
//    [self removeAllImageViewsFromContentScrollView];
//    if(self.banners.count == 0)
//    {
//        return;
//    }
//    
//    self.contentScrollView.hidden = NO;
//    self.contentScrollView.contentSize = CGSizeMake(self.bounds.size.width * self.banners.count, self.bounds.size.height);
//    for (int i = 0; i < [self.banners count]; i++)
//    {
//        NSParameterAssert([self.banners[i] conformsToProtocol:@protocol(HLCommonInfoProtocol)]);
//        id<HLCommonInfoProtocol> commonInfo = self.banners[i];
//        UIImageView *imageView = [UIImageView new];
//        imageView.translatesAutoresizingMaskIntoConstraints = NO;
//        if([commonInfo respondsToSelector:@selector(commonInfoImageName)] && [[commonInfo commonInfoImageName] length])
//        {
//            imageView.image = [HLImageService imageNamed:[commonInfo commonInfoImageName]];
//        }
//        else if([commonInfo respondsToSelector:@selector(commonInfoImageURLString)] && [[commonInfo commonInfoImageURLString] length])
//        {
//            [imageView sd_setImageWithURL:[NSURL URLWithString:[commonInfo commonInfoImageURLString]] placeholderImage:self.loadingPlaceholderImage];
//        }
//        
//        [self.imageViews addObject:imageView];
//        [self.contentScrollView addSubview:imageView];
//    }
//    [self.contentScrollView addConstraints:[self createConstrainsInContentScrollView]];
//    
//
//    [self.contentScrollView setContentOffset:CGPointZero animated:YES];
//    [self startTimmering];
//    [self.contentScrollView setNeedsUpdateConstraints];
//}

//使用AutoLayout
-(void)reload
{
    [self removeAllImageViewsFromContentScrollView];
    if(self.banners.count == 0)
    {
        return;
    }
    
    self.contentScrollView.hidden = NO;
    self.contentScrollView.contentSize = CGSizeMake(self.bounds.size.width * self.banners.count, self.bounds.size.height);
    for (int i = 0; i < [self.banners count]; i++)
    {
        NSParameterAssert([self.banners[i] conformsToProtocol:@protocol(HLCommonInfoProtocol)]);
        id<HLCommonInfoProtocol> commonInfo = self.banners[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
        if([commonInfo respondsToSelector:@selector(commonInfoImageName)] && [[commonInfo commonInfoImageName] length])
        {
            imageView.image =[UIImage imageNamed:[commonInfo commonInfoImageName]];// [HLImageService imageNamed:[commonInfo commonInfoImageName]];
        }
        else if([commonInfo respondsToSelector:@selector(commonInfoImageURLString)] && [[commonInfo commonInfoImageURLString] length])
        {
            [imageView sd_setImageWithURL:[NSURL URLWithString:[commonInfo commonInfoImageURLString]] placeholderImage:self.loadingPlaceholderImage];
        }
        
        [self.imageViews addObject:imageView];
        [self.contentScrollView addSubview:imageView];
    }
    
    [self.contentScrollView setContentOffset:CGPointZero animated:YES];
    [self startTimmering];
}


-(void)startTimmering
{
    self.scrollTimer = nil;
    
    
    __weak __typeof(self) weakSelf = self;
    if(self.timeInterval <= 0) self.timeInterval = 3;
    self.scrollTimer = [NSTimer eoc_scheduledTimerWithTimeInterval:self.timeInterval block:^{
        __typeof(self) strongSelf = weakSelf;
        [strongSelf scrollImageViews];
    } repeats:YES];
}


//-(NSArray *)createConstrainsInContentScrollView
//{
//    if([self.imageViews count] == 0) return nil;
//    NSMutableArray *constrains = [NSMutableArray new];
//    UIImageView *firstImageView = self.imageViews.firstObject;
//    //添加第一张imageview视图的大小约束，大小和ScrollView的bounds一样
//    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[firstImageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(firstImageView)];
//    [constrains addObjectsFromArray:horizontalConstraints];
//    NSArray *verticalConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[firstImageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(firstImageView)];
//    [constrains addObjectsFromArray:verticalConstrains];
//    NSArray *widthConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"[firstImageView(==_contentScrollView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(firstImageView, _contentScrollView)];
//    [constrains addObjectsFromArray:widthConstrains];
//
//    NSArray *heightConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[firstImageView(==_contentScrollView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(firstImageView, _contentScrollView)];
//    [constrains addObjectsFromArray:heightConstrains];
//    
//    //从第二个ImageView起，每个大小和第一个一样，距离ScrollView顶部的距离为0
//    for (int i = 1; i < self.imageViews.count; i++) {
//        UIImageView *previousImageView = self.imageViews[i - 1];
//        UIImageView *currentImageView = self.imageViews[i];
//        
//        NSArray *equalWidthConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"[previousImageView(==currentImageView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousImageView, currentImageView)];
//        [constrains addObjectsFromArray:equalWidthConstrains];
//        
//        NSArray *equalHeightConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousImageView(==currentImageView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousImageView, currentImageView)];
//        [constrains addObjectsFromArray:equalHeightConstrains];
//        
//        
//        NSArray *zeroDistanceConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"[previousImageView]-0-[currentImageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousImageView, currentImageView)];
//        [constrains addObjectsFromArray:zeroDistanceConstrains];
//        
//        //对齐约束
//        NSArray *topSpaceConstrain = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[currentImageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousImageView, currentImageView)];
//        [constrains addObjectsFromArray:topSpaceConstrain];
//    }
//    
//    
//    return constrains;
//}


#pragma mark - 计时器
- (void)scrollImageViews
{
//    if([self.banners count] == 1) return;
    
    CGFloat pageWidth = self.contentScrollView.bounds.size.width;
    NSInteger page = [self currentPageIndex];
    page++;
    if (page >= [self.banners count]) {
        
        if([self.delegate respondsToSelector:@selector(imagesscrollViewDidSrollToLastImage:)])
        {
            [self.delegate imagesscrollViewDidSrollToLastImage:self];
        }
        [self.scrollTimer invalidate];
        return;
    }
    [self.contentScrollView setContentOffset:CGPointMake(pageWidth * page, 0) animated:YES];
}

-(NSInteger)currentPageIndex
{
    CGFloat pageWidth = self.contentScrollView.bounds.size.width;
    NSInteger page = self.contentScrollView.contentOffset.x/pageWidth;
    return page;
}

@end
