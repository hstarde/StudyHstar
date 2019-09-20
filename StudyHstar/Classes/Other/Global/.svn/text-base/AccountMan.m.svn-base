//
//  AccountMan.m
//  HouseWifery
//
//  Created by macbook on 2018/11/15.
//  Copyright © 2018年 hstar. All rights reserved.
//

#import "AccountMan.h"
#import <SystemConfiguration/CaptiveNetwork.h>

//#import "XGPush.h"//信鸽

@implementation AccountMan
static AccountMan *_sharedMan;
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

-(void)setUser:(User *)user
{
    _user=user;
    if (_user!=nil) {//绑定
//        [[XGPushTokenManager defaultTokenManager] bindWithIdentifier:user.idCard type:XGPushTokenBindTypeAccount];
    }else{//解绑
//        [[XGPushTokenManager defaultTokenManager] unbindWithIdentifer:user.idCard type:XGPushTokenBindTypeAccount];
    }
}
//登录
+(void)login:(NSString *)account pwd:(NSString*)pwd success:(void (^)(User *user))success fail:(void (^)(NSString *msg))fail{

    BOOL isdevice = [ToolMan isDeviceJailbreak];
    if (isdevice) {
        KSVError(@"当前设备已越狱,无法登陆!");
//        return;
    }
    NSDictionary *dic=@{@"account":[ToolMan doEncrypt:account],
                        @"password":[ToolMan doEncrypt:pwd],
                        @"imsi":[AccountMan sharedMan].imei,
                        @"apiversion":@"5",
                        @"method":API_appLogin,
                        };
    [ReqMan GET:API_BASENEW_URL param:dic isLoding:YES success:^(id obj) {
        User *user=[User mj_objectWithKeyValues:obj];
         [AccountMan relateClientId:[AccountMan sharedMan].clientId];
        if (user.userName!=nil) {
             KUSER=user;
            if (success) {
                success(user);
            }
        }else{
            if (fail) {
                fail(user.msg);
            }
        }
    } failure:^(NSString *msg) {
        if (fail) {
            fail(msg);
        }
    }];
}

//更新推送id
+(void)relateClientId:(NSString *)clientId
{
    if (clientId==nil) {
        return;
    }
    NSDictionary *dic=@{@"clientId":clientId,
                        @"apiversion":@"5",
                        @"method":API_relateClientId,
                        };
    [ReqMan GET:API_BASENEW_URL param:dic isLoding:NO success:^(id obj) {
        User *tmp=[User mj_objectWithKeyValues:obj];
        if ([tmp.returnCode isEqualToString:@"-100"]) {
            KSVError(@"session超时,请重新登录");
        }
    } failure:^(NSString *msg) {
        
    }];
}
//解除关联推送id
+(void)unRelateClientId:(NSString *)clientId
{
    if (clientId==nil) {
        return;
    }
    NSDictionary *dic=@{@"clientId":clientId,
                        @"type":@"1",//0:解除全部clientid关联；1：解除当前帐号关联
                        @"apiversion":@"5",
                        @"method":API_unRelateClientId,
                        };
    [ReqMan GET:API_BASENEW_URL param:dic isLoding:NO success:^(id obj) {
        User *tmp=[User mj_objectWithKeyValues:obj];
        if ([tmp.returnCode isEqualToString:@"-100"]) {
            KSVError(@"session超时,请重新登录");
        }
    } failure:^(NSString *msg) {
        
    }];
}

-(NSString *)imei{
    if (_imei.length ==0) {
        NSString *cfuuidString = [[UIDevice currentDevice].identifierForVendor UUIDString];
        _imei=[[cfuuidString stringByReplacingOccurrencesOfString:@"-" withString:@""] substringToIndex:20];
    }
    return _imei;
}
@end
