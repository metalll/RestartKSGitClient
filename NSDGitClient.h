//
//  NSDGitClient.h
//  SmartGitClient
//
//  Created by NullStackDev on 24.08.16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDHTTPClient.h"
@interface NSDGitClient : NSDHTTPClient

@property NSString * username;
@property NSString * password;
#pragma mark - auth methods

+(BOOL)isAuthorize;
+(void)signOut;
+(void)processRequestCode:(NSString *) reqCode andCompletion:(void (^)())completion;
+(void)setAccessToken:(NSString *)token;


#pragma mark - user profile methods;

+(void)userProfileWith:(NSString *)username
               andPage:(NSUInteger *)page
        andCompletion :(void (^)(NSDictionary * adic,NSError * aerr)) completion;

+(void)userReposWith:(NSString *)username
             andPage:(NSUInteger *)page
      andCompletion :(void (^)(NSDictionary * adic,NSError * aerr)) completion;

+(void)userNewsWith:(NSString *)username
     andCompletion :(void (^)(NSDictionary * adic,NSError * aerr)) completion;

+(void)userActivityWith:(NSString *)username
         andCompletion :(void (^)(NSDictionary * adic,NSError * aerr)) completion;

+(void)userFollowersWith:(NSString *)username
                 andPage:(NSUInteger *)page
          andCompletion :(void (^)(NSDictionary * adic,NSError * aerr)) completion;

+(void)userFollowingWith:(NSString *)username
                 andPage:(NSUInteger *)page
          andCompletion :(void (^)(NSDictionary * adic,NSError * aerr)) completion;

+(void)userStarredWith:(NSString *)username
               andPage:(NSUInteger *)page
        andCompletion :(void (^)(NSDictionary * adic,NSError * aerr)) completion;

#pragma mark - repos methods



@end
