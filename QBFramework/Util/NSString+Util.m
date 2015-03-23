//
//  NSString+Util.m
//  HealthCare
//
//  Created by tian on 14-6-3.
//  Copyright (c) 2014年 tian. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

- (NSString *)stringWithURLEncoded
{
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
