//
//  IMgCollectionCell.h
//  CropsCliet
//
//  Created by macbook on 2019/3/11.
//  Copyright © 2019 hstar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMgCollectionCell : UICollectionViewCell
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@property (weak, nonatomic) IBOutlet UIImageView *img;

@end
