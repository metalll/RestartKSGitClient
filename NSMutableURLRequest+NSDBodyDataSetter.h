//
//  NSMutableURLRequest+NSDBodyDataSetter.h
//  SmartGitClient
//
//  Created by NullStackDev on 24.08.16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (NSDBodyDataSetter)

-(void) setBodyData:(NSData *)data isJSONData:(BOOL) isJSONData;

@end
