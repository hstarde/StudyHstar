//
//  FileMan.m
//  Shuanju
//
//  Created by macbook on 2019/9/16.
//  Copyright © 2019 hstar. All rights reserved.
//

#import "FileMan.h"

@interface FileMan()


@end

@implementation FileMan

static FileMan *_sharedMan;
+ (instancetype)sharedMan {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ _sharedMan = [[self alloc] init]; });
    return _sharedMan;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        self.docPath= [paths objectAtIndex:0];
    }
    return self;
}

//在doc里面 创建key文件夹 返回路径
+(NSString*)getDataDirByKey:(NSString*)key
{
    NSString* keyPath = [[FileMan sharedMan].docPath stringByAppendingPathComponent:key];
    [FileMan createDirectory:keyPath];
    return keyPath;
}
//获取所有文件列表
+(NSArray *)getAllFileNameByKey:(NSString*)key
{
    NSString* keyPath = [[FileMan sharedMan].docPath stringByAppendingPathComponent:key];
    NSArray *tmplist = nil;
    tmplist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:keyPath error:nil];
    if(tmplist == nil)
        return nil;
    return tmplist;
}
//创建文件夹
+(void)createDirectory:(NSString*)dirPath
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:dirPath])
    {
        NSError* err = nil;
        [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&err];
    }
}
//保存图片 到KImgDoc文件夹中
+(void)SaveImage:(UIImage*)img imageName:(NSString*)imageName
{
    NSString *savePath = [[FileMan getDataDirByKey:KImgDoc] stringByAppendingPathComponent:imageName];
    NSData *imageData = nil;
    NSString *ext = [savePath pathExtension];
    if ([ext isEqualToString:@"png"]){
        imageData = UIImagePNGRepresentation(img);
    }else{
        // the rest, we write to jpeg
        // 0. best, 1. lost. about compress.
        imageData = UIImageJPEGRepresentation(img,0);
    }
    if(imageData != nil && [imageData length] > 0){
        [imageData writeToFile:savePath atomically:YES];
    }
}
//根据路径获取图片
+(UIImage*)getImage:(NSString*)path
{
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
        return [UIImage imageWithContentsOfFile:path];
    
    return nil;
}

@end
