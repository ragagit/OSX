//
//  Fraction.h
//  MyCalculator
//
//  Created by Ramses Garcia on 2017-03-11.
//  Copyright © 2017 raga. All rights reserved.
//

#ifndef Fraction_h
#define Fraction_h

#import <UIKit/UIKit.h>

@interface Fraction : NSObject

@property int numerator, denominator;

-(void) print;
-(void) setTo:(int) n over:(int)d;
-(Fraction*) add:(Fraction*)f;
-(Fraction*) subtract:(Fraction*)f;
-(Fraction*) multiply:(Fraction*)f;
-(Fraction*) devide:(Fraction*)f;

-(void) reduce;
-(double) convertToNum;
-(NSString*) convertToString;

@end

#endif /* Fraction_h */
