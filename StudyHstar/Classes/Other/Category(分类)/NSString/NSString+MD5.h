//
//  NSString+MD5.h
//  PKWSevers
//
//  Created by peikua on 16/4/27.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)
- (NSString *) md5WithString;//MD5加密

//SHA256加密
- (NSString*)sha256Hash;
@end
