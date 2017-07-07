//
//  ObjCClassForServerCommunication.h
//  ObjCDelegate
//
//  Created by Rushikesh Kulkarni on 07/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
//#import <AWSS3/AWSS3.h>
//#import <AWSCore/AWSCore.h>

@protocol ClassForServerCommDelegate <NSObject>

@optional
//Methods
- (void)onServiceFailed;
- (void)onServiceSuccess:(NSDictionary *)responseDictionary;

@end


@interface ObjCClassForServerCommunication : NSObject


@property (nonatomic, assign) id<ClassForServerCommDelegate> delegate;

- (void)sendHttpGetRequestWithParam:(NSString *)parametersString andServiceName:(NSString *)serviceName;
- (void)sendHttpPostRequestWithParam:(NSString *)parametersString andServiceName:(NSString *)serviceName;
@end
