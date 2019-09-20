//
//  YMPickerToolBarView.h
//  YMOCCodeStandard
//
//  Created by iOS on 2018/11/12.
//  Copyright © 2018 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YMPickerToolBarView : UIView

@property (copy,nonatomic) void (^Block)(BOOL isYes);

/** 标题标签 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 左侧按钮 */
@property (nonatomic, strong) UIButton *leftBtn;
/** 右侧按钮 */
@property (nonatomic, strong) UIButton *rightBtn;
/** 下划线 */
@property (nonatomic, strong) UIView *lineview;

@end

NS_ASSUME_NONNULL_END
