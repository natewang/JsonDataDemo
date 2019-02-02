//
//  ViewController.m
//  JsonDataDemo
//
//  Created by nate on 2019/1/31.
//  Copyright © 2019 nate. All rights reserved.
//

#import "ViewController.h"
#import "JsonAccess.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *ext = @{
                          @"cardTitle": @"营销卡片消息标题",
                          @"activityId": @"活动id",
                          @"promotionTitle": @"营销产品标题-全部房型满99立减30",
                          @"promotionDesp": @"营销产品描述-业务自己处理换行，最多支持5行",
                          @"promotionImg": @"营销产品图片",
                          @"startTime": @"活动开始日期，精确到毫秒的unix时间戳",
                          @"endTime": @"活动结束日期，精确到毫秒的unix时间戳",
                          @"btnList": @[@{
                              @"btnTitle": @"按钮标题",
                              @"jumpUrl": @{
                                  @"app": @"app端落地页链接",
                                  @"online": @"online端落地页链接",
                                  @"web": @"H5端落地页链接",
                                  @"number" : @"99",
                                  @"string" : @(100)
                              }
                          }]
                          };
    
    NSDictionary *resultJSON = @{
                   @"ext" : ext,
                   @"action" : @"CBZ26"
                   };
    
    NSArray *arr = Json(resultJSON).key(@"ext").key(@"btnList").array;
    NSLog(@"%@", arr);
    
    NSLog(@"%@", Json(resultJSON).key(@"ext").key(@"cardTitle").string);
    //营销卡片消息标题
    NSLog(@"%@", Json(resultJSON)
          .key(@"ext")
          .key(@"btnList")
          .index(0)
          .key(@"btnTitle").string);
    //按钮标题
    
    NSLog(@"%@",Json(resultJSON)[@"ext"][@"btnList"][0][@"btnTitle"].string);
    
    NSLog(@"%@", Json(resultJSON)
          .key(@"ext")
          .key(@"btnList")
          .index(0)
          .key(@"jumpUrl")
          .key(@"number").number);
    //转number
    
    NSLog(@"%@", Json(resultJSON)
          .key(@"ext")
          .key(@"btnList")
          .index(0)
          .key(@"jumpUrl")
          .key(@"string").string);
//    转string
    
    NSLog(@"%@", Json(resultJSON).key(@"ext").key(@"cardTitle").number);
    //0 number强转默认规则为0，同yymodel
    
    NSLog(@"%@", Json(resultJSON)
          .key(@"ext")
          .key(@"btnList")
          .index(100)
          .key(@"btnTitle").string);
    //null 数组越界 ❌
    
    NSLog(@"%@", Json(@"wrong argument")
          .key(@"ext")
          .key(@"btnList")
          .index(0)
          .key(@"btnTitle").string);
    //null 传入参数错误❌
    
}


@end
