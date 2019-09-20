//
//  YMBasePickerView.m
//  YMOCCodeStandard
//
//  Created by iOS on 2018/11/12.
//  Copyright © 2018 iOS. All rights reserved.
//

#import "YMBasePickerView.h"
#import "YMPickerToolBarView.h"

@interface YMBasePickerView ()

/** 透明视图 */
@property (nonatomic, strong) UIControl *alphaView;
/** 内容视图 */
@property (nonatomic, strong, readwrite) UIView *contentView;
/** 工具栏 */
@property (nonatomic, strong) YMPickerToolBarView *toolBarView;



@end

@implementation YMBasePickerView

#pragma mark - - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // MARK: 加载视图
        [self loadSubviews];
        // MARK: 配置视图
        [self configProprty];
        // MARK: 需要的时候布局
        [self layoutIfNeeded];
    }
    return self;
}

#pragma mark - - 加载视图
- (void)loadSubviews {
    [self addSubview:self.alphaView];
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.toolBarView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

#pragma mark - - 配置属性
- (void)configProprty {
    // MARK: self
    self.hidden = YES;
    
    // MARK: 透明视图
    self.alphaView.backgroundColor = [UIColor blackColor];
    self.alphaView.alpha = 0.5f;
    [self.alphaView addTarget:self action:@selector(alphaViewAction) forControlEvents:UIControlEventTouchUpInside];
    
    // MARK: 内容视图
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    // MARK: 工具栏
    self.toolBarView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - - 布局视图
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.alphaView.frame = CGRectMake(0, 0, self.width, self.height);
    self.contentView.frame = CGRectMake(0, self.height, self.width, kContentViewHeight);
    self.toolBarView.frame = CGRectMake(0, 0, self.contentView.width, kToolBarViewHeight);
}

#pragma mark - - 透明视图点击调用
- (void)alphaViewAction {
    KLog(@"我是透明视图，我被点击了");
    [self hide];
}


#pragma mark - - 显示
- (void)show {
    self.contentView.top = self.height;
    self.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.top = self.height - kContentViewHeight;
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark  隐藏
- (void)hide {
    self.hidden = YES;
}


-(void)setTitle:(NSString *)title
{
    _title=title;
    if (title!=nil) {
        self.toolBarView.titleLabel.text = title;
    }
}
-(void)setLeftBtnTitle:(NSString *)leftBtnTitle
{
    _leftBtnTitle=leftBtnTitle;
    if (leftBtnTitle!=nil) {
        [self.toolBarView.leftBtn setTitle:leftBtnTitle forState:UIControlStateNormal];
    }
}
-(void)setRightBtnTitle:(NSString *)rightBtnTitle
{
    _rightBtnTitle=rightBtnTitle;
    if (rightBtnTitle!=nil) {
        [self.toolBarView.rightBtn setTitle:rightBtnTitle forState:UIControlStateNormal];
    }
}

#pragma mark - - lazyLoadUI
- (UIControl *)alphaView {
    if (_alphaView == nil) {
        _alphaView = [[UIControl alloc] init];
    }
    return _alphaView;
}

- (UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

- (YMPickerToolBarView *)toolBarView {
    if (_toolBarView == nil) {
        _toolBarView = [[YMPickerToolBarView alloc] init];
        WEAKSELF
        _toolBarView.Block = ^(BOOL isYes) {
            if (isYes) {
                if (weakSelf.btnClickBlock) {
                    weakSelf.btnClickBlock(YES, weakSelf.firstComponentCurrentRow, weakSelf.secondComponentCurrentRow, weakSelf.thirdComponentCurrentRow);
                }
                if (weakSelf.Block_date) {
                    weakSelf.Block_date(YES, weakSelf.curSelDate);
                }
                
            }else{
                if (weakSelf.btnClickBlock) {
                    weakSelf.btnClickBlock(NO, weakSelf.firstComponentCurrentRow, weakSelf.secondComponentCurrentRow, weakSelf.thirdComponentCurrentRow);
                }
                if (weakSelf.Block_date) {
                    weakSelf.Block_date(NO, weakSelf.curSelDate);
                }
            }
        };
    }
    return _toolBarView;
}


#pragma mark - - lazyLoadData

@end
