//
//  ISSBannerCollectionViewCell.m
//  HuaLian
//
//  Created by likai on 14-12-15.
//  Copyright (c) 2014年 lanjing. All rights reserved.
//

#import "ISSBannerCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface ISSBannerCollectionViewCell()
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UILabel *title;
@end

@implementation ISSBannerCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
    }
    return _imageView;
}
- (UILabel *)title{
    if (!_title) {
        UIImageView *bottomContainerView = [[UIImageView alloc] initWithFrame:CGRectMake(2, self.bounds.size.height - 18, self.bounds.size.width - 4, 18)];
        bottomContainerView.image =KPlaceholder_head;
        [self addSubview:bottomContainerView];
        _title = [[UILabel alloc] initWithFrame:CGRectMake(2, 0, bottomContainerView.bounds.size.width ,bottomContainerView.bounds.size.height)];
        _title.font = [UIFont systemFontOfSize:12.0];
        _title.textColor = [UIColor whiteColor];
        _title.textAlignment = NSTextAlignmentLeft;
        [bottomContainerView addSubview:_title];
    }
    return _title;
}

-(void)bindData:(id<HLCommonInfoProtocol>)data
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[data commonInfoImageURLString]] placeholderImage: KPlaceholder_head options:SDWebImageAllowInvalidSSLCertificates];
    self.title.text = [data commonInfoTitle];
}
@end
