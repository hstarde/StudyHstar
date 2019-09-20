//
//  PhotoCell.m
//  LookingJob
//
//  Created by 何仕德 on 2017/10/25.
//  Copyright © 2017年 hstar. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell()

@property (weak, nonatomic) IBOutlet UIButton *btnClose;

@property (nonatomic,strong) NSIndexPath *indexp;

@end


@implementation PhotoCell



+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"PhotoCell";
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.indexp=indexPath;
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PhotoCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.img setCorner:6];
}
- (IBAction)btnCloseClick:(id)sender {
    if (self.block_Del) {
        self.block_Del(self.indexp);
    }
}

-(void)setIsShowClose:(BOOL)isShowClose
{
    _isShowClose=isShowClose;
    self.btnClose.hidden=!isShowClose;
}

-(void)setImg_icon:(id)img_icon
{
    _img_icon=img_icon;
    if (img_icon==nil) {
        [self.img setImage:[UIImage imageNamed:@"addphoto"]];
    }else{
        if ([img_icon isKindOfClass:[UIImage class]]) {
            UIImage *img=img_icon;
            [self.img setImage:img];
        }else if([img_icon isKindOfClass:[NSString class]]){
           NSString *imgStr=img_icon;
            [self.img sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:KPlaceholder options:SDWebImageAllowInvalidSSLCertificates];
        }else{
            [self.img setImage:KPlaceholder];
        }
    }
}

@end
