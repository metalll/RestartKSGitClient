//
//  NSMutableURLRequest+NSDBodyDataSetter.m
//  SmartGitClient
//
//  Created by NullStackDev on 24.08.16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSMutableURLRequest+NSDBodyDataSetter.h"


@implementation NSMutableURLRequest (NSDBodyDataSetter)

#pragma mark - Private Zone



#pragma mark - Public Zone

-(void)setBodyData:(NSData *)data isJSONData:(BOOL)isJSONData{
    self.HTTPBody = data;
    
    if(isJSONData) return;
    
    [self setValue: [NSString stringWithFormat:@"%lu",(unsigned long)data.length] forHTTPHeaderField:@"Content-Length"];
    [self setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"application/x-www-form-urlencoded; charset=utf-8"];
}

@end
