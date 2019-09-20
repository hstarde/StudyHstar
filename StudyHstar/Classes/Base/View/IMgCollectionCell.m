//
//  IMgCollectionCell.m
//  CropsCliet
//
//  Created by macbook on 2019/3/11.
//  Copyright © 2019 hstar. All rights reserved.
//

#import "IMgCollectionCell.h"

@interface IMgCollectionCell()


@end

@implementation IMgCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"IMgCollectionCell";
    IMgCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"IMgCollectionCell" owner:nil options:nil] lastObject];
    }
    return cell;
}


@end
