//
//  ViewController.m
//  EvaluateDemo
//
//  Created by leao on 2020/4/1.
//  Copyright © 2020 Zaodao(Dalian) Technology Co. Ltd. All rights reserved.
//

#import "ViewController.h"
#import "ClassEvaluatView.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *listArr;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _listArr =
    @[@{@"eID": @"123",
        @"title": @"课程评价",
        @"stars": @[@{
            @"num": @(1),
            @"describe": @"非常满意",
            @"tags": @[@"tag1", @"tag2", @"tag3",@"tag4", @"tag5", @"tag6",@"tag7", @"tag8", @"tag9",@"tag10", @"tag11", @"tag12"]
        }, @{
            @"num": @(2),
            @"describe": @"还行吧啊",
            @"tags": @[@"tag1", @"tag2", @"tag3",@"tag4", @"tag5", @"tag6",@"tag7", @"tag8", @"tag9",@"tag10", @"tag11", @"tag12"]
        }, @{
            @"num": @(3),
            @"describe": @"不咋地啊",
            @"tags": @[@"tag1", @"tag2", @"tag3", @"tag4", @"tag5"]
        }, @{
            @"num": @(4),
            @"describe": @"滚犊子吧",
            @"tags": @[@"tag1"]
        }, @{
            @"num": @(5),
            @"describe": @"莎愣滚蛋",
            @"tags": @[@"tag1", @"tag2"]
        }]
    }, @{
        @"eID": @"124",
        @"title": @"授课满意度",
        @"stars": @[@{
            @"num": @(1),
            @"describe": @"非常满意",
            @"tags": @[@"tag1", @"tag2", @"tag3", @"tag4"]
        }, @{
            @"num": @(2),
            @"describe": @"不咋地啊",
            @"tags": @[@"tag1", @"tag2", @"tag3", @"tag4"]
        }, @{
            @"num": @(3),
            @"describe": @"滚犊子吧",
            @"tags": @[@"tag1", @"tag2", @"tag3", @"tag4", @"tag5",@"tag6", @"tag7", @"tag8", @"tag9", @"tag10"]
        }]
    }];

    ClassEvaluatView *evalutView = [[ClassEvaluatView alloc]initWithFrame:self.view.bounds];
    [evalutView updateList:_listArr];
    [self.view addSubview:evalutView];
}
@end
