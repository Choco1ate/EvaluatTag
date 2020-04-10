//
//  EvaluatStarView.h
//  EvaluateDemo
//
//  Created by leao on 2020/4/6.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BlockTagClick)(NSInteger index);

@interface EvaluatStarView : UIView
@property (strong, nonatomic) BlockTagClick blockClick;
@property (copy, nonatomic) NSString *titleName;

/// Set default star count
/// @param num start count
- (void)setNum:(NSInteger)num;

/// Set select star count
/// @param num select star count
- (void)selectNum:(NSInteger)num;
@end

NS_ASSUME_NONNULL_END
