//
//  AutoScrollView.h
//  BannerView
//
//  Created by likai on 14-11-28.
//  Copyright (c) 2014年 ffcs. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HLImagesScrollViewDelegate;

@interface HLImagesScrollView : UIView

@property (nonatomic, strong) UIImage *loadingPlaceholderImage;
@property (nonatomic, strong) UIImage *laodErrorPlaceholderImage;
@property (nonatomic, strong) NSMutableArray *banners;
@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, weak) id<HLImagesScrollViewDelegate> delegate;

-(void)reload;

@end

@protocol HLImagesScrollViewDelegate <NSObject>

@optional
- (void)imagesScrollView:(HLImagesScrollView *)imagesScrollView didSelectedAtIndex:(NSInteger)index;
- (void)imagesscrollViewDidSrollToLastImage:(HLImagesScrollView *)imagesScrollView;

@end