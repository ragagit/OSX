//
//  Fractions+MathOps.m
//  Complex
//
//  Created by Ramses Garcia on 2017-01-30.
//  Copyright © 2017 Ramses Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fractions+MathOps.h"

//Chapter 11 Categories
@implementation Fractions (MathOps)

-(Fractions*) mul: (Fractions *)f{
    Fractions* res = [[Fractions alloc] init : 3: 4];
    
    res.nNum = self.nNum * f.nNum;
    res.nDen = self.nDen * f.nDen;
    
    return res;
    
}

@end
