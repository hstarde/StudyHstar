//
//  YMPickerToolBarView.m
//  YMOCCodeStandard
//
//  Created by iOS on 2018/11/12.
//  Copyright © 2018 iOS. All rights reserved.
//

#import "YMPickerToolBarView.h"

/** 按钮宽度 */
static CGFloat kButtonWidth = 100;
/** 按钮左右间隙 */
static CGFloat kMargin = 15;

@interface YMPickerToolBarView ()

@end

@implementation YMPickerToolBarView

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
    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
    [self addSubview:self.titleLabel];
    [self addSubview:self.lineview];
}

#pragma mark - - 配置属性
- (void)configProprty {
    // 左侧按钮
    [self.leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 右侧按钮
    [self.rightBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor hex:@"009E3B"] forState:UIControlStateNormal];
    self.rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 中间标题
    self.titleLabel.text = @"请选择";
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = [UIColor hex:@"666666"];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.lineview.backgroundColor=[UIColor hex:@"999999"];
}

#pragma mark - - 布局视图
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.leftBtn.frame = CGRectMake(kMargin, 0, kButtonWidth, self.height);
    self.rightBtn.frame = CGRectMake(self.width - kButtonWidth - kMargin, 0, kButtonWidth, self.height);
    self.titleLabel.frame = CGRectMake(self.leftBtn.right, 0, self.width - 2 * kButtonWidth - 2 * kMargin, self.height);
    self.lineview.frame=CGRectMake(0, self.height-0.5, self.width, 0.5);
}

#pragma mark - - 左侧按钮点击调用
- (void)leftBtnClick:(UIButton *)sender {
    if (self.Block) {
        self.Block(NO);
    }
}

#pragma mark 右侧按钮点击调用
- (void)rightBtnClick:(UIButton *)sender {
    if (self.Block) {
        self.Block(YES);
    }
}

#pragma mark - - lazyLoadUI
- (UIButton *)leftBtn {
    if (_leftBtn == nil) {
        _leftBtn = [[UIButton alloc] init];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (_rightBtn == nil) {
        _rightBtn = [[UIButton alloc] init];
    }
    return _rightBtn;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}
-(UIView *)lineview
{
    if (_lineview==nil) {
        _lineview=[[UIView alloc]init];
    }
    return _lineview;
}

@end
