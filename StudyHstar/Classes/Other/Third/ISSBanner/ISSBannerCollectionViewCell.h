//
//  ISSBannerCollectionViewCell.h
//  HuaLian
//
//  Created by likai on 14-12-15.
//  Copyright (c) 2014年 lanjing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSBanner.h"

@interface ISSBannerCollectionViewCell : UICollectionViewCell

-(void)bindData:(id<HLCommonInfoProtocol>)data;
@end
