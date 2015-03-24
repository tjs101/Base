//
//  QBSystem.h
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QBSystem : NSObject

//app executable
+ (NSString *)appExecutable;

//build version
+ (NSString *)appBuildVersion;

//app version
+ (NSString *)appReleaseVersion;

//系统版本
+ (CGFloat)systemVersion;
+ (BOOL)IOS6Later;
+ (BOOL)IOS7Later;
+ (BOOL)IOS8Later;

//统计
+ (void)beginLogPageView:(NSString *)viewName;
+ (void)endLogPageView:(NSString *)viewName;
+ (void)event:(NSString *)eventId;

//判断是否为模拟器
+ (BOOL)targetSimulator;


@end
