//
//  ItemCollectionCell.m
//  CropsCliet
//
//  Created by macbook on 2019/3/13.
//  Copyright © 2019 hstar. All rights reserved.
//

#import "ItemCollectionCell.h"

@interface ItemCollectionCell()

@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *lbname;


@end
@implementation ItemCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.img setCorner:28];
}
//id和instancetype的区别 instancetype只能做返回值.编译时判断类型不符合会发出警告  一般用在系统初始化方法中 alloc 等.
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ItemCollectionCell";
    ItemCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ItemCollectionCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
//-(void)setModel:(ExpertModel *)model
//{
//    _model=model;
//    if ([model.img containsString:@"http"]) {
//        [self.img sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:KPlaceholder];
//    }else{
//        [self.img sd_setImageWithURL:[NSURL URLWithString:API_IMG_URL(model.img)] placeholderImage:KPlaceholder];
//    }
//    self.lbname.text=model.name;
//}
@end
