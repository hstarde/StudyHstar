//
//  ReqMan.h
//  HouseWifery
//
//  Created by macbook on 2018/10/26.
//  Copyright © 2018年 hstar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComObject.h"
#import "SVProgressHUD.h"
#import "MBProgressHUD+MJ.h"

#define KSVShow [ReqMan showMsg:@"加载中..."];
#define KSVShowStr(msg) [ReqMan showMsg:msg];
#define KSVHide [SVProgressHUD dismiss];
#define KSVError(msg) [ReqMan showError:msg];
#define KSVSuccess(msg) [ReqMan showSuccess:msg];


@interface ReqMan : NSObject
+ (instancetype)sharedMan;

+(void)showMsg:(NSString *)msg;
+(void)showError:(NSString *)msg;
+(void)showSuccess:(NSString *)msg;

+(void)upload:(UIImage *)img success:(void (^)(id responseObject))success failure:(void (^)(NSString *msg))failure;
//图片上传
+(void)UploadImage:(UIImage *)img puidAndChannelno:(NSString *)puidAndChannelno;
+(void)POST:(NSString *)url param:(id)param isLoding:(BOOL)isLoding success:(void (^)(id obj))success failure:(void (^)(NSString *msg))failure;
+(void)GET:(NSString *)url param:(id)param isLoding:(BOOL)isLoding success:(void (^)(id obj))success failure:(void (^)(NSString *msg))failure;
@end
