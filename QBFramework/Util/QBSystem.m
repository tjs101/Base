//
//  QBSystem.m
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import "QBSystem.h"
#import "MobClick.h"

@implementation QBSystem

+ (NSString *)appExecutable
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleExecutable"];
}

+ (NSString *)appBuildVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+ (NSString *)appReleaseVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)deviceModel
{
    UIDevice  *device = [UIDevice currentDevice];
    
    return [device model];
}

+ (CGFloat)systemVersion
{
    UIDevice  *device = [UIDevice currentDevice];
    
    return [[device systemVersion] floatValue];
}

+ (BOOL)IOS6Later
{
    return [QBSystem systemVersion] >= 6.0f;
}

+ (BOOL)IOS7Later
{
    return [QBSystem systemVersion] >= 7.0f;
}

+ (BOOL)IOS8Later
{
    return [QBSystem systemVersion] >= 8.0f;
}

+ (void)beginLogPageView:(NSString *)viewName
{
    [MobClick beginLogPageView:viewName];
}

+ (void)endLogPageView:(NSString *)viewName
{
    [MobClick endLogPageView:viewName];
}

+ (void)event:(NSString *)eventId
{
    [MobClick event:eventId];
}

@end
