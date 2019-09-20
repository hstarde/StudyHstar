//
//  BaseObject.m
//  HouseWifery
//
//  Created by macbook on 2018/11/20.
//  Copyright © 2018年 hstar. All rights reserved.
//

#import "BaseObject.h"

@implementation BaseObject


/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id",@"Description":@"description"};
}

/**
 *  数组中需要转换的模型类
 *
 *  @return 字典中的key是数组属性名，value是数组中存放模型的Class（Class类型或者NSString类型）
 */
//+ (NSDictionary *)mj_objectClassInArray
//{
//      
//}

/**
 *  当字典转模型完毕时调用
 */
//- (void)mj_keyValuesDidFinishConvertingToObject
//{
//
//}

/**
 *  当模型转字典完毕时调用
 */
//- (void)mj_objectDidFinishConvertingToKeyValues
//{
//
//}

@end
