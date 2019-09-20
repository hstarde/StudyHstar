//
//  UIBarButtonItem+XMGExtension.m
//  PaoPao
//
//  Created by 厦门微袋鼠网络科技有限公司 on 2018/3/12.
//

#import "UIBarButtonItem+XMGExtension.h"

@implementation UIBarButtonItem (XMGExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}
+ (instancetype)itemWithTitle:(NSString *)title Image:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (image!=nil) {
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (highImage!=nil) {
        [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}
@end
