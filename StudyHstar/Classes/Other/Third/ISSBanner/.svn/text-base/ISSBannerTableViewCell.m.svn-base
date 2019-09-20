//
//  ISSBannerTableViewCell.m
//  HuaLian
//
//  Created by likai on 14-12-16.
//  Copyright (c) 2014年 lanjing. All rights reserved.
//

#import "ISSBannerTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface ISSBannerTableViewCell()


@end

@implementation ISSBannerTableViewCell

- (void)bindData:(id<HLCommonInfoProtocol>)data
{
    [self.scapeImageView sd_setImageWithURL:[NSURL URLWithString:[data commonInfoImageURLString]] placeholderImage:KPlaceholder_head options:SDWebImageAllowInvalidSSLCertificates];
    NSString *timeLabelString = [self cutString:[data commonInfoTitle]];
    NSString *secondString = [self cutString:timeLabelString];
    self.timeLabel.text = [self cutSpaceString:secondString];
}
- (NSString *)cutString:(NSString *)targetString
{
    NSRange range = [targetString rangeOfString:@"-"];
    NSString *substring = [targetString substringFromIndex:NSMaxRange(range)];
    return substring;
}
- (NSString *)cutSpaceString:(NSString *)targetString
{
    NSRange range = [targetString rangeOfString:@" "];
    NSString *substring = [targetString substringFromIndex:NSMaxRange(range)];
    return substring;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)awakeFromNib
{
    self.bannerLine.image = KPlaceholder_head;
    self.bannerDot.image =KPlaceholder_head;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
- (void)drawRect:(CGRect)rect {
   
}

@end
