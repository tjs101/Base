//
//  QBServerRequest.h
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import <Foundation/Foundation.h>

// HTTP Status Code
// 1xx: 临时响应
// 2xx: 成功
// 3xx: 重定向
// 4xx: 请求错误
// 5xx: 服务器错误
#define HTTP_STATUS_CODE_OK(code)    (code >= 200 && code < 300)


@interface QBServerRequest : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) SEL  failedSelector;
@property (nonatomic, assign) SEL  successSelector;

@property (nonatomic, strong)  NSDictionary *infoDictionary;

- (NSDictionary *)responseDictionary;//返回的数据
+ (id)requestWithURL:(NSURL *)aUrl;
- (void)sendRequest;//请求网络
- (void)cancelAndClearDelegate;//取消网络请求

@end
