//
//  ToolMan.m
//  HouseWifery
//
//  Created by macbook on 2018/10/24.
//  Copyright © 2018年 hstar. All rights reserved.
//

#import "ToolMan.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"
#import <AVFoundation/AVFoundation.h>

#define gkey            @"tyjxffcs123@ffcstyjx@#$%"
#define gIv             @"10976785"

@implementation ToolMan
static ToolMan *_sharedMan;
+ (instancetype)sharedMan {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ _sharedMan = [[self alloc] init]; });
    return _sharedMan;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}
//获取图片
+(NSString *)getIMG:(NSString *)imgName{
    if ([imgName containsString:@"http"]) {
        return imgName;
    }else{
        return [NSString stringWithFormat:@"%@%@",API_IMGBASE_URL,imgName];
    }
}
+ (id)getControllerByStoryboardName:(NSString *)name identiffier:(NSString *)identiffier {
    UIStoryboard *board = [UIStoryboard storyboardWithName:name bundle:nil];
    return [board instantiateViewControllerWithIdentifier:identiffier];
}
//获取bundle图片资源
+(UIImage *)getbundle:(NSString *)bundle andimgName:(NSString *)imgName
{
    UIImage *img=[UIImage imageNamed:[NSString stringWithFormat:@"%@.bundle/%@",bundle,imgName]];
    return img;
}
//字符串转数组 , 间隔
+(NSArray *)getArrwithStr:(NSString *)str
{
    if (str.length>0) {
        NSArray *arr= [str componentsSeparatedByString:@","];
        return arr;
    }else{
        return nil;
    }
}





+ (NSString *)getDESCWithDic:(NSDictionary *)dic
{
    // NOTE: 增加不变部分数据
    NSMutableDictionary *tmpDict = [[NSMutableDictionary alloc]initWithDictionary:dic];
    // NOTE: 排序，得出最终请求字串
    NSArray* sortedKeyArray = [[tmpDict allKeys] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSMutableArray *tmpArray = [NSMutableArray new];
    for (NSString* key in sortedKeyArray) {
        NSString* orderItem = [ToolMan itemWithKey:key andValue:[tmpDict objectForKey:key]];
        if (orderItem.length > 0) {
            //           NSString * contentencoded= (__bridge_transfer  NSString*) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)orderItem, NULL, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 );
            [tmpArray addObject:orderItem];
        }
    }
    return [tmpArray componentsJoinedByString:@"&"];
}
+ (NSString*)itemWithKey:(NSString*)key andValue:(NSString*)value
{
    if (key.length > 0 && value.length > 0) {
        return [NSString stringWithFormat:@"%@=%@", key, value];
    }
    return nil;
}
//3des加密
+(NSString *)doEncrypt:(NSString *)plainText{
    NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    size_t plainTextBufferSize = [data length];
    const void *vplainText = (const void *)[data bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = ((plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1));
    bufferPtr = (uint8_t *)malloc( bufferPtrSize * sizeof(uint8_t));//new uint8_t( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [gkey UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    ccStatus = CCCrypt(kCCEncrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSData *myData = [NSData dataWithBytes:(const char *)bufferPtr length:(NSUInteger)movedBytes];
    delete bufferPtr;
    //NSString *result = [GTMBase64 stringByEncodingData:myData];
    NSString *result = [GTMBase64 stringByWebSafeEncodingData:myData padded:YES];
    
    return result;
}

+(NSString*)doDecEncrypt:(NSString *)encryptText{
    
    NSData *encryptData = [GTMBase64 decodeData:[encryptText dataUsingEncoding:NSUTF8StringEncoding]];
    KLog(@"encryptData=%@",[encryptData description]);
    size_t plainTextBufferSize = [encryptData length];
    const void *vplainText = [encryptData bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = new uint8_t( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [gkey UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    ccStatus = CCCrypt(kCCDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSString *result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding];
    
    //KLog(@"ddd...deresult=%@",result);
    return result;
}


/**
 *  调整图片尺寸和大小
 *
 *  @param sourceImage  原始图片
 *  @param maxImageSize 新图片最大尺寸
 *  @param maxSize      新图片最大存储大小
 *
 *  @return 新图片imageData
 */
+ (NSData *)reSizeImageData:(UIImage *)sourceImage maxImageSize:(CGFloat)maxImageSize maxSizeWithKB:(CGFloat) maxSize
{
    
    if (maxSize <= 0.0) maxSize = 1024.0;
    if (maxImageSize <= 0.0) maxImageSize = 1024.0;
    
    //先调整分辨率
    CGSize newSize = CGSizeMake(sourceImage.size.width, sourceImage.size.height);
    
    CGFloat tempHeight = newSize.height / maxImageSize;
    CGFloat tempWidth = newSize.width / maxImageSize;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempWidth, sourceImage.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth < tempHeight){
        newSize = CGSizeMake(sourceImage.size.width / tempHeight, sourceImage.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [sourceImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //调整大小
    NSData *imageData = UIImageJPEGRepresentation(newImage,1.0);
    CGFloat sizeOriginKB = imageData.length / 1024.0;
    
    CGFloat resizeRate = 0.9;
    while (sizeOriginKB > maxSize && resizeRate > 0.1) {
        imageData = UIImageJPEGRepresentation(newImage,resizeRate);
        sizeOriginKB = imageData.length / 1024.0;
        resizeRate -= 0.1;
    }
    
    return imageData;
}
//截图
+ (UIImage *)shotView:(UIView*)view type:(BOOL)type
{
    if(type){//针对有用过OpenGL渲染过的视图截图
        CGSize size = view.bounds.size;
        UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
        CGRect rect = view.frame;
        [view drawViewHierarchyInRect:rect afterScreenUpdates:YES];
        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return snapshotImage;
    }else{//普通的截图 该API仅可以在未使用layer和OpenGL渲染的视图上使用
        UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [UIScreen mainScreen].scale);
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return snapshotImage;
    }
}
+(NSString *)appVersion{
return [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"];
    //app名称 [infoDictionary objectForKey:@"CFBundleDisplayName"];
// app build版本    [infoDictionary objectForKey:@"CFBundleVersion"];
}
//获取图片 大小  返回   10KB
+ (NSString *)getImgFileSize:(UIImage *)image {
    NSData *data = UIImagePNGRepresentation(image);
    if (!data) {
        data = UIImageJPEGRepresentation(image, 0.5);//需要改成0.5才接近原图片大小，原因请看下文
    }
    double dataLength = [data length] * 1.0;
    NSArray *typeArray = @[@"bytes",@"KB",@"MB",@"GB",@"TB",@"PB", @"EB",@"ZB",@"YB"];
    NSInteger index = 0;
    while (dataLength > 1024) {
        dataLength /= 1024.0;
        index ++;
    }
    return [NSString stringWithFormat:@"%f %@",dataLength,typeArray[index]];
}
//将汉字转为拼音 是否支持全拼可选
+ (NSString *)transformToPinyin:(NSString *)aString isQuanPin:(BOOL)quanPin
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin,NO);
    
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics,NO);
    NSArray *pinyinArray = [str componentsSeparatedByString:@" "];
    NSMutableString *allString = [NSMutableString new];
    
    if (quanPin)
    {
        int count = 0;
        for (int  i = 0; i < pinyinArray.count; i++)
        {
            for(int i = 0; i < pinyinArray.count;i++)
            {
                if (i == count) {
                    [allString appendString:@"#"];
                    //区分第几个字母
                }
                [allString appendFormat:@"%@",pinyinArray[i]];
            }
            [allString appendString:@","];
            count ++;
        }
    }
    
    NSMutableString *initialStr = [NSMutableString new];
    //拼音首字母
    for (NSString *s in pinyinArray)
    {
        if (s.length > 0)
        {
            [initialStr appendString:[s substringToIndex:1]];
        }
    }
    [allString appendFormat:@"%@",initialStr];
    [allString appendFormat:@",#%@",aString];
    return allString;
}
/*
 *获取系统音量大小
 */
+(CGFloat)getSystemVolumValue{
//    return [[ToolMan getSystemVolumSlider:view] value];
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    CGFloat currentVol = audioSession.outputVolume;
    return currentVol;
}
/*
 *设置系统音量大小
 */
+(void)setSysVolumWith:(double)value andview:(UIView *)view{
    [ToolMan getSystemVolumSlider:view].value = value;
}
/*
 *获取系统音量滑块
 */
+(UISlider*)getSystemVolumSlider:(UIView*)view{
    static UISlider * volumeViewSlider = nil;
    if (volumeViewSlider == nil) {
        //        MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(10, 50, 200, 4)];
        MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(80, 300, 100, 100)];
        volumeView.showsVolumeSlider=YES;
        if (view!=nil) {
            [view addSubview:volumeView];
        }
        
        for (UIView* newView in volumeView.subviews) {
            if ([newView.class.description isEqualToString:@"MPVolumeSlider"]){
                volumeViewSlider = (UISlider*)newView;
                break;
            }
        }
    }
    return volumeViewSlider;
}
////将视频文件拷贝到手机相册
+(void)saveVideo:(NSString *)path completionBlock:  (ALAssetsLibraryWriteVideoCompletionBlock)completionBlock{
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library writeVideoAtPathToSavedPhotosAlbum:[NSURL fileURLWithPath:path]
                                completionBlock:completionBlock
    ];
}
//删除沙盒里的文件
+(BOOL)deleteFile:(NSString*)uniquePath
{
    NSFileManager* fileManager=[NSFileManager defaultManager];
    //    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    //
    //    //文件名
    //    NSString *uniquePath=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"pin.png"];
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:uniquePath];
    if (!blHave) {
        KLog(@"no  have");
        return YES;
    }else {
        KLog(@" have");
        BOOL blDele= [fileManager removeItemAtPath:uniquePath error:nil];
        if (blDele) {
            KLog(@"dele success");
            return YES;
        }else {
            KLog(@"dele fail");
            return YES;
        }
    }
}



// 常见越狱文件
const char *Jailbreak_Tool_pathes[] = {
    "/Applications/Cydia.app",
    "/Library/MobileSubstrate/MobileSubstrate.dylib",
    "/bin/bash",
    "/usr/sbin/sshd",
    "/etc/apt"
};

char *printEnv(void){
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    return env;
}

/** 当前设备是否越狱 */
+ (BOOL)isDeviceJailbreak
{
    // 判断是否存在越狱文件
    for (int i = 0; i < 5; i++) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:Jailbreak_Tool_pathes[i]]]) {
            KLog(@"此设备越狱!");
            return YES;
        }
    }
    // 判断是否存在cydia应用
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]){
        KLog(@"此设备越狱!");
        return YES;
    }
    
    // 读取系统所有的应用名称
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/User/Applications/"]){
        KLog(@"此设备越狱!");
        return YES;
    }
    
    // 读取环境变量
    if(printEnv()){
        KLog(@"此设备越狱!");
        return YES;
    }
    
    KLog(@"此设备没有越狱");
    return NO;
}
//当前网络是否使用代理 有值为使用代理了.
+ (id)fetchHttpProxy {
    CFDictionaryRef dicRef = CFNetworkCopySystemProxySettings();
    const CFStringRef proxyCFstr = (const CFStringRef)CFDictionaryGetValue(dicRef,
                                                                           (const void*)kCFNetworkProxiesHTTPProxy);
    NSString* proxy = (__bridge NSString *)proxyCFstr;
    return  proxy;
}



@end
