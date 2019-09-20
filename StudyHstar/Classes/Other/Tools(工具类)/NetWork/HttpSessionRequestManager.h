//
//  HttpSessionRequestManager.h
//  MerchantPass
//
//  Created by JaDee on 2016/12/2.
//  Copyright © 2016年 Copyright © 1998 - 2015 273.cn. All rights reserved.
//

#import "AFHTTPSessionManager.h"

typedef void(^SuccessBlock) (id response);

typedef void(^FailureBlock) (NSError *error);

typedef void(^ProgreessBlock) (int64_t bytesRead,int64_t totalBytesRead);

@interface HttpSessionRequestManager : AFHTTPSessionManager

+ (instancetype)sharedManager;



- (NSURLSessionDataTask *)postWithUrl:(NSString *)URLString
                           parameters:(id)parDict
                              success:(SuccessBlock)success
                              failure:(FailureBlock)failure;

- (NSURLSessionDataTask *)postWithUrl:(NSString *)URLString
                           parameters:(id)parDict
                            needBlock:(BOOL)needBlock
                              success:(SuccessBlock)success
                              failure:(FailureBlock)failure;

- (NSURLSessionDataTask *)postWithUrl:(NSString *)URLString
                           parameters:(id)parDict
                            needBlock:(BOOL)needBlock
                        progressBlock:(ProgreessBlock)progress
                              success:(SuccessBlock)success
                              failure:(FailureBlock)failure;


- (NSURLSessionDataTask *)getWithUrl:(NSString *)URLString
                          parameters:(id)parDict
                       progressBlock:(ProgreessBlock)progress
                             success:(SuccessBlock)success
                             failure:(FailureBlock)failure;



//设置请求头
- (NSURLSessionDataTask *)postWithUrl:(NSString *)URLString
                          headerfield:(NSString *)headerfield
                           parameters:(id)parDict
                              success:(SuccessBlock)success
                              failure:(FailureBlock)failure;
@end
