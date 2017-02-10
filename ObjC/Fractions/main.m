//
//  main.m
//  Chap1_8
//
//  Created by Ramses Garcia on 2017-01-16.
//  Copyright © 2017 raga. All rights reserved.
//

// clang -fobjc-arc files -o program

#import <Foundation/Foundation.h>
#import "Fractions.h"

/*
 @interface Fractions:  NSObject
 
 -(void) setNumerator: (int) n;
 -(void) setDenominator: (int) d;
 -(void) print;
 
 @end
 */

@implementation Fractions

@synthesize iNumerator, iDenominator;
/*
 {
 int iNumerator;
 int iDenominator;
 
 }*/

-(void)setNumerator:(int) n
{
    iNumerator = n;
}

-(void)setDenominator:(int)d
{
    iDenominator = d;
}

-(void)print
{
    NSLog(@"Result:%i/%i", iNumerator, iDenominator);
}

-(void)setNumerator: (int)n  andDenominator: (int)d
{
    iNumerator = n;
    iDenominator = d;
}

-(void) add: (Fractions*) f
{
    iNumerator = iNumerator + f.iNumerator;
    iDenominator = iDenominator + f.iDenominator;
}

-(Fractions*)add1: (Fractions *)f
{
    Fractions* res = [[Fractions alloc] init];
    [res setNumerator:6 andDenominator:9];
    res.iNumerator = iNumerator + f.iNumerator;
    res.iDenominator = iDenominator + f.iDenominator;
    return res;
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //Chapter 2
        NSLog(@"Programming is fun");
        NSLog(@"Programming in Objective-C is even more");
        int  sum;
        sum = 50 + 70;
        NSLog(@"Sum=%i\nEnd", sum);
        
        //Chapter 3
        //Objects
        /*
         [ClassOrInsatnce method]
         [receiver message : value]
         - instance method
         + class method
         */
        
        Fractions  *pFracs = [[Fractions alloc] init];
        
        [pFracs setNumerator:5];
        [pFracs setDenominator:7];
        
        [pFracs print];
        
        
        //Chapters 4
        //DataTypes and Expressions
        //int, float, char, double, lon, long long, short ,
        //unsigned,unsigned
        //id is used to store an object of any type
        //+, -, *, /, %, -=, +=
        
        /*
         Chapter 5 Program Looping
         
         #import <Foundation/Foundation.h>
         
         int main (int argc, char * argv[]) {
         @autoreleasepool {
         int n, number, triangularNumber, counter;
         
         for ( counter = 1; counter <= 5; ++counter ) {
         NSLog (@"What triangular number do you want?");
         scanf ("%i", &number);          triangularNumber = 0;
         for ( n = 1; n <= number; ++n )             triangularNumber += n;
         NSLog (@"Triangular number %i is %i", number, triangularNumber);
         }
         }
         
         return 0;
         }
         
         For, do while, break,
         
         */
        
        /*
         Chapter 6 Conditional
         If-else
         switch( exp )
         ? :
         
         */
        
        //Chapter 7
        // instance.property
        // instance.property = value
        // if you declare @property at the interface you dont need to declare variables in implementation byt complier
        // will create variables with _ unless you use @sythetize
        // self is like this in C++
        pFracs.iDenominator = 7;
        pFracs.iNumerator =3;
        
        [pFracs setNumerator:3 andDenominator:7];
        
        [pFracs print];
        
        Fractions *bFracs = [[Fractions alloc] init];
        [bFracs setNumerator:3 andDenominator:2];
        
        [pFracs add: bFracs];
        
        [pFracs print];
        
        //self = this
        //[self reduce]
        
        Fractions* pTmp = [pFracs add1: bFracs];
        [pTmp print];
        
        //Chapter8
        //Inheritance
        // @iterface ClassA: Class B
        // Abstract class
        // Variables declared in implementation are private
        // Variables declared in the interface can be passed on to the subclass
        // use self to access accessor of the base class as well to call methods
        // You can overide a method in the subclass same name, rturned type and number of arguments
        
        //@end
        
        //Dpending on the variablr is the mryhod that gets called
        
    }
}


