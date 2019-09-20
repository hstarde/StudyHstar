//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)
//把View加在Window上
- (void) addToWindow;
//设置圆角
-(void)setCorner:(CGFloat)radius;
//设置边框
-(void)setBorderWidth:(CGFloat)borderWidth andColor:(UIColor *)color;
@end

@interface UIView (Screenshot)
//当前视图
-(UIViewController *)curVC;
//View截图
- (UIImage*) screenshot;

//ScrollView截图 contentOffset
- (UIImage*) screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;

//View按Rect截图
- (UIImage*) screenshotInFrame:(CGRect)frame;

//整个view转成图片
- (UIImage*) convertToImage;
@end

@interface UIView (Animation)

//左右抖动动画
- (void) shakeAnimation;

//旋转180度
- (void) trans180DegreeAnimation;

@end

