//
//  HttpMan.m
//  CropsCliet
//
//  Created by macbook on 2019/3/19.
//  Copyright © 2019 hstar. All rights reserved.
//

#import "HttpMan.h"

@implementation HttpMan
static HttpMan *_sharedMan;
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


//    dispatch_group_t group = dispatch_group_create();
//    KSVShow
//    // 请求一
//    dispatch_group_enter(group);
//    [HttpMan getGeyeList:^(NSArray *arrDevOther) {
//        dispatch_group_leave(group);
//    }];
//    // 请求二
//    dispatch_group_enter(group);
//    [HttpMan requeyGeyeList2:^(DeviceObj *devObj) {
//        dispatch_group_leave(group);
//    }];
//    // 当上述两个请求结束后，收到通知，在此做后续工作
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        KSVHide
//        DeviceObj *obj=[HttpMan sharedMan].devObj;
//        NSArray *arr=[HttpMan sharedMan].arrDevOther;
//        //数据解析
//        if (block) {
//            block([HttpMan sharedMan].devObj);
//        }
//    });

-(YMCountryPickerView *)pickerView
{
    if (_pickerView==nil) {
        _pickerView = [[YMCountryPickerView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
        _pickerView.title=@"";
        _pickerView.leftBtnTitle=@"取消";
        _pickerView.rightBtnTitle=@"确定";
        
        
    }
    return _pickerView;
}
@end
