//
//  UIFont+Utils.h
//  IZDProject
//  4.4.0开始设计不再按比例放大
//  Created by 0xday on 2020/2/21.
//  Copyright © 2020 zaodao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FontWeightStyle) {
    FontWeightStyleMedium,      // 中黑体
    FontWeightStyleSemibold,    // 中粗体
    FontWeightStyleLight,       // 细体
    FontWeightStyleUltralight,  // 极细体
    FontWeightStyleRegular,     // 常规体
    FontWeightStyleThin,        // 纤细体
};

@interface UIFont (Utils)

/**
 苹方字体

 @param fontWeight 字体粗细（字重)
 @param fontSize 字体大小
 @return 返回指定字重大小的苹方字体
 */
+ (UIFont *)pingFangSCWithWeight:(FontWeightStyle)fontWeight size:(CGFloat)fontSize;

+ (UIFont *)pf:(FontWeightStyle)fontWeight size:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
