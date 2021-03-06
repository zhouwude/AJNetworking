//
//  RequestBeanBase.m
//  AJNetworking
//
//  Created by 钟宝健 on 16/3/18.
//  Copyright © 2016年 Joiway. All rights reserved.
//

#import "RequestBeanBase.h"

static const NSTimeInterval DEFAULT_TIMEOUT = 30.0;

@implementation RequestBeanBase

- (HTTP_SCHEME)httpScheme
{
    return HTTP_SCHEME_HTTP;
}

- (HTTP_METHOD)httpMethod
{
    return HTTP_METHOD_GET;
}

- (NSTimeInterval)timeout
{
    return DEFAULT_TIMEOUT;
}

- (NSString *)apiHost
{
    return [AJNetworkConfig shareInstance].hostUrl;
}

- (NSString *)apiPath
{
    return @"";
}

- (NSDictionary *)httpHeader
{
    return nil;
}

- (NSString *)requestUrl
{
    NSString *scheme = @"http";
    if ([self httpScheme] == HTTP_SCHEME_HTTPS) {
        scheme = @"https";
    }
    
    NSString *baseUrl = [self apiHost];
    NSString *apiPath = [self apiPath];
    NSString *requestUrl = [NSString stringWithFormat:@"%@://%@%@", scheme, baseUrl, apiPath];
    
    return requestUrl;
}

- (AFConstructingBlock)constructingBodyBlock
{
    return nil;
}

- (BOOL)cacheResponse
{
    return NO;
}

- (NSUInteger)cacheLiveSecond
{
    return 0;
}

+ (NSArray<NSString *> *)ignoredPropertyNames
{
    return @[];
}

+ (NSArray<NSString *> *)mj_ignoredPropertyNames
{
    NSMutableArray *ignoreArray = [NSMutableArray arrayWithArray:[self ignoredPropertyNames]];
    
    // 解决MJExtension最新版本的BUG
    [ignoreArray addObject:@"debugDescription"];
    [ignoreArray addObject:@"description"];
    [ignoreArray addObject:@"hash"];
    [ignoreArray addObject:@"superclass"];
    
    return ignoreArray;
}

@end
