//
//  HeadCell.h
//  CropsCliet
//
//  Created by macbook on 2019/3/8.
//  Copyright © 2019 hstar. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HeadCell_H 54

@interface HeadCell : UITableViewCell
KcellWithTableViewH

-(void)settitle:(NSString *)title isbtnhide:(BOOL)isbtnhide;
@property (copy,nonatomic) void (^Block)(void);
@end
