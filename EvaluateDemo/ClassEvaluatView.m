//
//  ClassEvaluatView.m
//  EvaluateDemo
//
//  Created by leao on 2020/4/6.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import "ClassEvaluatView.h"
#import <Masonry/Masonry.h>
#import "EvaluatCell.h"
#import "EvaluatHeaderView.h"
#import "Macros.h"
#import "EvaluatData.h"
#import "UIImage+Util.h"
#import "UITextView+Placeholder.h"

@interface ClassEvaluatView()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *listArr;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) EvaluatHeaderView *headerView;
@property (strong, nonatomic) UIButton *btnSubmit;
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) NSMutableArray *dataArr;
@property (strong, nonatomic) UIView *footerView;
@end

@implementation ClassEvaluatView

#pragma mark - Life Cycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        _dataArr = [[NSMutableArray alloc]init];
        [self initViews];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self setupRoundedCornersWithView:_headerView cutCorners:UIRectCornerTopLeft|UIRectCornerTopRight borderColor:[UIColor whiteColor] borderWidth:0 viewColor:RCColorWithValue(0xF5F6FB)];
}

#pragma mark - Lazy Loading
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension; //高度自适应
        _tableView.tableFooterView = self.footerView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
    }
    return _tableView;
}

- (EvaluatHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[EvaluatHeaderView alloc]init];
        _headerView.blockClose = ^{
            
        };
    }
    return _headerView;
}

- (UIButton *)btnSubmit {
    if (!_btnSubmit) {
        _btnSubmit = [[UIButton alloc]init];
        [_btnSubmit setBackgroundImage:[UIImage imageWithColor:RCColorWithValue(0x338CFF) size:CGSizeMake(kScreenWidth - 32, 47)] forState:UIControlStateNormal];
        [_btnSubmit setBackgroundImage:[UIImage imageWithColor:RCColorWithValue(0xCCCCCC) size:CGSizeMake(kScreenWidth - 32, 47)] forState:UIControlStateDisabled];
        _btnSubmit.layer.masksToBounds = YES;
        [_btnSubmit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btnSubmit setTitle:@"提交" forState:UIControlStateNormal];
        [_btnSubmit addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
        [_btnSubmit.titleLabel setFont:kFont(16)];
        _btnSubmit.layer.cornerRadius = 6;
    }
    return _btnSubmit;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(16, 24, SCREEN_WIDTH - 2*16, 133)];
        _textView.backgroundColor = RCColorWithValue(0xF8F8F8);
        _textView.layer.cornerRadius = 6;
        _textView.placeholder = @"更多建议请留言…";
        _textView.placeholderColor = RCColorWithValue(0x9A9A9A);
        _textView.textColor = [UIColor blackColor];
    }
    return _textView;
}


- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 133 + 24)];
        [_footerView addSubview:self.textView];
    }
    return _footerView;
}

#pragma mark - Public Method
/// 更新列表数据
/// @param listArr 数据源
- (void)updateList:(NSArray *)listArr {
    _listArr = [NSArray arrayWithArray:listArr];
    [_tableView reloadData];
}

#pragma mark - Private Method
- (void)initViews {
    // Submit
    [self.btnSubmit setEnabled:NO];
    [self addSubview:self.btnSubmit];
    [self.btnSubmit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.bottom.mas_equalTo(-46);
        make.height.mas_equalTo(47);
    }];
    
    // HeaderView
    [self addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(158);
        make.left.right.mas_equalTo(0);
        make.size.height.mas_equalTo(47);
    }];
    
    // TableView
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerView.mas_bottom).offset(0);
        make.left.right.mas_equalTo(0);
        make.bottom.equalTo(self.btnSubmit.mas_top).offset(-16);
    }];
}

/// Submit
- (void)submitClick {
    NSLog(@"%@",_dataArr);
}

/**
 按钮的圆角设置

 @param view view类控件
 @param rectCorner UIRectCorner要切除的圆角
 @param borderColor 边框颜色
 @param borderWidth 边框宽度
 @param viewColor view类控件颜色
 */
- (void)setupRoundedCornersWithView:(UIView *)view cutCorners:(UIRectCorner)rectCorner borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth viewColor:(UIColor *)viewColor{

    CAShapeLayer *mask = [CAShapeLayer layer];
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(7,7)];
    mask.path = path.CGPath;
    mask.frame = view.bounds;

    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.path = path.CGPath;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = borderColor.CGColor;
    borderLayer.lineWidth = borderWidth;
    borderLayer.frame = view.bounds;
    view.layer.mask = mask;
    [view.layer addSublayer:borderLayer];
}

/// 提交按钮是否有效
- (BOOL)isBtnAvailable {

    if (ISNULLARRAY(_dataArr)) {
        
        [self.btnSubmit setEnabled:NO];
        return NO;
    }
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    
    for (EvaluatData *data in _dataArr) {
        if (data.starCount != 0) {
            [arr addObject:data];
        }
    }
    
    if (arr.count == _listArr.count) {
        [self.btnSubmit setEnabled:YES];
        return YES;
    }
    
    [self.btnSubmit setEnabled:NO];
    return NO;
}

#pragma mark - Private Method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ISNULLARRAY(_listArr) ? 0 : _listArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 133;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    
    EvaluatCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[EvaluatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSString *eID = _listArr[indexPath.row][@"eID"];
    
    EvaluatData *dataE = nil;
    
    for (EvaluatData *model in _dataArr) {
        if ([model.eID isEqualToString:eID]) {
            dataE = model;
        }
    }
    
    [cell updateData:_listArr[indexPath.row] selectData:dataE];
    
    kWEAKSELF
    cell.blockRefesh = ^(NSInteger num) {
        // 几颗星记录
        [weakSelf.tableView beginUpdates];
        [weakSelf.tableView endUpdates];
        
        EvaluatData *data = [[EvaluatData alloc]init];
        data.starCount = num;
        data.eID = eID;
        
        if (ISNULLARRAY(weakSelf.dataArr)) {
            [weakSelf.dataArr addObject:data];
        } else {
            for (EvaluatData *model in weakSelf.dataArr) {
                if ([model.eID isEqualToString:eID]) {
                    model.starCount = num;
                    model.tags = @"";
                    break;
                } else {
                    [weakSelf.dataArr addObject:data];
                    break;
                }
            }
        }
        
        [weakSelf isBtnAvailable];
    };
    
    cell.blockTag = ^(NSString * _Nonnull tag) {
        EvaluatData *data = [[EvaluatData alloc]init];
        data.eID = eID;
        data.tags = tag;
        
        if (ISNULLARRAY(weakSelf.dataArr)) {
            [weakSelf.dataArr addObject:data];
        } else {
            for (EvaluatData *model in weakSelf.dataArr) {
                if ([model.eID isEqualToString:eID]) {
                    NSArray *tagsArr = [model.tags componentsSeparatedByString:@","];
                    NSMutableArray *tagMuArr = [NSMutableArray arrayWithArray:tagsArr];
                    
                    if ([tagMuArr containsObject:tag]) {
                        [tagMuArr removeObject:tag];
                    } else {
                        [tagMuArr addObject:tag];
                    }
                    
                    if (tagMuArr.count == 1) {
                        model.tags = tagMuArr.firstObject;
                    } else {
                        model.tags = [tagMuArr componentsJoinedByString:@","];
                    }
                    
                    break;
                }
            }
        }
        
        [weakSelf isBtnAvailable];
    };
    
    return cell;
}
@end
