//
//  TagViewCell.h
//  EvaluateDemo
//
//  Created by leao on 2020/4/1.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^BlockClick)(void);

@interface TagViewCell : UICollectionViewCell
@property (strong, nonatomic) BlockClick blockClick;

/// Set title & select state
/// @param title title
/// @param isSelect state
- (void)updateTitle:(NSString *)title isSelect:(BOOL)isSelect;
@end

NS_ASSUME_NONNULL_END
