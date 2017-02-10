//
//  Fractions.m
//  Complex
//
//  Created by Ramses Garcia on 2017-01-29.
//  Copyright © 2017 Ramses Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fractions.h"

@implementation Fractions
@synthesize nNum, nDen;

-(instancetype)init:(int)a :(int)b{
    self.nNum = a;
    self.nDen = b;
    
    return  self;
}

-(Fractions*)add:(Fractions *)f{
    Fractions *res = [[Fractions alloc] init];
    res.nNum = res.nNum + f.nNum;
    res.nDen = res.nDen + f.nDen;
    
    return res;
}


@end

//@interface Fractions ()
//+(void) reduce;
//@end
//
//@implementation Fractions ()
//-(void) reduce{
//    NSLog(@"Reduced");
//}
//@end
