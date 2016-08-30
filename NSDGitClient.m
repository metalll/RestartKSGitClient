//
//  NSDGitClient.m
//  SmartGitClient
//
//  Created by NullStackDev on 24.08.16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDGitClient.h"
#import "NSDGitClient_Private.h"
#import "NSDGitConstants.h"
@implementation NSDGitClient 


+(BOOL)isAuthorize{
    return [[self controller] token]!=nil;
}

+(void)signOut{
    NSDGitClient * __weak temp = [self controller];
    temp.token = nil;
    temp.username = nil;
    temp.password = nil;
    [NSUserDefaults resetStandardUserDefaults];
}

+(void)processRequestCode:(NSString *)reqCode andCompletion:(void (^)())completion{
    if(!reqCode) @throw [NSException exceptionWithName:@"req code equals nil" reason:nil userInfo:nil];
    
    NSMutableDictionary * reqParams = [NSMutableDictionary new];
    [reqParams setObject:kGithubID forKey:@"client_id"];
    [reqParams setObject:kGithubSecret forKey:@"client_secret"];
    [reqParams setObject:reqCode forKey:@"code"];
    
    [self performRequestWithURLString:kGithubAccessTokenURLString andMethod:@"POST" andParams:reqParams andAcceptJSONResponse:YES andSendBodyAsJSON:YES andCompletion:^(NSData *data, NSString *errorString) {
        
        NSError * JSONErr = nil;
        if(errorString){
            NSLog(@"Network Error : NSDGitClient : processReqCode : %@",errorString);
            return ;
        }
        
        NSMutableDictionary * responceDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONErr];
        
        if(JSONErr){
             NSLog(@"JSON Error : NSDGitClient : processReqCode : %@",JSONErr.localizedDescription);
            return;
        }
        
        [[self controller] setToken:[responceDic objectForKey:@"access_token"]];
        [[NSUserDefaults standardUserDefaults] setObject:[[self controller] token] forKey:NSDGitToken];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           [self setAccessToken:[[self controller] token]];
            if(completion) completion();
            return ;
        });
        
        return;
        
    }];
    
}

@end
