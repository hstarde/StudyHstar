//
//  TimelineView.m
//  TimeLineView
//
//  Created by foscom on 16/7/23.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "TimelineView.h"
#import "lineView.h"
#define ktimelineOffSet ([UIScreen mainScreen].bounds.size.width/2.f)

@interface TimelineView ()<UIScrollViewDelegate>
@property(nonatomic,strong)UILabel *label;
@end

@implementation TimelineView



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        self.bounces=NO;
        self.showsVerticalScrollIndicator=NO;
        self.showsHorizontalScrollIndicator=NO;
        self.contentSize = CGSizeMake(144*20+ktimelineOffSet*2, 0);
        
        lineView *line = [[lineView alloc] initWithFrame:CGRectMake(0, 0, 144*20+ktimelineOffSet*2, self.frame.size.height)];
        line.backgroundColor =[UIColor whiteColor];
        [self addSubview:line];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(ktimelineOffSet-0.5, 0, 1, self.frame.size.height)];
        _label.backgroundColor = kdefaulColor;
        
        [self insertSubview:_label aboveSubview:line];
    }
    return self;
}


- (void)setTimeValue:(NSString *)timeValue
{
    NSArray *arr = [timeValue componentsSeparatedByString:@":"];
    
    NSInteger offsetX =  ([arr[0] intValue] *60 +[arr[1] intValue]) *2;
    
    [self setContentOffset:CGPointMake(offsetX, self.contentOffset.y)];
}
// 计算时间点 ： 20个点等于10分钟 1分钟 2 个点

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    NSInteger SumMin = self.contentOffset.x/2; // 根据时间点计算分钟
    
    NSInteger hour = SumMin/60;
    NSInteger min = SumMin%60;

    NSString *time = [NSString stringWithFormat:@"%02ld:%02ld",(long)hour,(long)min];
    if (self.Block_scroll) {
        self.Block_scroll(time);
    }
    
    _label.frame = CGRectMake(self.contentOffset.x+self.frame.size.width/2.f-0.5, 0, 1, self.frame.size.height);
}

//如果想在UIScrollView停止滚动之后做一些操作,有以下两种情况:
//* 没有惯性:只会调用停止拖拽的方法,不会调用停止减速的方法
//* 有惯性:既会调用停止拖拽的方法,也会调用停止减速的方法
//+ 所以:以后要判断UIScrollView是否停止滚动,需要同时重写两个方法:
//* scrollViewDidEndDragging
//scrollViewDidEndDecelerating
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(decelerate == NO){
        [self scrollViewDidEndDecelerating:scrollView];
    }else{
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 在这里面写scrollView停止时需要做的事情
    NSInteger SumMin = self.contentOffset.x/2; // 根据时间点计算分钟
    
    NSInteger hour = SumMin/60;
    NSInteger min = SumMin%60;
    
    NSString *time = [NSString stringWithFormat:@"%02ld:%02ld",(long)hour,(long)min];
    if (self.Block) {
        self.Block(time);
    }
}

@end
