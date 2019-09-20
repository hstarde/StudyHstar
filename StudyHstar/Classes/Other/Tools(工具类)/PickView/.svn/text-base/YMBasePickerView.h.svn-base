//
//  YMBasePickerView.h
//  YMOCCodeStandard
//
//  Created by iOS on 2018/11/12.
//  Copyright © 2018 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/** 内容视图高度 */
static CGFloat kContentViewHeight = 300;
/** 工具栏高度 */
static CGFloat kToolBarViewHeight = 48;


@interface YMBasePickerView : UIView

/** 内容视图 */
@property (nonatomic, strong, readonly) UIView *contentView;


/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 左侧按钮标签 */
@property (nonatomic, copy) NSString *leftBtnTitle;
/** 右侧按钮标签 */
@property (nonatomic, copy) NSString *rightBtnTitle;


/** 第一组当前选中的行 */
@property (assign,nonatomic) NSInteger firstComponentCurrentRow;
/** 第二组当前选中的行 */
@property (assign,nonatomic) NSInteger secondComponentCurrentRow;
/** 第三组当前选中的行 */
@property (assign,nonatomic) NSInteger thirdComponentCurrentRow;

@property (copy,nonatomic) void (^btnClickBlock)(BOOL btnyes,NSInteger oneRow,NSInteger twoRow,NSInteger thirdRow);

@property (strong,nonatomic) id curSelDate;
@property (copy,nonatomic) void (^Block_date)(BOOL btnyes,id value);


/**
 加载视图
 */
- (void)loadSubviews;


/**
 配置属性
 */
- (void)configProprty;

/**
 显示
 */
- (void)show;

- (void)hide;
@end

NS_ASSUME_NONNULL_END
