//
//  VerticalButton.m
//  VRProject
//
//  Created by macbook on 2017/3/21.
//  Copyright © 2017年 ffcs. All rights reserved.
//

#import "VerticalButton.h"

#define titleHeight 18
#define bottomH 6

#define margintop 5
#define marginleft 14

#define LbH 14

//#define imgW 44

@implementation VerticalButton
{
    UILabel *_lbredCount;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self createRedcountLabel];
    }
    return self;
}
-(void)createRedcountLabel
{
    _lbredCount=[[UILabel alloc]init];
    _lbredCount.textColor=[UIColor whiteColor];
    _lbredCount.backgroundColor=[UIColor redColor];
    _lbredCount.font=[UIFont systemFontOfSize:10];
    _lbredCount.textAlignment=NSTextAlignmentCenter;
    [_lbredCount setCorner:LbH/2];
    [self addSubview:_lbredCount];
}


-(void)setRedLb:(NSString *)redCount
{
    if (redCount!=nil && ![redCount isEqualToString:@""]) {
        _lbredCount.hidden=NO;
        float lbW=LbH;
        if (redCount.length==1) {
            lbW=LbH;
            _lbredCount.text=redCount;
        }else if (redCount.length==2) {
            lbW=LbH+3;
            _lbredCount.text=redCount;
        }else{
            lbW=LbH+9;
            _lbredCount.text=@"99﹢";
        }
        
        _lbredCount.frame=CGRectMake(self.frame.size.width-lbW-12, 8, lbW, LbH);
        
        
    }else{
        _lbredCount.hidden=YES;
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat imgW=KScreenWidth/8;
    CGFloat left=(self.frame.size.width-imgW)/2;
    CGFloat top=(self.frame.size.height-imgW-titleHeight-bottomH)/2+3;
    self.imageView.frame=CGRectMake(left, top, imgW, imgW);
    self.titleLabel.frame=CGRectMake(0, self.frame.size.height-bottomH-titleHeight, self.frame.size.width, titleHeight);
    
    
    
    
    
    
//    CGFloat cwidth=self.frame.size.width-2*marginleft;
//    
//    if (cwidth>60) {
//        cwidth=60;
//        CGFloat left=(self.frame.size.width-cwidth)/2;
//        self.imageView.frame=CGRectMake(left, margintop, cwidth, cwidth);
//        self.imageView.layer.cornerRadius=cwidth/2;
//    }else if(cwidth<40)
//    {
//        cwidth=40;
//        CGFloat left=(self.frame.size.width-cwidth)/2;
//        self.imageView.frame=CGRectMake(left, margintop, cwidth, cwidth);
//        self.imageView.layer.cornerRadius=cwidth/2;
//    }else{
//        self.imageView.frame=CGRectMake(marginleft, margintop, cwidth, cwidth);
//        self.imageView.layer.cornerRadius=cwidth/2;
//    }
    //self.imageView.layer.cornerRadius=imgW/2;
    //self.imageView.layer.masksToBounds=YES;
    //self.backgroundColor=[UIColor whiteColor];
//    self.backgroundColor=KRandomColor;
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font=[UIFont systemFontOfSize:11];//   KFontSize12;
    
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
}


@end
