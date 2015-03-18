//
//  QBPathManager.m
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import "QBPathManager.h"
#import "QBSystem.h"

@implementation QBPathManager

+ (NSString *)appRootPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths firstObject];
    path = [path stringByAppendingPathComponent:[QBSystem appExecutable]];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:path]) {
        [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    return path;
}

+ (BOOL)deletePath:(NSString *)path
{
    return [[NSFileManager defaultManager] removeItemAtPath:path error:NULL];
}

@end
