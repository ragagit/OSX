//
//  Fractions.h
//  Chap1_8
//
//  Created by Ramses Garcia on 2017-01-16.
//  Copyright © 2017 raga. All rights reserved.
//

#ifndef Fractions_h
#define Fractions_h

@interface Fractions:  NSObject

@property int iNumerator, iDenominator;

-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;
-(void) print;
-(void) setNumerator: (int)n andDenominator: (int)d;
-(void) add: (Fractions*) f;
-(Fractions*)add1: (Fractions*) f;
@end

#endif /* Fractions_h */
