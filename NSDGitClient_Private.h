//
//  NSDGitClient_Private.h
//  SmartGitClient
//
//  Created by NullStackDev on 24.08.16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDGitClient.h"

@interface NSDGitClient ()



+(instancetype) controller;

+(void)processJSONData:(NSData *)JSONData andErrorString:(NSString *)errorString andCompletion:(void(^)(NSDictionary * responceDic,NSString * errorString))completion;

+(NSString *)URLStringWithPathComponent:(NSString *)pathComponent;

+(void)searchForPath:(NSString *)path andQueryString:(NSString *)query andCompletion:(void(^)(NSDictionary * responceDic,NSString * errorString))completion;


@end
