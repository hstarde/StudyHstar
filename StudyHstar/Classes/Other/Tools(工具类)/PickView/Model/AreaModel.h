//
//  AreaModel.h
//  CropsCliet
//
//  Created by macbook on 2019/3/20.
//  Copyright © 2019 hstar. All rights reserved.
//

#import "BaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface AreaModel : BaseObject

@property (strong,nonatomic) NSString *ID;// 1250,
@property (strong,nonatomic) NSString *name;// "福州市",

@property (strong,nonatomic) NSArray *arrchildArea;

@end

NS_ASSUME_NONNULL_END
