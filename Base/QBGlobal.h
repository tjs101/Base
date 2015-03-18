//
//  QBGlobal.h
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import <Foundation/Foundation.h>

extern  NSString  *const WifiAvailableNotification;//使用wifi连接
extern  NSString  *const WwanAavailableNotification;//使用2g/3g 连接
extern  NSString  *const NetworkUnavailableNotification;//未有网络


@interface QBGlobal : NSObject

@property (nonatomic, assign)  BOOL  wifiAvailable;
@property (nonatomic, assign)  BOOL  networkAvailable;

+ (QBGlobal *)sharedInstance;

- (void)startNetworkNotifer;

@end
