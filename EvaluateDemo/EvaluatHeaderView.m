//
//  EvaluatHeaderView.m
//  EvaluateDemo
//
//  Created by leao on 2020/4/6.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import "EvaluatHeaderView.h"
#import "Macros.h"
#import <Masonry/Masonry.h>

@implementation EvaluatHeaderView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RCColorWithValue(0xF5F6FB);
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"课程评价";
        label.textColor = RCColorWithValue(0x2B2B2B);
        label.font = kFont(16);
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        UIImage *imageClose = [UIImage imageNamed:@"evaluate_btn_close"];
        UIButton *btnClose = [[UIButton alloc]init];
        [btnClose setImage:imageClose forState:UIControlStateNormal];
        [btnClose addTarget:self action:@selector(closeClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnClose];
        
        [btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(44, 44));
            make.centerY.equalTo(self);
            make.right.mas_equalTo(0);	
        }];
    }
    return self;
}

- (void)closeClick:(UIButton *)btn {
    if (_blockClose) {
        self.blockClose();
    }
}
@end
