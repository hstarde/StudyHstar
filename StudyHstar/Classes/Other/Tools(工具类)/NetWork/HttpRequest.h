//
//  HttpRequest.h
//  PaoPao
//
//  Created by 厦门微袋鼠网络科技有限公司 on 2018/3/12.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "UploadParam.h"
/**
 *  网络请求类型
 */
typedef NS_ENUM(NSUInteger,HttpRequestType) {
    /**
     *  get请求
     */
    HttpRequestTypeGet = 0,
    /**
     *  post请求
     */
    HttpRequestTypePost
};

@interface HttpRequest : NSObject

+ (instancetype)sharedInstance;

/**
 *  发送get请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
- (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure;

/**
 *  发送post请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
- (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure;

/**
 *  发送网络请求
 *
 *  @param URLString   请求的网址字符串
 *  @param parameters  请求的参数
 *  @param type        请求的类型
 *  @param resultBlock 请求的结果
 */
- (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

/**
 *  上传图片
 *
 *  @param URLString   上传图片的网址字符串
 *  @param parameters  上传图片的参数
 *  @param uploadParam 上传图片的信息
 *  @param success     上传成功的回调
 *  @param failure     上传失败的回调
 */
- (void)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                uploadParam:(NSArray <UploadParam *> *)uploadParams
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;

/**
 *  下载数据
 */
- (void)downLoadWithURLString:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress *downloadProgress)) downloadProgressBlock
                  destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
            completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler;

@end
