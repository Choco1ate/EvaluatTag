//
//  ClassEvaluatView.h
//  EvaluateDemo
//
//  Created by leao on 2020/4/6.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClassEvaluatView : UIView

/// 更新列表数据
/// @param listArr 数据源
- (void)updateList:(NSArray *)listArr;
@end

NS_ASSUME_NONNULL_END
