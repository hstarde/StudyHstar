//
//  FileMan.h
//  Shuanju
//
//  Created by macbook on 2019/9/16.
//  Copyright © 2019 hstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define KImgDoc @"KImgDoc"
#define KVedioDoc @"KVedioDoc"


@interface FileMan : NSObject

@property (strong,nonatomic) NSString* docPath;

+ (instancetype)sharedMan;

//在doc里面 创建key文件夹 返回路径
+(NSString*)getDataDirByKey:(NSString*)key;

//获取key文件夹所有文件
+(NSArray *)getAllFileNameByKey:(NSString*)key;

//保存图片 到KImgDoc文件夹中
+(void)SaveImage:(UIImage*)img imageName:(NSString*)imageName;
//根据路径获取图片
+(UIImage*)getImage:(NSString*)path;
@end

NS_ASSUME_NONNULL_END
