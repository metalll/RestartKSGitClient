//
//  NSDGitClient.h
//  SmartGitClient
//
//  Created by NullStackDev on 24.08.16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDHTTPClient.h"
@interface NSDGitClient : NSDHTTPClient{
    @private NSString * username;
    @private NSString * password;
}

+(BOOL)isAuthorize;

+(void)signOut;




@end
