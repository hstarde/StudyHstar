//
//  VerificationManager.h
//  OrderMeal
//
//  Copyright © 2015年 Copyright © 1998 - 2015 autoapp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VerificationManager : NSObject

/**
 *  字符串为空和只为空格
 */
+ (BOOL)validateBlankString:(NSString *)string;

/**
 *  字符串是否为纯数字
 */
+ (BOOL)validateNumber:(NSString *)number;

/**
 *  字符串是否为数字与字母组合
 */
+ (BOOL)validateNumberAndCharacters:(NSString *)string;

/**
 *  字符串是否为纯数字和小数
 */
+ (BOOL)validateNumber:(NSString *)number decimal:(NSInteger)decimal;

/**
 *  QQ号码
 */
+ (BOOL)validateQQ:(NSString *)qq;

/**
 *  邮箱
 */
+ (BOOL)validateEmail:(NSString *)email;

/**
 *  手机号码验证
 */
+ (BOOL)validateMobile:(NSString *)mobile;

/**
 *  车牌号验证
 */
+ (BOOL)validateCarNo:(NSString *)carNo;

/**
 *  车型
 */
+ (BOOL)validateCarType:(NSString *)CarType;

/**
 *  用户名
 */
+ (BOOL)validateUserName:(NSString *)name;

/**
 *  密码
 */
+ (BOOL)validatePassword:(NSString *)passWord;

/**
 *  昵称
 */
+ (BOOL)validateNickname:(NSString *)nickname;

/**
 *  身份证号
 */
+ (BOOL)validateIdentityCard: (NSString *)identityCard;

/**
 *  是否中文
 */

+ (BOOL)isChinese:(NSString *)str;

@end
