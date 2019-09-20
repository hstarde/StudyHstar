//
//  User.h
//  StudyHstar
//
//  Created by macbook on 2019/9/20.
//  Copyright © 2019 hstar. All rights reserved.
//

#import "BaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : BaseObject

@property (strong,nonatomic) NSString *ID;
@property (strong,nonatomic) NSString *platformFlag;
@property (strong,nonatomic) NSString *userName;
@property (strong,nonatomic) NSString *returnCode;
@property (strong,nonatomic) NSString *msg;

@end

NS_ASSUME_NONNULL_END
