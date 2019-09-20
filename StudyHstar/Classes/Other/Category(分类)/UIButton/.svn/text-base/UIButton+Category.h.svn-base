//
//  UIButton+Category.h
//  haitao
//
//  Created by Yuen-iMac on 16/5/4.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight, // image在右，label在左
    MKButtonEdgeInsetsStyleRight_downbtn // image在右，label在左  下拉框按钮
};

typedef void(^ButtonActionCallBack)(UIButton *button);
@interface UIButton (Category)
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

-(void)addCallBackAction:(ButtonActionCallBack)action
        forControlEvents:(UIControlEvents)controlEvents;

-(void)addCallBackAction:(ButtonActionCallBack)action;

@end

@interface UIButton (EnlargeTouchArea)

/**
 *  扩大 UIButton 的點擊範圍
 *  控制上下左右的延長範圍
 *
 *  @param top    <#top description#>
 *  @param right  <#right description#>
 *  @param bottom <#bottom description#>
 *  @param left   <#left description#>
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
