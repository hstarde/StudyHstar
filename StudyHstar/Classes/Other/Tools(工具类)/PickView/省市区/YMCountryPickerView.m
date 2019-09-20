//
//  YMCountryPickerView.m
//  YMOCCodeStandard
//
//  Created by iOS on 2018/11/14.
//  Copyright © 2018 iOS. All rights reserved.
//

#import "YMCountryPickerView.h"


static CGFloat kRowHeight = 48.0f;

@interface YMCountryPickerView ()
<UIPickerViewDelegate, UIPickerViewDataSource>

/** pickerView */
@property (nonatomic, strong) UIPickerView *pickerView;



@property (assign,nonatomic) NSInteger componentNum;
@property (strong,nonatomic) NSMutableArray *arrdata;

@property (copy,nonatomic) void (^Block)(NSInteger component, NSInteger row);

@end

@implementation YMCountryPickerView


//按 列数  数据源  选择列e的回调
-(void)setcomponentNum:(NSInteger)componentNum arrdata:(NSMutableArray *)arrdata block:(void (^)(NSInteger component, NSInteger row))block
{
    self.firstComponentCurrentRow=0;
    self.secondComponentCurrentRow=0;
    self.thirdComponentCurrentRow=0;
    self.componentNum=componentNum;
    if (self.componentNum>=3) {
        self.componentNum=3;
    }
    if (self.componentNum<1) {
        self.componentNum=1;
    }
    self.Block = block;//先于data赋值
    self.arrdata=arrdata;
    if (self.arrdata!=nil&&self.arrdata.count>0) {
        [self.pickerView reloadAllComponents];
        NSInteger index =  [self.pickerView selectedRowInComponent:0];
        [self pickerView:self.pickerView didSelectRow:index inComponent:0];
    }
}

#pragma mark - - 加载视图
- (void)loadSubviews {
    [super loadSubviews];
    [self.contentView addSubview:self.pickerView];
}

#pragma mark - - 配置视图
- (void)configProprty {
    [super configProprty];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
}

#pragma mark - - 布局视图
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.pickerView.frame = CGRectMake(0, kToolBarViewHeight, self.width, kContentViewHeight - kToolBarViewHeight);
}
-(void)setDefaultSel:(NSInteger)component1 component2:(NSInteger)component2 component3:(NSInteger)component3{
    if (component1>0) {
         [self.pickerView selectRow:component1 inComponent:0 animated:YES];
        self.firstComponentCurrentRow=component1;
    }else{
        self.firstComponentCurrentRow=0;
    }
    if (component2>0) {
        [self.pickerView selectRow:component2 inComponent:1 animated:YES];
        self.secondComponentCurrentRow=component2;
    }else{
        self.secondComponentCurrentRow=0;
    }
    if (component3>0) {
        [self.pickerView selectRow:component3 inComponent:2 animated:YES];
        self.thirdComponentCurrentRow=component3;
    }else{
        self.thirdComponentCurrentRow=0;
    }
    [self.pickerView reloadAllComponents];
}

#pragma mark - - delegate && dataSource
//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.componentNum;
}
//每列多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component==0) {
        return self.arrdata.count;
    }else if(component==1){
        NSArray *arrchild=[((id<PickAreaProtocol>)self.arrdata[self.firstComponentCurrentRow]) commonpickChildArr];
        return arrchild.count;
    }else{
         NSArray *arrchild=[((id<PickAreaProtocol>)self.arrdata[self.firstComponentCurrentRow]) commonpickChildArr];
         NSArray *arrchild_child=[((id<PickAreaProtocol>)arrchild[self.secondComponentCurrentRow]) commonpickChildArr];
        return arrchild_child.count;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.width / self.componentNum;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return kRowHeight;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    for (UIView *lineView in pickerView.subviews) {
        if (lineView.height < 1) {
            lineView.backgroundColor = [UIColor hex:@"999999"];
        }
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.width / self.componentNum - 20, kRowHeight)];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    
    if (component == 0) {
        label.text =[(id<PickAreaProtocol>)self.arrdata[row] commonpickName];
        if (row == self.firstComponentCurrentRow) {
            label.font = [UIFont systemFontOfSize:17];
            label.textColor = [UIColor blackColor];
        } else {
            label.font = [UIFont systemFontOfSize:15];
            label.textColor = [UIColor hex:@"666666"];
        }
    } else if (component == 1) {
        NSArray *arrchild=[((id<PickAreaProtocol>)self.arrdata[self.firstComponentCurrentRow]) commonpickChildArr];
        label.text =[((id<PickAreaProtocol>)arrchild[row]) commonpickName];
        if (row == self.secondComponentCurrentRow) {
            label.font = [UIFont systemFontOfSize:17];
            label.textColor = [UIColor blackColor];
        } else {
            label.font = [UIFont systemFontOfSize:15];
            label.textColor = [UIColor hex:@"666666"];
        }
    } else {
        NSArray *arrchild=[((id<PickAreaProtocol>)self.arrdata[self.firstComponentCurrentRow]) commonpickChildArr];
        NSArray *arrchild_child=[((id<PickAreaProtocol>)arrchild[self.secondComponentCurrentRow]) commonpickChildArr];
        label.text = [((id<PickAreaProtocol>)arrchild_child[row]) commonpickName];
        if (row == self.thirdComponentCurrentRow) {
            label.font = [UIFont systemFontOfSize:17];
            label.textColor = [UIColor blackColor];
        } else {
            label.font = [UIFont systemFontOfSize:15];
            label.textColor = [UIColor hex:@"666666"];
        }
    }
    
    return label;
}
-(void)reload{
    [self.pickerView reloadAllComponents];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        self.firstComponentCurrentRow = row;
        self.secondComponentCurrentRow = 0;
        self.thirdComponentCurrentRow = 0;
        
        [self.pickerView selectRow:self.firstComponentCurrentRow inComponent:0 animated:YES];
        if (self.componentNum>1) {//大于一列 才请求子项
            //判断子项是否有数据  没有就请求
            NSArray *arrchild=[((id<PickAreaProtocol>)self.arrdata[self.firstComponentCurrentRow]) commonpickChildArr];
            if (arrchild==nil||arrchild.count<1) {
                if (self.Block) {
                    self.Block(component,row);
                }
            }else{
                [self.pickerView selectRow:self.secondComponentCurrentRow inComponent:1 animated:YES];
            }
        }
        [self.pickerView reloadAllComponents];
        
    } else if (component == 1) {
        self.secondComponentCurrentRow = row;
        self.thirdComponentCurrentRow = 0;
        
        [self.pickerView selectRow:self.secondComponentCurrentRow inComponent:1 animated:YES];
        if (self.componentNum>2) {//大于一列 才请求子项
            //判断子项是否有数据  没有就请求
            NSArray *arrchild=[((id<PickAreaProtocol>)self.arrdata[self.firstComponentCurrentRow]) commonpickChildArr];
            NSArray *arrchild_child=[((id<PickAreaProtocol>)arrchild[self.secondComponentCurrentRow]) commonpickChildArr];
            if (arrchild_child==nil||arrchild_child.count<1) {
                if (self.Block) {
                    self.Block(component,row);
                }
            }else{
                [self.pickerView selectRow:self.thirdComponentCurrentRow inComponent:2 animated:YES];
            }
        }
        [self.pickerView reloadComponent:1];
    } else {
        self.thirdComponentCurrentRow = row;
        [self.pickerView reloadComponent:2];
        [self.pickerView selectRow:self.thirdComponentCurrentRow inComponent:2 animated:YES];
    }
    
}


#pragma mark - - lazyLoadUI
- (UIPickerView *)pickerView {
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] init];
    }
    return _pickerView;
}

#pragma mark - - lazyLoadData

@end
