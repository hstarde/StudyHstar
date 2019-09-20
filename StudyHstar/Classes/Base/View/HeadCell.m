//
//  HeadCell.m
//  CropsCliet
//
//  Created by macbook on 2019/3/8.
//  Copyright © 2019 hstar. All rights reserved.
//

#import "HeadCell.h"
@interface HeadCell()

@property (weak, nonatomic) IBOutlet UILabel *lbtitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgleft;

@property (weak, nonatomic) IBOutlet UIButton *btnright;
@end
@implementation HeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.imgleft setCorner:4];
    KtableViewCellNoSelect
}
KcellWithTableViewM(@"HeadCell");
-(void)settitle:(NSString *)title isbtnhide:(BOOL)isbtnhide{
    self.lbtitle.text=title;
    self.btnright.hidden=isbtnhide;
}
- (IBAction)btnrightClick:(id)sender {
    if (self.Block) {
        self.Block();
    }
}

@end
