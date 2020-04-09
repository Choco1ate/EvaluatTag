//
//  EvaluatCell.h
//  EvaluateDemo
//
//  Created by leao on 2020/4/6.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EvaluatData.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^BlockRefresh)(NSInteger num);
typedef void(^BlockTags)(NSString *tag);

@interface EvaluatCell : UITableViewCell
@property (strong, nonatomic) BlockRefresh blockRefesh;
@property (strong, nonatomic) BlockTags blockTag;
/// 更新列表数据
/// @param dict 数据源
/// @param selectData 选中数据
- (void)updateData:(NSDictionary *)dict selectData:(EvaluatData *)selectData;
@end

NS_ASSUME_NONNULL_END
