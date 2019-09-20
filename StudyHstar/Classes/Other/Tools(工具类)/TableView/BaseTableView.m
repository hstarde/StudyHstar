//
//  BaseTableView.m
//  CarAppBuyers
//
//  Copyright © 2015年 Copyright © 1998 - 2015 autoapp. All rights reserved.
//

#import "BaseTableView.h"

@interface BaseTableView ()

@property (nonatomic, weak) UIView *containerView;
@property (nonatomic, weak) UIImageView *backgroundImageView;
@property (nonatomic, weak) UILabel *backgroundLabelView;
@property (nonatomic, weak) UILabel *backgroundSubLabelView;

@property (nonatomic, weak) UIButton *btn;

@end

@implementation BaseTableView

- (NSMutableArray *)listData {
    if (!_listData) {
        _listData = [NSMutableArray array];
    }
    return _listData;
}




- (instancetype)init {
    if (self = [super init]) {
        [self setupBGImage];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupBGImage];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self setupBGImage];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupBGImage];
    }
    return self;
}

- (void)setupBGImage {
    
    UIView *containerView = [[UIView alloc] init];
    containerView.backgroundColor = [UIColor clearColor];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    backgroundImageView.hidden = YES;
    backgroundImageView.backgroundColor = [UIColor clearColor];
    [containerView addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    
    UILabel *backgroundLabelView = [[UILabel alloc] init];
    backgroundLabelView.hidden = YES;
    backgroundLabelView.textAlignment = NSTextAlignmentCenter;
    backgroundLabelView.textColor = [UIColor blackColor];
    backgroundLabelView.backgroundColor = [UIColor clearColor];
    backgroundLabelView.font = kLabelViewFontSize;
    backgroundLabelView.lineBreakMode = NSLineBreakByWordWrapping;
    backgroundLabelView.numberOfLines = 0;
    [containerView addSubview:backgroundLabelView];
    self.backgroundLabelView = backgroundLabelView;
    
    UILabel *backgroundSubLabelView = [[UILabel alloc] init];
    backgroundSubLabelView.hidden = YES;
    backgroundSubLabelView.textAlignment = NSTextAlignmentCenter;
    backgroundSubLabelView.textColor = [UIColor grayColor];
    backgroundSubLabelView.backgroundColor = [UIColor clearColor];
    backgroundSubLabelView.font = kSubLabelViewFontSize;
    backgroundSubLabelView.lineBreakMode = NSLineBreakByWordWrapping;
    backgroundSubLabelView.numberOfLines = 0;
    [containerView addSubview:backgroundSubLabelView];
    self.backgroundSubLabelView = backgroundSubLabelView;
    
//    UIButton *tmpbtn=[ToolsManager textButton:CGRectNull taregt:self action:@selector(btnClick) title:@"随便逛逛" size:12 upColor:[UIColor grayColor] downColor:[UIColor grayColor] tag:3];
//    tmpbtn.backgroundColor=KColor_BGGray;
//    [GlobalManager setBorder:tmpbtn andborderWidth:1 andColor:KColor_LineGray];
//    [GlobalManager setCorner:tmpbtn andRadius:4];
//    [containerView addSubview:tmpbtn];
//    self.btn=tmpbtn;
    
    self.containerView = containerView;
    self.backgroundView = containerView;
}
-(void)btnClick
{
    if (self.didClickBlock) {
        self.didClickBlock();
    }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    
    _backgroundImage = backgroundImage;
    
    self.backgroundImageView.image = self.backgroundImage;
}

- (void)setBackgroundText:(NSString *)backgroundText {
    
    _backgroundText = backgroundText;
    
    self.backgroundLabelView.text = self.backgroundText;
    
    NSRange range = [self.backgroundText rangeOfString:@"\n"];
    
    if (range.length) {
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.backgroundLabelView.attributedText];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        
        [paragraphStyle setLineSpacing:kLabelViewLineSpacing]; //调整标题行间距
        
        [attributedString addAttribute:NSParagraphStyleAttributeName
                                 value:paragraphStyle
                                 range:NSMakeRange(0, range.location)];
        
        [self.backgroundLabelView setAttributedText:attributedString];
    }
}

- (void)setBackgroundSubText:(NSString *)backgroundSubText {
    
    _backgroundSubText = backgroundSubText;
    
    self.backgroundSubLabelView.text = self.backgroundSubText;
    
    NSRange range = [self.backgroundSubText rangeOfString:@"\n"];
    
    if (range.length) {
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.backgroundSubLabelView.attributedText];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        
        [paragraphStyle setLineSpacing:kSubLabelViewLineSpacing]; //调整子标题行间距
        
        [attributedString addAttribute:NSParagraphStyleAttributeName
                                 value:paragraphStyle
                                 range:NSMakeRange(0, range.location)];
        
        [self.backgroundSubLabelView setAttributedText:attributedString];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.containerView.frame = self.backgroundView.frame;
    
    CGFloat containerViewW = self.containerView.size.width;
    CGFloat containerViewH = self.containerView.size.height;
    
    CGFloat backgroundImageViewW = self.backgroundImage.size.width;
    CGFloat backgroundImageViewH = self.backgroundImage.size.height;
    CGFloat backgroundImageViewX = containerViewW * 0.5 - backgroundImageViewW * 0.5;
    CGFloat backgroundImageViewY = containerViewH * 0.5 - backgroundImageViewH * 0.5;
    
    if (self.backgroundText) { //标题
        CGFloat backgroundLabelViewHeight = [self.backgroundText heightWithFontSize:13 width:containerViewW];
        //调整图片的Y位置
        backgroundImageViewY = containerViewH * 0.5 - (backgroundImageViewH + backgroundLabelViewHeight + kLabelViewBorder) * 0.5;
        
        CGFloat backgroundLabelViewW = containerViewW;
        CGFloat backgroundLabelViewH = backgroundLabelViewHeight;
        CGFloat backgroundLabelViewX = containerViewW * 0.5 - backgroundLabelViewW * 0.5;
        CGFloat backgroundLabelViewY = backgroundImageViewY + backgroundImageViewH + kLabelViewBorder;
        
        //设置标题的位置
        self.backgroundLabelView.frame = CGRectMake(backgroundLabelViewX, backgroundLabelViewY, backgroundLabelViewW, backgroundLabelViewH);
        
        if (self.backgroundSubText) { //子标题
            
            CGFloat backgroundSubLabelViewHeight = [self.backgroundSubText heightWithFontSize:13 width:containerViewW];
            //调整图片的Y位置
            backgroundImageViewY = containerViewH * 0.5 - (backgroundImageViewH + backgroundSubLabelViewHeight + backgroundSubLabelViewHeight + kLabelViewBorder) * 0.5;
            //调整标题的Y位置
            backgroundLabelViewY = backgroundImageViewY + backgroundImageViewH + kLabelViewBorder;
            //调整标题的位置
            self.backgroundLabelView.frame = CGRectMake(backgroundLabelViewX, backgroundLabelViewY, backgroundLabelViewW, backgroundLabelViewH);
            
            CGFloat backgroundSubLabelViewW = containerViewW;
            CGFloat backgroundSubLabelViewH = backgroundSubLabelViewHeight;
            CGFloat backgroundSubLabelViewX = containerViewW * 0.5 - backgroundSubLabelViewW * 0.5;
            CGFloat backgroundSubLabelViewY = backgroundLabelViewY + backgroundLabelViewH + kLabelViewBorder;
            
            //设置子标题的位置
            self.backgroundSubLabelView.frame = CGRectMake(backgroundSubLabelViewX, backgroundSubLabelViewY, backgroundSubLabelViewW, backgroundSubLabelViewH);
            
            float btnW=80;
            float btnH=30;
            self.btn.frame=CGRectMake((KScreenWidth-btnW)/2, backgroundSubLabelViewY+backgroundSubLabelViewH+10, btnW, btnH);
            
        }
    }
    self.backgroundImageView.frame = CGRectMake(backgroundImageViewX, backgroundImageViewY, backgroundImageViewW, backgroundImageViewH);
}

- (void)reloadData {
    
    [super reloadData];
    
    self.backgroundImageView.hidden = _listData.count;
    self.backgroundLabelView.hidden = _listData.count;
    self.backgroundSubLabelView.hidden = _listData.count;
    self.btn.hidden = _listData.count;
}

@end
