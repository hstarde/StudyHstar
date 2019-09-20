//
//  HttpMan.h
//  CropsCliet
//
//  Created by macbook on 2019/3/19.
//  Copyright © 2019 hstar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMCountryPickerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HttpMan : NSObject

@property (strong,nonatomic) YMCountryPickerView *pickerView;

//缓存区域列表
@property (strong,nonatomic) NSArray *arrArea;




+ (instancetype)sharedMan;


@end

NS_ASSUME_NONNULL_END
