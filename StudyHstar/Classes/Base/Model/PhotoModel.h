//
//  PhotoModel.h
//  FireControl
//
//  Created by macbook on 2017/12/15.
//  Copyright © 2017年 hstar. All rights reserved.
//

#import "BaseObject.h"

@interface PhotoModel : BaseObject

@property (nonatomic,strong)  UIImage *localImg;// 0;
@property (nonatomic,strong)  NSString *url;// 1;
@property (nonatomic,assign)  CGFloat imgW;
@property (nonatomic,assign)  CGFloat imgH;
@end
