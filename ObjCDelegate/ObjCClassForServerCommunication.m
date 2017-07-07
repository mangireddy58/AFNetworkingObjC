//
//  ObjCClassForServerCommunication.m
//  ObjCDelegate
//
//  Created by Rushikesh Kulkarni on 07/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

#import "ObjCClassForServerCommunication.h"

#define BASE_URL @"Your Url"
#define SERVICE_TIMEOUT 60.0


@implementation ObjCClassForServerCommunication

- (void)sendHttpGetRequestWithParam:(NSString *)parametersString andServiceName:(NSString *)serviceName{
    
    NSString *serviceUrl = [NSString stringWithFormat:@"%@%@", BASE_URL, serviceName];
    NSData* data = [parametersString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *parametersDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [manager GET:serviceUrl parameters:parametersDictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.delegate) {
            [self.delegate onServiceSuccess:(NSDictionary *)responseObject];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.delegate) {
            [self.delegate onServiceFailed];
        }
    }];
}

- (void)sendHttpPostRequestWithParam:(NSString *)parametersString andServiceName:(NSString *)serviceName{
    
    NSString *serviceUrl = [NSString stringWithFormat:@"%@%@", BASE_URL, serviceName];
    NSData* data = [parametersString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *parametersDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"%@", parametersDictionary);
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [manager.requestSerializer setTimeoutInterval:SERVICE_TIMEOUT];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager POST:serviceUrl parameters:parametersDictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.delegate) {
            [self.delegate onServiceSuccess:(NSDictionary *)responseObject];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.delegate) {
            [self.delegate onServiceFailed];
        }
    }];
}


@end
