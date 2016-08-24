//
//  NSDictionary+NSDStringEncoder.m
//  SmartGitClient
//
//  Created by NullStackDev on 24.08.16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDictionary+NSDStringEncoder.h"

@implementation NSDictionary (NSDStringEncoder)

#pragma mark - Private Zone

#pragma mark - Public Zone

-(NSString *)encodedStringWithHttpBody{
    NSMutableArray * retVal = [NSMutableArray new];
    
    for(NSString * key in self.allKeys){
        NSString * tempKey = [key stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
        NSString * tempVal = [[self valueForKey:key] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
        
        [retVal addObject:[[(NSString *)tempKey stringByAppendingString: @"="]stringByAppendingString:(NSString *)tempVal]];
    }
    return [retVal componentsJoinedByString:@"&"];
}

@end
