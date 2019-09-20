//
//  PhotoCell.h
//  LookingJob
//
//  Created by 何仕德 on 2017/10/25.
//  Copyright © 2017年 hstar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoModel.h"

#define KMaxPhotoNum 3

#define KPhotoCell4H ((GGBScreenW-50)/4)
#define KPhotoCell3H ((GGBScreenW-50)/3)
#define KPhotoCellH  85

@interface PhotoCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *img;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@property (nonatomic,strong) id img_icon;
@property (copy,nonatomic) void (^block_Del)(NSIndexPath *indexP);
//显示关闭按钮
@property (nonatomic,assign) BOOL isShowClose;


@end
