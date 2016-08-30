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

#pragma mark - Private zone

+(instancetype)controller{
    static NSDGitClient * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NSDGitClient alloc] init];
    });
    return instance;
}

-(instancetype)init{
    if(self = [super init]){
        
        self.baseURL = kGithubAPIURL;
        self.token = [[NSUserDefaults standardUserDefaults] objectForKey:NSDGitToken];
        self.username = [[NSUserDefaults standardUserDefaults] objectForKey:NSDGitUsername];
        self.password = [[NSUserDefaults standardUserDefaults] objectForKey:NSDGitPassword];
        
        
        
    }
    return self;
}


#pragma mark - Public zone


#pragma mark - Auth

+(BOOL)isAuthorize{
    return [[self controller] token]!=nil&&[[self controller] username]!=nil&&[[self controller] password]!=nil;
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

+(void)setAccessToken:(NSString *)token{
    
}



@end
