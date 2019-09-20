//
//  AccountMan.h
//  HouseWifery
//
//  Created by macbook on 2018/11/15.
//  Copyright © 2018年 hstar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

#define KUSER [AccountMan sharedMan].user
#define KToken [AccountMan sharedMan].token

@interface AccountMan : NSObject
@property (nonatomic,strong) NSString *token;//登录后保存的唯一标识
@property (strong,nonatomic) User *user;

@property (nonatomic,copy) NSString *clientId;

@property (nonatomic,copy) NSString *imei;

+ (instancetype)sharedMan;


//登录
+(void)login:(NSString *)account pwd:(NSString*)pwd success:(void (^)(User *user))success fail:(void (^)(NSString *msg))fail;


@end
