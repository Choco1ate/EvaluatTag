//
//  EvaluatHeaderView.h
//  EvaluateDemo
//
//  Created by leao on 2020/4/6.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BlockClose)(void);

@interface EvaluatHeaderView : UIView
@property (strong, nonatomic) BlockClose blockClose;
@end

NS_ASSUME_NONNULL_END
