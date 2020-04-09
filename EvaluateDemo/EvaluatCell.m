//
//  EvaluatCell.m
//  EvaluateDemo
//
//  Created by leao on 2020/4/6.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import "EvaluatCell.h"
#import "TagViewCell.h"
#import <Masonry/Masonry.h>
#import "EvaluatStarView.h"
#import "Macros.h"

static NSString * const tagCell = @"tagCell";

#define TOP_COLLECTION 12
#define HEIGHT_COLLECTION 36
@interface EvaluatCell()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) EvaluatStarView *starView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) NSArray *listTags;
@property (strong, nonatomic) NSArray *listStar;
@property (strong, nonatomic) EvaluatData *seletData;
@property (copy, nonatomic) NSString *eID;
@end

@implementation EvaluatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    // Title
    [self.contentView addSubview:self.titleLabel];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.mas_equalTo(16);
          make.left.mas_equalTo(18);
          make.height.mas_equalTo(kFont(14).lineHeight);
          make.right.mas_equalTo(-16);
    }];
    
    // Star
    [self.contentView addSubview:self.starView];
    
    [self.starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(6);
        make.left.equalTo(self.titleLabel);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(23);
    }];
    
    // CollectionView
    [self.contentView addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.starView.mas_bottom);
        make.right.bottom.left.equalTo(@0);
        make.height.mas_equalTo(@1).priorityLow();//设置一个高度，以便赋值后更新
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - Lazy Loading

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 12;
        layout.itemSize = CGSizeMake((kScreenWidth - 2*16 - 3*12)/3, HEIGHT_COLLECTION);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.bounces = NO;

        _collectionView.alwaysBounceHorizontal = YES;
        _collectionView.alwaysBounceVertical = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.contentInset = UIEdgeInsetsMake(TOP_COLLECTION, 19, TOP_COLLECTION, 19);
        [_collectionView registerClass:[TagViewCell class] forCellWithReuseIdentifier:tagCell];
    }
    return _collectionView;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc]init];
    }
    return _topView;
}

- (EvaluatStarView *)starView {
    if (!_starView) {
        kWEAKSELF
        _starView = [[EvaluatStarView alloc]init];
        _starView.blockClick = ^(NSInteger index) {
            weakSelf.seletData.tags = @"";
            weakSelf.listTags = weakSelf.listStar[index][@"tags"];
            
            weakSelf.starView.titleNamel = weakSelf.listStar[index][@"describe"];
            
            // 计算Tag高度
            [weakSelf heightCollection:weakSelf.listTags.count];
            
            if (weakSelf.blockRefesh) {
                weakSelf.blockRefesh(index + 1);
            }
        };
    }
    return _starView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kFont(14);
        _titleLabel.textColor = RCColorWithValue(0x2B2B2B);
    }
    return _titleLabel;
}

#pragma mark - Public Method
/// 更新列表数据
/// @param dict 数据源
/// @param selectData 选中数据
- (void)updateData:(NSDictionary *)dict selectData:(EvaluatData *)selectData {
    if (dict) {
        // ID
        _eID = dict[@"eID"];
        
        // Star
        _listStar = dict[@"stars"];
        
        if (!ISNULLARRAY(_listStar)) {
            [self.starView setNum:_listStar.count];
            
            // Set selected Star for save select star data
            if ([selectData.eID isEqualToString:_eID]) {
                _seletData = selectData;
                
                [self.starView selectNum:selectData.starCount];
                
                // Tag
                self.listTags = self.listStar[selectData.starCount - 1][@"tags"];
                
                // 计算Tag高度
                [self heightCollection:_listTags.count];
            }
        }
        
        // Title
        NSString *title = dict[@"title"];
        
        self.titleLabel.text = title;
    }
}

- (void)heightCollection:(NSInteger)num {
    [self.collectionView reloadData];

    int count = (int)ceil(num / 3.0);  //结果是4
    
    CGFloat height = HEIGHT_COLLECTION*count + (count + 1)*TOP_COLLECTION;
    NSLog(@"height = %lf",height);
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
         make.height.mas_equalTo(@(height)).priorityLow();
    }];
}

#pragma mark - Collection delegate && datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return ISNULLARRAY(_listTags) ? 0 : _listTags.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TagViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:tagCell forIndexPath:indexPath];

    NSString *title = _listTags[indexPath.row];

    if (!_seletData) {
        [cell updateTitle:title isSelect:NO];
    } else {
        if ([_seletData.tags containsString:title]) {
            [cell updateTitle:title isSelect:YES];
        } else {
            [cell updateTitle:title isSelect:NO];
        }
    }
    
    
    kWEAKSELF
    cell.blockClick = ^{
        if (weakSelf.blockTag) {
            weakSelf.blockTag(title);
        }
    };

    return cell;
}

#pragma mark - UICollectionViewDelegate点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
