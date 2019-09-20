//
//  ReqMan.m
//  HouseWifery
//
//  Created by macbook on 2018/10/26.
//  Copyright © 2018年 hstar. All rights reserved.
//

#import "ReqMan.h"
#import "HttpRequest.h"
#import "ToolMan.h"


//key
#define KFaceKey @"3cac67fa24318c8594"
#define KFaceprivateKey @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALMihcTnJDYWEQyu4tLxid7xDkPL4kNTtqBRwKYI3fLPlrlRXQVeGn6ufT1WNVismrYd6UVyq8ZQr7KQHaDi5+a2LakXMGE4RurBX2B7RKux42/4HMiaOoJlq39i4W61Oef6TeJ7OnxzJpvCqtknYv4RBgbUGRCrUA5FMJeTCoehAgMBAAECgYATtRaWZP9828ygYpUds+kBF/AD0WhhE9KhrJzPJ2aTkfb5CFR9hK7RhQzONK/Fw6d5pazGMSlotfO+Z1B7JLtyXQF9/iDQ2PSJpaJCZrUldrQuYTUU+FqVRxzdEKYN48o9E6+HdxFXMR0MFzNo1aBiRROzQCx2CNC/plsiEyWpqQJBAOsYwUEsNMiAi9+UCJB2g0ISYzWMJ1luWTo+sjPYSsAYGJXOwGKlIdQz3CsA7GZ/wRgYwuFhgAS2ZwoGVJsoMlcCQQDDD/hlOEMZBPt1XJANwm9QA/+SyuzCaUDmCnFhxRdk1ISMUCcwD1gejJb26MUFTOiOw6P2IslYLLQdvPVFTArHAkBLV7yfcVZdJ20sMtnnykNYimIHCCqYK5gm5W7g1KFoHJDMed0IABnuUsxtb7dTRgARA+Z4qnGHkRlGii7VJrWzAkEAqBTi3ZWVe8GnTIHuP20DrddEKqFhUkSP/6mP+cdzWRcnACExI2CVdf1/OFNrMh4LZrl+V2GyTaB3tAhW8NeNkQJAamXCuvqXj9tEq0uvRz6G/ZYSUlWW8r004bXBmSxluUo8tTEMyvGEvsg5IXdOy0Udz5AsTKLx6DMNIaLfOy8Klg=="


@implementation ReqMan
static ReqMan *_sharedMan;
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


+(void)showMsg:(NSString *)msg{
    [SVProgressHUD showWithStatus:msg];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

+(void)showError:(NSString *)msg{
//    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD showErrorWithStatus:msg];
    [SVProgressHUD dismissWithDelay:1.6f];
}

+(void)showSuccess:(NSString *)msg{
//    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD showSuccessWithStatus:msg];
    [SVProgressHUD dismissWithDelay:1.6f];
}
+(void)upload:(UIImage *)img success:(void (^)(id responseObject))success failure:(void (^)(NSString *msg))failure {
    NSData *imgdata=[ToolMan reSizeImageData:img maxImageSize:2000 maxSizeWithKB:2000];
    NSString *base64Data = [imgdata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];

    NSDictionary *dicss=@{@"extName": @"jpg",
                          @"base64Data":base64Data
                         };
    [ReqMan POST:API_uploadImage param:dicss isLoding:YES success:^(ComObject *obj) {
        if (success) {
            success(obj);
        }
        KLog(@"图片上传成功");
    } failure:^(NSString *msg) {
        if (failure) {
            failure(msg);
        }
        KLog(@"图片上传失败");
    }];
}
//图片上传
+(void)UploadImage:(UIImage *)img puidAndChannelno:(NSString *)puidAndChannelno{
    NSData *imgdata = [ToolMan reSizeImageData:img maxImageSize:640 maxSizeWithKB:1024];
    UploadParam *photodata=[[UploadParam alloc]init];
    photodata.data=imgdata;
    photodata.name = @"fileData";
    photodata.filename = @"file.png";
    photodata.mimeType = @"application/octet-stream";
   
    
    NSString* appKey=@"tyjx2015";
    NSString* appSecret=@"ffcstyjx";
    NSDate *date=[NSDate date];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timestamp =  [dateFormatter stringFromDate:date];
    
    //    timestamp=@"2019-07-09 12:30:13";
    //    date=[TimeMan getTimeWithStr:timestamp formatterStr:nil];
    
    NSDateFormatter* dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"SSS"];
    NSString *dateStringSSS = [dateFormatter1 stringFromDate:date];
    
    NSString *signOriginalString = [NSString stringWithFormat:@"%@%@%@%@", appSecret, timestamp, appKey, appSecret];
    NSString *signMD5 = [signOriginalString sha256Hash];
    NSString *singUppercase = [signMD5 uppercaseString];
    
    NSString * platformFlag = [NSString stringWithFormat:@"%d",KUSER.platformFlag.intValue+5];
    NSDictionary *dic=@{@"app_key":appKey,
                           @"sign_method":@"sha256",
                           @"format":@"json",
                           @"v":@"2.0",
                           @"timestamp":timestamp,
                           @"timestampId":[TimeMan getIntTimestamp:date],
                           @"vPlayer":@"2.0",
                           @"deviceType":@"2",
                           @"timestampSSS":dateStringSSS,
                           @"sign":singUppercase,
                           @"platformFlag":KIsNilP(platformFlag),
                           @"puidAndChannelno":KIsNilP(puidAndChannelno),
                           @"method":@"userGeyeAccount/uploadHangyeGeyeImg"
                           };
    NSString *url=API_BASE_URL;
//    for (int i=0; i<dic.allKeys.count; i++) {
//        NSString *key=dic.allKeys[i];
//        if (i==0) {
//            url=[url stringByAppendingFormat:@"?%@=%@",key,dic[key]];
//        }else{
//            url=[url stringByAppendingFormat:@"&%@=%@",key,dic[key]];
//        }
//    }
//    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    dic=nil;
    KLog(@"🙏url:%@",url);
    
    
    [[HttpRequest sharedInstance] uploadWithURLString:url parameters:dic uploadParam:@[photodata] success:^(id responseObject) {
        KLog(@"123%@",responseObject);
    } failure:^(NSError *error) {
        KLog(@"234");
    }];
}


+(void)POST:(NSString *)url param:(id)param isLoding:(BOOL)isLoding success:(void (^)(id obj))success failure:(void (^)(NSString *msg))failure {
    [ReqMan Request:url Type:HttpRequestTypePost param:param isLoding:isLoding success:success failure:failure];
}
+(void)GET:(NSString *)url param:(id)param isLoding:(BOOL)isLoding success:(void (^)(id obj))success failure:(void (^)(NSString *msg))failure {
    [ReqMan Request:url Type:HttpRequestTypeGet param:param isLoding:isLoding success:success failure:failure];
}


+(void)Request:(NSString *)url Type:(HttpRequestType)type param:(id)param isLoding:(BOOL)isLoding success:(void (^)(id obj))success failure:(void (^)(NSString *msg))failure {
    
    NSString *sss = [ToolMan fetchHttpProxy];
    if (sss.length>0) {
        KSVError(@"当前使用网络代理,可能会造成信息泄露等风险!");
    }
    
    NSString* appKey=@"tyjx2015";
    NSString* appSecret=@"ffcstyjx";
    NSDate *date=[NSDate date];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timestamp =  [dateFormatter stringFromDate:date];
    
    //    timestamp=@"2019-07-09 12:30:13";
    //    date=[TimeMan getTimeWithStr:timestamp formatterStr:nil];
    
    NSDateFormatter* dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"SSS"];
    NSString *dateStringSSS = [dateFormatter1 stringFromDate:date];
    
    NSString *signOriginalString = [NSString stringWithFormat:@"%@%@%@%@", appSecret, timestamp, appKey, appSecret];
    NSString *signMD5 = [signOriginalString sha256Hash];
    NSString *singUppercase = [signMD5 uppercaseString];
    
    
    NSDictionary *comdic=@{@"app_key":appKey,
                           @"sign_method":@"sha256",
                           @"format":@"json",
                           @"v":@"2.0",
                           @"timestamp":timestamp,
                           @"timestampId":[TimeMan getIntTimestamp:date],
                           @"vPlayer":@"2.0",
                           @"deviceType":@"2",
                           @"timestampSSS":dateStringSSS,
                           @"sign":singUppercase,
                           };
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithDictionary:comdic];
    if (param!=nil) {
        [dic addEntriesFromDictionary:param];
    }
    if (type==HttpRequestTypeGet) {
        NSMutableDictionary *tmpface=nil;
        for (int i=0; i<dic.allKeys.count; i++) {
            NSString *key=dic.allKeys[i];
            if([key isEqualToString:@"imgFaceBase64Obj"]){
                tmpface=[[NSMutableDictionary alloc]init];
                [tmpface setObject:dic[key] forKey:@"imgFaceBase64Obj"];
                continue;
            }
            if (i==0) {
                url=[url stringByAppendingFormat:@"?%@=%@",key,dic[key]];
            }else{
                url=[url stringByAppendingFormat:@"&%@=%@",key,dic[key]];
            }
        }
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        if (tmpface!=nil) {
            dic=tmpface;
        }else{
            dic=nil;
        }
        KLog(@"🙏url:%@",url);
    }else{
        KLog(@"🙏url:%@ param:%@",url,[ReqMan jsonStringWithObject:dic]);
    }
    
    if (isLoding) {
        KSVShow
    }
    [[HttpRequest sharedInstance] requestWithURLString:url parameters:dic type:type success:^(id responseObject) {
        if (isLoding) {
            KSVHide
        }
        if (success) {
            success(responseObject);
        }
//        NSDictionary * dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        ComObject *tmpObj=[ComObject mj_objectWithKeyValues:dic];
//        if ([tmpObj.status isEqualToString:@"900"]) {
//            if (isLoding) {
//                KSVHide
//            }
//            if (success) {
//                success(tmpObj);
//            }
//        }else{
//            KLog(@"😡code=%@😡url:%@ msg:%@",tmpObj.status,url,tmpObj.info);
//            if (isLoding) {
//                KSVHide
//            }
//            if (failure) {
//                failure(tmpObj.info);
//            }
//        }
    } failure:^(NSError *error) {
        NSString *msg=[ReqMan getErrorStr:error];
        KLog(@"❌请求超时❌url:%@ msg:%@",url,msg);
        if (isLoding) {
            KSVHide
        }
        if (failure) {
            failure(msg);
        }
    }];
}


+(NSString *)getErrorStr:(NSError *)error {
    NSString *errorMsg;
    if (error.code == -1003 || error.code == -1009 || error.code == -1005 ||
        error.code == -1001 || error.code == 502 || error.code == 503 ||
        error.code == -1004 || error.code == 3840) {
        errorMsg = @"请求超时,请重试!";
    } else if (error.code == -1011) {
        errorMsg = @"请求超时!";
    } else {
        if ([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
            errorMsg = [NSString stringWithFormat:@"%@", [error.userInfo objectForKey:@"NSLocalizedDescription"]];
        } else if (error.domain.length > 0){
            errorMsg = error.domain;
        } else {
            errorMsg = @"请求超时,请重试!";
        }
    }
    return errorMsg;
}

//对象转json
+ (NSString *)jsonStringWithObject:(id)object {
    if (object==nil) {
        return @"";
    }
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    if (!jsonData) {
        KLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
