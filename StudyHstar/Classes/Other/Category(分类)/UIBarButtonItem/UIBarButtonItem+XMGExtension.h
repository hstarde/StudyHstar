//
//  UIBarButtonItem+XMGExtension.h
//  PaoPao
//
//  Created by 厦门微袋鼠网络科技有限公司 on 2018/3/12.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XMGExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
+ (instancetype)itemWithTitle:(NSString *)title Image:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
