//
//  ViewModelClass.m
//  HouseWiferyFront
//
//  Created by macbook on 2019/2/14.
//  Copyright © 2019年 hstar. All rights reserved.
//

#import "ViewModelClass.h"

@implementation ViewModelClass

// 传入交互的Block块
-(void)setBlock:(ReturnValueBlock)returnBlock failBlock: (FailValueBlock)failBlock;
{
    _returnBlock = returnBlock;
//    _errorBlock = errorBlock;
    _failBlock = failBlock;
}
@end
