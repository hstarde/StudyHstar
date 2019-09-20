//
//  VerificationManager.m
//  OrderMeal
//
//  Copyright © 2015年 Copyright © 1998 - 2015 autoapp. All rights reserved.
//

#import "VerificationManager.h"

@implementation VerificationManager

/**
 *  字符串为空和只为空格
 */
+ (BOOL)validateBlankString:(NSString *)string {
    if (string == nil) {
        return NO;
    }
    if (string == NULL) {
        return NO;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return NO;
    }
    return YES;
}

/**
 *  QQ号码
 */
+ (BOOL)validateQQ:(NSString *)qq {
    NSString *qqRegex = @"[1-9][0-9]{4,}";
    NSPredicate *qqTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", qqRegex];
    return [qqTest evaluateWithObject:qq];
}

/**
 *  字符串是否为纯数字
 */
+ (BOOL)validateNumber:(NSString *)number {
    NSString *numberRegex = @"^[0-9]*$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:number];
}

/**
 *  字符串是否为数字与字母组合
 */
+ (BOOL)validateNumberAndCharacters:(NSString *)string
{
    if (string==nil ||string.length<8 || string.length>20) {
        return NO;
    }
    BOOL isnum=[VerificationManager validateNumber:string];
    
    BOOL ischara=[VerificationManager isPureCharacters:string];
    if (ischara==YES) {
        if (isnum==YES) {
            return NO;
        }else{
            return NO;
        }
    }else{
        if (isnum==YES) {
            return NO;
        }else{
            return YES;
        }
    }
}

/**
 *  字符串是否为纯数字和小数
 */
+ (BOOL)validateNumber:(NSString *)number decimal:(NSInteger)decimal {
    NSString *numberRegex = [NSString stringWithFormat:@"^[0-9]+(.[0-9]{%ld})?$", decimal];
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:number];
}

/**
 *  邮箱
 */
+ (BOOL)validateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/**
 *  手机号码验证
 */
+ (BOOL)validateMobile:(NSString *)mobile {
    //手机号以13， 15，18开头，八个 \d 数字字符
//    if (mobile.length == 11) {
//        return YES;
//    }
//    
//    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    return [phoneTest evaluateWithObject:mobile];
    
    NSString *mobileWithoutSpace = [mobile stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //以1开头，而且11位号码长度，返回YES
    if([mobileWithoutSpace hasPrefix:@"1"] && [mobileWithoutSpace length] == 11)
    {
        return YES;
    }
    return NO;
}

/**
 *  车牌号验证
 */
+ (BOOL)validateCarNo:(NSString *)carNo {
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    KLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}

/**
 *  车型
 */
+ (BOOL)validateCarType:(NSString *)CarType {
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}

/**
 *  用户名
 */
+ (BOOL)validateUserName:(NSString *)name {
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}

/**
 *  密码
 */
+ (BOOL)validatePassword:(NSString *)passWord {
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

/**
 *  昵称
 */
+ (BOOL)validateNickname:(NSString *)nickname {
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}

/**
 *  身份证号
 */
+ (BOOL)validateIdentityCard: (NSString *)identityCard {
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

/**
 *  判断是否有中文
 */
+ (BOOL)isChinese:(NSString *)str {
    for (NSInteger i = 0; i < str.length; i++) {
        int a = [str characterAtIndex:i];
        if(a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}
//判断是否是纯字母
+ (BOOL)isPureCharacters:(NSString *)string{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet letterCharacterSet]];
    if(string.length > 0) {
        return NO;
    }
    return YES;
}



@end
