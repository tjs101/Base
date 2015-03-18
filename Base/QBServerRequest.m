//
//  QBServerRequest.m
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import "QBServerRequest.h"
#import "QBConfig.h"

@interface QBServerRequest ()

{
    NSInteger  _statusCode;
}

@property  (nonatomic, strong)  NSURL  *url;
@property  (nonatomic, strong)  NSDictionary  *dictionary;

@property  (nonatomic, retain)  NSURLConnection  *connection;
@property  (nonatomic, retain)  NSMutableData  *data;

@end

@implementation QBServerRequest
@synthesize delegate;
@synthesize failedSelector;
@synthesize successSelector;
@synthesize url;
@synthesize dictionary;

@synthesize connection;
@synthesize data;
@synthesize infoDictionary;

- (id)initWithURL:(NSURL *)aUrl
{
    if (self = [super init]) {
        self.url = aUrl;
    }
    return self;
}

+ (id)requestWithURL:(NSURL *)aUrl
{
    return [[self alloc] initWithURL:aUrl];
}

- (NSDictionary *)responseDictionary
{
    return dictionary;
}

- (void)sendRequest
{
    NSLog(@"send URL:%@",self.url);
    
    NSURLRequest  *request = [self buildRequest];
    
    self.dictionary = nil;
    self.data = nil;
    
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
}

- (NSURLRequest *)buildRequest
{
    NSMutableURLRequest  *request = [NSMutableURLRequest requestWithURL:self.url];
    [request setHTTPMethod:@"GET"];
    [request setURL:self.url];
    
    [request setTimeoutInterval:60];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    
    return request;
}

- (void)cancelAndClearDelegate
{
    [self.connection cancel];
    self.delegate = nil;
}

#pragma mark -  delegate

- (void)resportFinished
{
    if (delegate && [delegate respondsToSelector:successSelector]) {
        [delegate performSelector:successSelector withObject:self];
    }
}

- (void)resportFailed
{
    NSLog(@"failed dic %@ data %@",self.url,self.dictionary);
    
    if (delegate && [delegate respondsToSelector:failedSelector]) {
        [delegate performSelector:failedSelector withObject:self];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    if (HTTP_STATUS_CODE_OK(_statusCode)) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];
        
        self.dictionary = [NSDictionary dictionaryWithDictionary:dict];
        [self resportFinished];
    }
    else {
        [self resportFailed];
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    self.data = nil;
    self.dictionary = nil;
    
    [self resportFailed];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.data = nil;
    self.data = [NSMutableData data];
    
    self.dictionary = nil;
    
    NSHTTPURLResponse  *httpResponse = (NSHTTPURLResponse *)response;

    _statusCode = httpResponse.statusCode;
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)aData
{
    [self.data appendData:aData];
}

@end
