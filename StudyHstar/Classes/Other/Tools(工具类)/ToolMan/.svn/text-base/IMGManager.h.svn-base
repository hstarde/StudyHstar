//
//  IMGManager.h
//  LuMW
//
//  Created by 何仕德 on 17/7/28.
//  Copyright © 2017年 hstar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
@class UIImage;

typedef void (^IMGManagerHandler)(UIImage *image, NSError *error);

/**
 * @brief 将图片写入相册,使用ALAssetLibrary
 *
 * @param  image    需要写入的图片
 * @param  album    相册名称，如果相册不存在，则新建相册
 * @param  completionHandler 回调
 */
extern void IMGManagerWriteToPhotosAlbum(UIImage *image, NSString *album, IMGManagerHandler completionHandler);

@interface IMGManager : NSObject

+ (instancetype)sharedManager;

/**
 * @brief 将图片写入相册,使用ALAssetLibrary
 *
 * @param  image    需要写入的图片
 * @param  album    相册名称，如果相册不存在，则新建相册
 * @param  completionHandler 回调
 */
- (void)saveImage:(UIImage *)image toAlbum:(NSString *)album completionHandler:(IMGManagerHandler)completionHandler;

@end

@interface ALAssetsLibrary (IMGManagerLibrary)

- (void)writeImage:(UIImage *)image toAlbum:(NSString *)album completionHandler:(IMGManagerHandler)completionHandler;




@end
