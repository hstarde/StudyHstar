//
//  ComObject.h
//  HouseWifery
//
//  Created by macbook on 2018/10/26.
//  Copyright © 2018年 hstar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageObj : NSObject

@property (assign,nonatomic) NSInteger queryPage;// = 1;
@property (assign,nonatomic) NSInteger querySize;// = 20;
@property (strong,nonatomic) NSString *queryType;// = "QUERY_RESET";
@property (strong,nonatomic) id records;
//@property (assign,nonatomic) NSInteger totalPage;

@end

@interface ComObject : NSObject


@property (strong,nonatomic) NSString *status;// "900",
@property (strong,nonatomic) NSString *info;// "成功",
@property (strong,nonatomic) id data;// {
//    "rspcod": "000025",
//    "rspmsg": "请检查关键参数",
//    "token": "1e86bb8a98a109bb53b54bde0b5a5c45"
//}


@end


