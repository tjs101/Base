//
//  QBPathManager.h
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QBPathManager : NSObject

+ (NSString *)appRootPath;

//删除file
+ (BOOL)deletePath:(NSString *)path;

@end
