//
//  NSTimer+NSTimer_ECOBlockSupport.m
//  HuaLian
//
//  Created by lanjing on 14/12/9.
//  Copyright (c) 2014年 lanjing. All rights reserved.
//

#import "NSTimer+EOCBlockSupport.h"

@implementation NSTimer (NSTimer_ECOBlockSupport)

+(NSTimer *)eoc_scheduledTimerWithTimeInterval:(NSTimeInterval) interval
                                         block:(void (^)())block
                                       repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(eoc_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+(void)eoc_blockInvoke:(NSTimer *)timer
{
    void (^block)() = timer.userInfo;
    if(block)
    {
        block();
    }
}
@end
