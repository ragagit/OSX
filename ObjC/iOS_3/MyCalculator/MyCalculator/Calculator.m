//
//  Calculator.m
//  MyCalculator
//
//  Created by Ramses Garcia on 2017-03-11.
//  Copyright © 2017 raga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

@implementation Calculator

@synthesize operand1, operand2, acumulator;

-(id) init{
    
    self = [super init];
    
    if(self){
        operand1 = [[Fraction alloc]init];
        operand2 = [[Fraction alloc]init];
        acumulator = [[Fraction alloc]init];
    }
    return self;
}

-(void)clear{
    acumulator.numerator =0;
    acumulator.denominator=0;
}

-(Fraction*)performOperation:(char)op{
    Fraction *result;
    
    switch (op) {
        case '+':
            result = [operand1 add: operand2];
            break;
        case '-':
            result = [operand1 subtract: operand2];
            break;
        case '*':
            result = [operand1 multiply: operand2];
            break;
        case '/':
            result = [operand1 devide: operand2];
            break;
            
        default:
            break;
    }
    
    acumulator.numerator = result.numerator;
    acumulator.denominator = result.denominator;
    
    return acumulator;
}
@end
