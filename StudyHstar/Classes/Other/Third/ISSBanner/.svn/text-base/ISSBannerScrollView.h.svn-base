//
//  AutoScrollView.h
//  BannerView
//
//  Created by likai on 14-11-28.
//  Copyright (c) 2014年 ffcs. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ISSBannerScrollViewDelegate;

@interface ISSBannerScrollView : UIView

@property (nonatomic, strong) UIImage *loadingPlaceholderImage;  //banner请求失败，用户需要点击重新加载banner的图片
@property (nonatomic, strong) UIImage *laodErrorPlaceholderImage;  //banner请求失败的图片
@property (nonatomic, strong) NSMutableArray *banners;   //保存banner的数组，其中的banner实体类需要实现HLCommonInfoProtocol协议，并且在banner类对象的.m文件实现-(NSString *)commonInfoImageURLString（反对banner图片的URL地址）;-(NSString *)commonInfoTitle(反对banner的标题);这两个方法

@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, weak) id<ISSBannerScrollViewDelegate> delegate;

-(void)reload;//banner设置完图片需要reload，就像tableview添加数据进行reload

@end

@protocol ISSBannerScrollViewDelegate <NSObject>

@optional
- (void)bannerScrollView:(ISSBannerScrollView *)ISSBannerScrollView didSelectedAtIndex:(NSInteger)index;//点击进行连接
- (void)placeholderSelectedInBannerScrollView:(ISSBannerScrollView *)ISSBannerScrollView;//点击重新加载

@end
