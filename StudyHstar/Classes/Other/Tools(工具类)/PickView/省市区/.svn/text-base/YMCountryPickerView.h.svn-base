//
//  YMCountryPickerView.h
//  YMOCCodeStandard
//
//  Created by iOS on 2018/11/14.
//  Copyright © 2018 iOS. All rights reserved.
//

#import "YMBasePickerView.h"
#import "PickAreaProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YMCountryPickerView : YMBasePickerView

//按 列数  数据源  选择列e的回调
-(void)setcomponentNum:(NSInteger)componentNum arrdata:(NSMutableArray *)arrdata block:(void (^)(NSInteger component, NSInteger row))block;

//model类对象的.m文件实现-(NSString *)commonpickID;//id用于请求下一级的数据  -(NSString *)commonpickName;//显示的name   -(NSArray *)commonpickChildArr;//下一级数据
-(void)setDefaultSel:(NSInteger)component1 component2:(NSInteger)component2 component3:(NSInteger)component3;

-(void)reload;
@end

NS_ASSUME_NONNULL_END
