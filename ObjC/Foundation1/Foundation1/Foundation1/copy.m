//
//  copy.m
//  Foundation1
//
//  Created by Ramses Garcia on 2017-02-21.
//  Copyright © 2017 raga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "copy.h"

@implementation Copy

-(void)print{
    NSLog(@"Hello Copy");
}

-(id) copyWithZone:(NSZone *)zone{
    NSString *newStr = [[NSString allocWithZone:zone] init];
    return newStr;
}

@end
