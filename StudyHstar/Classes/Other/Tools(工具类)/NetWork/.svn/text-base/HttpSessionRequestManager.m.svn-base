//
//  HttpSessionRequestManager.m
//  MerchantPass
//
//  Created by JaDee on 2016/12/2.
//  Copyright © 2016年 Copyright © 1998 - 2015 273.cn. All rights reserved.
//

#import "HttpSessionRequestManager.h"


#define kHttpRequestTimeOutInterval 20

@implementation HttpSessionRequestManager

static HttpSessionRequestManager *_sharedManager;
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ _sharedManager = [[self alloc] init]; });
    return _sharedManager;
}


- (instancetype)init{
    if (self = [super init]) {
         //初始化默认配置 需要根据实际情况设置
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        //@"application/json", @"text/json", @"text/plain", @"text/html", @"text/javascript"
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/plain", @"text/html", @"text/javascript", nil];
        [[self requestSerializer] setTimeoutInterval:kHttpRequestTimeOutInterval];
    }
    return self;
}


- (NSURLSessionDataTask *)postWithUrl:(NSString *)URLString
                           parameters:(id)parDict
                              success:(SuccessBlock)success
                              failure:(FailureBlock)failure{
    
    return [self postWithUrl:URLString
                  parameters:parDict
                   needBlock:NO
                     success:success
                     failure:failure];
}


- (NSURLSessionDataTask *)postWithUrl:(NSString *)URLString
                           parameters:(id)parDict
                            needBlock:(BOOL)needBlock
                              success:(SuccessBlock)success
                              failure:(FailureBlock)failure{
    
    return [self postWithUrl:URLString
                  parameters:parDict
                   needBlock:needBlock
               progressBlock:nil
                     success:success
                     failure:failure];
}


- (NSURLSessionDataTask *)postWithUrl:(NSString *)URLString
                           parameters:(id)parDict
                            needBlock:(BOOL)needBlock
                        progressBlock:(ProgreessBlock)progress
                              success:(SuccessBlock)success
                              failure:(FailureBlock)failure{
    
    NSURLSessionDataTask *task = [self POST:URLString
                                 parameters:parDict
                                   progress:^(NSProgress * _Nonnull uploadProgress) {
                                     if (progress) {
                                         progress(uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
                                     }
                                 } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                     if (success) {
                                         success(responseObject);
                                     }
                                 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                     if (failure) {
                                         failure(error);
                                     }
                                 }];
    return task;
}


- (NSURLSessionDataTask *)postWithUrl:(NSString *)URLString
                          headerfield:(NSString *)headerfield
                           parameters:(id)parDict
                              success:(SuccessBlock)success
                              failure:(FailureBlock)failure{
    
    AFHTTPRequestSerializer *req = [AFJSONRequestSerializer serializer];
    

    [req setValue:headerfield forHTTPHeaderField:@"Authorization"];
    self.requestSerializer = req;

    NSURLSessionDataTask *task = [self POST:URLString
                                 parameters:parDict
                                   progress:nil
                                    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                       if (success) {
                                           success(responseObject);
                                       }
                                   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                       if (failure) {
                                           failure(error);
                                       }
                                   }];
    
    return task;
    
}

- (NSURLSessionDataTask *)getWithUrl:(NSString *)URLString
                          parameters:(id)parDict
                       progressBlock:(ProgreessBlock)progress
                             success:(SuccessBlock)success
                             failure:(FailureBlock)failure{
    
   NSURLSessionDataTask *task = [self GET:URLString
   parameters:parDict
     progress:^(NSProgress * _Nonnull downloadProgress) {
         if (progress) {
             progress(downloadProgress.completedUnitCount,downloadProgress.totalUnitCount);
         }
     }
      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          if (success) {
              success(responseObject);
          }
      }
      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          if (failure) {
              failure(error);
          }
      }];
    
    return task;
}
@end
