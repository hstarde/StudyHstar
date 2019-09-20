//
//  DefaultMacros.h
//  BaseProject
//
//  Created by macbook on 17/2/14.
//  Copyright © 2017年 hstar. All rights reserved.
//  项目默认 值

#ifndef DefaultMacros_h
#define DefaultMacros_h


#define ConfigMobile                    @"ConfigMobile"
#define ConfigPassword                  @"ConfigPassword"
#define ConfigVedioType                  @"ConfigVedioType"
#define ConfigRecordType                  @"ConfigRecordType"
#define ConfigCloudStep                  @"ConfigCloudStep"
#define ConfigFirstJoin                  @"ConfigFirstJoin"
#define ConfigVoice                  @"ConfigVoice"
#define ConfigTuisong                 @"ConfigTuisong"

#ifdef DEBUG
//调试状态
#define KLog(fmt, ...) NSLog((@"☯️[函数名:%s]\n" fmt), __FUNCTION__, ##__VA_ARGS__);

#else
//发布状态
#define KLog(...)

#endif


/**
 *  系统版本相关
 */
#define KSYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6 6s 7 8系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6p 6sp 7p 8p系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX，Xs（iPhoneX，iPhoneXs）
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXsMax
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size)&& !isPad : NO)

//判断iPhoneX所有系列
#define IS_PhoneXAll (IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs_Max)
#define k_Height_NavContentBar 44.0f
#define k_Height_StatusBar (IS_PhoneXAll? 44.0 : 20.0)
#define k_Height_NavBar (IS_PhoneXAll ? 88.0 : 64.0)
#define k_Height_TabBar (IS_PhoneXAll ? 83.0 : 49.0)
/**
 *  判断是否为空
 */

#define KIsNil_P(_ref,place) (_ref == nil||_ref.length < 1) ? place : _ref
#define KIsNilP(_ref) (_ref == nil||_ref.length < 1) ? @"" : _ref
#define KIsNil(_ref) (_ref == nil)
#define KIsNilOrNull(_ref) (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))
#define KIsNilOrNullOrNullString(_ref) (KIsNilOrNull(_ref) || [_ref isEqualToString:@""])

/**
 *  项目颜色相关
 */
#define KColor_Bg [UIColor hex:@"0271B8"] 

#define KRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
//#define KRandomColor KRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

/**
 *  默认占位图片
 */
#define KPlaceholder [UIImage imageNamed:@"placeholder"]
#define KPlaceholder_head [UIImage imageNamed:@"placeholder_head"]
#define KPlaceholder_video [UIImage imageNamed:@"placeholder_video"]
#define KPlaceholder_btn [UIImage imageNamed:@"placeholder_btn"]
#define KPlaceholder_icon [UIImage imageNamed:@"placeholder_icon"]


#define WEAKSELF __typeof__(self) __weak weakSelf = self;
#define STRONGSELF __strong __typeof(weakSelf)strongSelf = weakSelf;

#define KAppWindow [UIApplication sharedApplication].keyWindow


/**
 *  项目字体
 */
#define KFont_WithPX(x) [UIFont systemFontOfSize:x/2]


#define KtableViewCellNoSelect self.selectionStyle=UITableViewCellSelectionStyleNone;


//cell没有下划线
#define KtableViewCellNoUnLine(tableviewName) tableviewName.separatorStyle=UITableViewCellSeparatorStyleNone

//加载xib中的 tableviewCell
#define KcellWithTableViewH  +(instancetype)cellWithTableView:(UITableView *)tableView;

#define KcellWithTableViewM(cellID)\
+ (instancetype)cellWithTableView:(UITableView *)tableView {\
static NSString *ID = cellID;\
id cell = [tableView dequeueReusableCellWithIdentifier:ID];\
if (cell == nil) {\
cell = [[[NSBundle mainBundle] loadNibNamed:ID owner:nil options:nil] lastObject];\
}\
return cell;\
}\


#endif /* DefaultMacros_h */
