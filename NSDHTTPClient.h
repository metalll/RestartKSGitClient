//
//  NSDHTTPClient.h
//  SmartGitClient
//
//  Created by NullStackDev on 24.08.16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDHTTPClient : NSObject
@property NSString * token;
@property NSURLSession * currentSession;
@property NSString * baseURL;

+(NSString *)processResponceWithResponce:(NSURLResponse *)responce andError:(NSError *)error;
+(void)downloadResourceWithURLString:(NSString *)url andCompletion:(void(^)(NSString * localPath,NSString * errorString)) completion;
+(void)performRequestWithURLPath:(NSString *)urlPath
                       andMethod:(NSString *)method
                       andParams:(NSDictionary *)params
           andAcceptJSONResponse:(BOOL) acceptJSONResponse
               andSendBodyAsJSON:(BOOL)sendBodyAsJSON
                   andCompletion:(void(^)(NSData * data,NSString * errorString))completion;

+(void) performRequestWithURLString:(NSString *)url
                          andMethod:(NSString *)method
                          andParams:(NSDictionary *)params
              andAcceptJSONResponse:(BOOL) acceptJSONResponse
                  andSendBodyAsJSON:(BOOL)sendBodyAsJSON
                      andCompletion:(void(^)(NSData * data,NSString * errorString))completion;

@end
