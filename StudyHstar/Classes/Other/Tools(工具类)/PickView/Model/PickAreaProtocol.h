//
//  PickAreaProtocol.h
//  CropsCliet
//
//  Created by macbook on 2019/3/20.
//  Copyright © 2019 hstar. All rights reserved.
//

#ifndef PickAreaProtocol_h
#define PickAreaProtocol_h

#import <Foundation/Foundation.h>


@protocol PickAreaProtocol <NSObject>

@optional
-(NSString *)commonpickID;//id用于请求下一级的数据
-(NSString *)commonpickName;//显示的name
-(NSArray *)commonpickChildArr;//下一级数据

@end

#endif /* PickAreaProtocol_h */
