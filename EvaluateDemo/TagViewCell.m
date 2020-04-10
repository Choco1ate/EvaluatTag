//
//  TagViewCell.m
//  EvaluateDemo
//
//  Created by leao on 2020/4/1.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import "TagViewCell.h"
#import <Masonry/Masonry.h>
#import "Macros.h"

@interface TagViewCell()
@property (strong, nonatomic) UIButton *btnTag;
@end

@implementation TagViewCell

#pragma mark - Life Cycle
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - Lazy Load
- (UIButton *)btnTag {
    if (!_btnTag) {
        _btnTag = [[UIButton alloc]init];
        UIImage *image_n = [UIImage imageNamed:@"btn_tag_n"];
        UIImage *image_s = [UIImage imageNamed:@"btn_tag_s"];

//        [_btnTag setBackgroundImage:[image_n resizableImageWithCapInsets:UIEdgeInsetsMake(10, 20, 10, 20)] forState:UIControlStateNormal];
//        [_btnTag setBackgroundImage:[image_s resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, image_n.size.width/2) resizingMode:UIImageResizingModeStretch] forState:UIControlStateSelected];
        [_btnTag setBackgroundImage:image_n forState:UIControlStateNormal];
        [_btnTag setBackgroundImage:image_s forState:UIControlStateSelected];
        
        [_btnTag setTitleColor:RCColorWithValue(0xCCCCCC) forState:UIControlStateNormal];
        [_btnTag setTitleColor:RCColorWithValue(0x338CFF) forState:UIControlStateSelected];
        [_btnTag setTitle:@"" forState:UIControlStateNormal];
        [_btnTag.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_btnTag addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnTag;
}

#pragma mark - Public Method

/// Set title & select state
/// @param title title
/// @param isSelect state
- (void)updateTitle:(NSString *)title isSelect:(BOOL)isSelect{
    [self.btnTag setSelected:isSelect];
    [self.btnTag setTitle:title forState:UIControlStateNormal];
}

#pragma mark - Private Method
- (void)initViews {
    [self.contentView addSubview:self.btnTag];
    [self.btnTag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (void)btnClick:(UIButton *)btn {
    [btn setSelected:!btn.isSelected];
    if (_blockClick) {
        _blockClick();
    }
}
@end
