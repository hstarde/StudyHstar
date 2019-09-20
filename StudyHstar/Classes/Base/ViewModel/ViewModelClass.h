//
//  ViewModelClass.h
//  HouseWiferyFront
//
//  Created by macbook on 2019/2/14.
//  Copyright © 2019年 hstar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^FailValueBlock) (id failValue);

@interface ViewModelClass : NSObject

@property (strong, nonatomic) ReturnValueBlock returnBlock;
@property (strong, nonatomic) FailValueBlock failBlock;

// 传入交互的Block块
-(void)setBlock:(ReturnValueBlock)returnBlock failBlock: (FailValueBlock)failBlock;
@end
