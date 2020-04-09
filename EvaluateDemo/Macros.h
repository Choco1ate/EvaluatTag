//
//  Macros.h
//  JPWord
//
//  Created by leao on 2017/4/28.
//  Copyright © 2017年 zaodao. All rights reserved.
//

#ifdef DEBUG
#define IZDLog(fmt, ...) NSLog((@"\n[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define IZDLog(...);
#endif

// 系统控件默认高度
#define kStatusBarHeight        (IS_IPHONE_X ? 44 : 20)
#define kNavigationBarHeight    (44.f)
#define kTabBarHeight           (49.f)
#define BOTTOM_SAFEAREA_HEIGHT  (IS_IPHONE_X? 34 : 0)

// 屏幕适配
#define kwidthTimes  kScreenWidth/375.0
#define kheightTimes kScreenHeight/667.0

//
#define kTableHeight  (kwidthTimes == 1 ? 50 : 55)

// App Color
#define kColorTableLine         RCColorWithValue(0xE2E2E2)  // 线条颜色-浅
#define kColorLoading           RCColorWithValueAlpha(0xffcbcb,0.8)  // loading
#define kColorTitle             RCColorWithValue(0x333333)  // App字体颜色
#define kColorMain              RCColorWithValue(0xFF4E4E)  // App主色
#define kColorGray              RCColorWithValue(0xF1F1F1)
#define kColorDescTitle         RCColorWithValue(0x9b9b9b)  // App字体颜色
#define kColorBackGround        RCColorWithValue(0xFAFAFA)
#define kQuestionTitleBlack     RCColorWithValue(0x646464)
#define kBrownBlack             RCColorWithValue(0xB4B4B4)  //
#define kBackgroundColor        RCColorWithValue(0xFAFAFA)
#define kColorTitleHighlight    RCColorWithValue(0xFF5C00)
#define kTableSeparatorColor    RCColorWithValue(0xEEEEEE)
#define kColorTitle2            RCColorWithValue(0x666666)
#define kRightColor             RCColorWithValue(0x76CEA1)  //
#define kBlackLight             RCColorWithValue(0xB4B4B4)  //
#define kColorLine              RCColorWithValue(0xF1F1F1)  // 线条颜色
#define kPopShare               RCColorWithValue(0xFFF0E8)  //
#define kGrayBlack              RCColorWithValue(0x9B9B9B)  //
#define kTestLine               RCColorWithValue(0xE6E6E6)  //
#define kBlack                  RCColorWithValue(0x3C3C3C)  // Tab字体颜色
#define kYellowishBrown         RCColorWithValue(0xd2a00a)
#define kYellowish              RCColorWithValue(0xf0dcc1) // tab shadow颜色
#define kLeftBtn                RCColorWithValue(0xFFA473)  //
#define kPurpleColor            RCColorWithValue(0x5C24CB)
#define kAI_YellowColor         RCColorWithValue(0xFF9300)
#define kAI_BlueColor           RCColorWithValue(0x3F52A7)
#define kAI_RedColor            RCColorWithValue(0xFF4456)
#define kAI_GreenColor          RCColorWithValue(0x40CD5C)
#define kAI_GrayColor           RCColorWithValue(0xABBAE4)
#define kAI_GrayBorderColor     RCColorWithValue(0x4F5970)
#define kTestWhiteCover         RCColorWithValue(0xFFF6F3)  // 复习假名选择颜色
#define kTestWhite              RCColorWithValue(0xFAFAFA)  // 复习假名选择颜色
#define kLightYellowishBrown    RCColorWithValue(0x8c8c86)


// Screen Width
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width

// Screen Height
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height

// UserDefault
#define kUserDefault [NSUserDefaults standardUserDefaults]

#define kSetObjOfUDefault(v,key)          [kUserDefault setObject:v forKey:key]
#define kObjOfUDefault(key)               [kUserDefault objectForKey:key]

// weekself
#define  FM_WEAKSELF      __weak typeof(self) weakSelf                    = self;

// Appdelegate
#define kAppDelegate    (AppDelegate *)[UIApplication sharedApplication].delegate

// App版本号
#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// 字体大小
#define kFontNum 2.0
#define kFontSizeWidthTime(v) kwidthTimes > 1?v+kFontNum:(kwidthTimes == 1?v:v-kFontNum)
#define kFont(v)   [UIFont systemFontOfSize:kwidthTimes > 1?v+2.5:(kwidthTimes == 1?v:v-2.5)]
#define kBoldFont(v)   [UIFont boldSystemFontOfSize:kwidthTimes > 1?v+2.5:(kwidthTimes == 1?v:v-2.5)]
#define kFontWithName(v, name)   [UIFont fontWithName:name size:kwidthTimes > 1?v+2.5:(kwidthTimes == 1?v:v-2.5)]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RCColorWithValueAlpha(v,a)         [UIColor colorWithRed:(((v) >> 16) & 0xff)/255.0f green:(((v) >> 8) & 0xff)/255.0f blue:((v) & 0xff)/255.0f alpha:a]
#define RCColorWithValue(v)         [UIColor colorWithRed:(((v) >> 16) & 0xff)/255.0f green:(((v) >> 8) & 0xff)/255.0f blue:((v) & 0xff)/255.0f alpha:1]

// 默认图
#define IMAGE_PLACEHOLDER [UIImage imageWithColor:RCColorWithValue(0xDDDDDD)]

// 分享链接
#define kShareOpenUrl(url)  [NSString stringWithFormat:@"%@&is=open",url]

#define kWEAKSELF __weak typeof(self) weakSelf = self;

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
    Stuff; \
    _Pragma("clang diagnostic pop") \
} while (0)

// Phone Version
#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
#define IsiOS7Later                         !(IOSVersion < 7.0)
#define IsiOS8Later                         !(IOSVersion < 8.0)
#define IsiOS10Later                         (IOSVersion < 10.0)
#define IsiOS11Later                         (IOSVersion >= 11.0)


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_PLUS (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
//#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH >= 812.0)
#define IS_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

//str, must has value, cannot be nil, cannot be other type
#define ISNULLSTR(str) (str == nil || (NSObject *)str == [NSNull null] || ![str isKindOfClass:[NSString class]] || str.length == 0)

//array, must has value, cannot be nil, cannot be other type
#define ISNULLARRAY(array) (array == nil || (NSObject *)array == [NSNull null] || ![array isKindOfClass:[NSArray class]] || array.count == 0)

//dictionary, must has value, cannot be nil, cannot be other type
#define ISINULLDIC(dic) (dic == nil || (NSObject *)dic == [NSNull null] || ![dic isKindOfClass:[NSDictionary class]])

#define ISNULL(str) (str == nil || (NSObject *)str == [NSNull null] || ![str isKindOfClass:[NSString class]] || str.length == 0)

#define ISEMPTYSTR(str) ISNULLSTR(str) ? @"" : str


