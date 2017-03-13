//
//  Calculator.h
//  MyCalculator
//
//  Created by Ramses Garcia on 2017-03-11.
//  Copyright © 2017 raga. All rights reserved.
//

#ifndef Calculator_h
#define Calculator_h
#import "Fraction.h"

@interface Calculator : NSObject

@property (strong, nonatomic) Fraction *operand1;
@property (strong, nonatomic) Fraction *operand2;
@property (strong, nonatomic) Fraction *acumulator;

-(Fraction*)performOperation:(char)op;
-(void)clear;

@end

#endif /* Calculator_h */
