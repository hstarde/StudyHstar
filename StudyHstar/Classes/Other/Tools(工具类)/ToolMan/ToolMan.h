//
//  ToolMan.h
//  HouseWifery
//
//  Created by macbook on 2018/10/24.
//  Copyright © 2018年 hstar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseButton.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AssetsLibrary/AssetsLibrary.h>

#define KSTB(sname,vcname) [ToolMan getControllerByStoryboardName:sname identiffier:vcname]

@interface ToolMan : NSObject
+ (instancetype)sharedMan;
/**
 *  从storyboard加载控制器
 */
//拼接图片路径
+(NSString *)getIMG:(NSString *)imgName;
+ (id)getControllerByStoryboardName:(NSString *)name identiffier:(NSString *)identiffier;
//获取bundle图片资源
+(UIImage *)getbundle:(NSString *)bundle andimgName:(NSString *)imgName;
//字符串转数组 , 间隔
+(NSArray *)getArrwithStr:(NSString *)str;


+ (NSString *)getDESCWithDic:(NSDictionary *)dic;


//3des加密
+(NSString *)doEncrypt:(NSString *)plainText;
+(NSString *)doDecEncrypt:(NSString *)encryptText;

/**
 *  调整图片尺寸和大小
 *
 *  @param sourceImage  原始图片
 *  @param maxImageSize 新图片最大尺寸
 *  @param maxSize      新图片最大存储大小
 *
 *  @return 新图片imageData
 */
+ (NSData *)reSizeImageData:(UIImage *)sourceImage maxImageSize:(CGFloat)maxImageSize maxSizeWithKB:(CGFloat) maxSize;

//截图
+ (UIImage *)shotView:(UIView*)view type:(BOOL)type;

+(NSString *)appVersion;
//获取图片 大小  返回   10KB
+ (NSString *)getImgFileSize:(UIImage *)image;

//将汉字转为拼音 是否支持全拼可选
+ (NSString *)transformToPinyin:(NSString *)aString isQuanPin:(BOOL)quanPin;
/*
 *获取系统音量大小
 */
+(CGFloat)getSystemVolumValue;
/*
 *设置系统音量大小
 */
+(void)setSysVolumWith:(double)value andview:(UIView *)view;
////将视频文件拷贝到手机相册
+(void)saveVideo:(NSString *)path completionBlock:  (ALAssetsLibraryWriteVideoCompletionBlock)completionBlock;
//删除沙盒里的文件
+(BOOL)deleteFile:(NSString*)uniquePath;

/** 当前设备是否越狱 */
+ (BOOL)isDeviceJailbreak;
//当前网络是否使用代理 有值为使用代理了.
+ (id)fetchHttpProxy;

@end
