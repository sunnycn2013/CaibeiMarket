//
//  UAHTTPSessionManager.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/10.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

@interface UAHTTPSessionManager : NSObject

@property (readonly, nonatomic, strong, nullable) NSURL *baseURL;
@property (readonly, nonatomic, strong, nullable) AFHTTPSessionManager *httpSessionManager;

@property (nonatomic, strong) AFHTTPRequestSerializer <AFURLRequestSerialization> * _Nullable requestSerializer;

@property (nonatomic, strong) AFHTTPResponseSerializer <AFURLResponseSerialization> * _Nullable responseSerializer;

+ (instancetype _Nullable )manager;

- (instancetype _Nullable )initWithBaseURL:(nullable NSString *)urlString;

- (instancetype _Nullable )initWithBaseURL:(nullable NSString *)urlString
           sessionConfiguration:(nullable NSURLSessionConfiguration *)configuration;

- (nullable NSURLSessionDataTask *)GET:(NSString *_Nullable)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress * _Nullable downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;


- (nullable NSURLSessionDataTask *)POST:(NSString *_Nullable)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

- (nullable NSURLSessionDataTask *)POST:(NSString *_Nullable)URLString
                             parameters:(nullable id)parameters
              constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> _Nullable formData))block
                               progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

@end
