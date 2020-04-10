//
//  EvaluatStarView.m
//  EvaluateDemo
//
//  Created by leao on 2020/4/6.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import "EvaluatStarView.h"
#import <Masonry.h>
#import "Macros.h"
#import "UIFont+Utils.h"

@interface EvaluatStarView()
@property (assign, nonatomic) NSInteger count;
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation EvaluatStarView

- (id)initWithNum:(NSInteger)num{
    self = [super init];
    
    if (self) {
        
    }
    return self;
}

#pragma mark - Private Method

- (void)btnClick:(UIButton *)btn {
    
    NSInteger tag = btn.tag;
    
    if (btn.isSelected && _count == tag) {
        return;
    }
    
    _count = tag;
    
    if (_blockClick) {
        self.blockClick(tag - 1);
    }
    
    if (!btn.isSelected) {
        for (NSObject *object in self.subviews) {
            if ([object isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton *)object;
                
                if (button.tag <= tag) {
                    [button setSelected:YES];
                }
            }
        }
    } else {
        for (NSObject *object in self.subviews) {
            if ([object isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton *)object;
                
                if (button.tag > tag) {
                    [button setSelected:NO];
                }
            }
        }
    }
}

#pragma mark - Public Method

/// Set default star count
/// @param num start count
- (void)setNum:(NSInteger)num {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    const int margin = 28;
    
    UIImage *image_n = [UIImage imageNamed:@"icon_star_gray"];
    UIImage *image_s = [UIImage imageNamed:@"icon_star_yellow"];
    
    CGRect rect;
    rect.origin = CGPointMake(0, 0);
    rect.size = CGSizeMake(23, 23);
    
    for (int i = 0; i < num; i ++) {
        UIButton *btn = [[UIButton alloc]init];
        [btn setImage:image_n forState:UIControlStateNormal];
        [btn setImage:image_s forState:UIControlStateSelected];
        btn.tag = i + 1;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(rect.origin.x);
            make.size.mas_equalTo(rect.size);
        }];
        
        rect.origin.x += rect.size.width + margin;
    }
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont pf:FontWeightStyleMedium size:12];
    titleLabel.textColor = RCColorWithValue(0xF5A42A);
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(rect.origin.x);
        make.height.mas_equalTo(rect.size.height);
    }];
    
    _titleLabel = titleLabel;
}

- (void)setTitleName:(NSString *)titleName {
    [self.titleLabel setText:titleName];
}

/// Set select star count
/// @param num select star count
- (void)selectNum:(NSInteger)num {
    UIButton *btn = [self viewWithTag:num];
    
    NSInteger tag = btn.tag;
    
//    if (_blockClick) {
//        self.blockClick(tag - 1);
//    }
//    
    if (!btn.isSelected) {
        for (NSObject *object in self.subviews) {
            if ([object isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton *)object;
                
                if (button.tag <= tag) {
                    [button setSelected:YES];
                }
            }
        }
    }
}
@end
