//
//  main.m
//  Complex
//
//  Created by Ramses Garcia on 2017-01-26.
//  Copyright © 2017 Ramses Garcia. All rights reserved.
//


#import "Complex.h"

int main(int argc, char* argv[])
{
    
    // *** Chapter 9 ***
    // Polymorfism - Different classes can have the same methods names
    // Dynamic typing - Ddetrmines the object's class at run time
    // Dynamic binding - Determines the method to call at run time
    
    Complex* Result;
    
    Complex* c1 = [[Complex alloc] init];
    Complex* c2 = [[Complex alloc] init];
    
    [c1 setReal: 18.0 andImaginary: 2.5];
    [c2 setReal:-5.0 andImaginary: 3.2 ];
    
    [c1 print];
    
    Result = [c1 add: c2];
    [Result print];
    
    //Dynamic binding it can take any object
    //Although this is valid it is not a good practice
    //as there is no checking till run time and the method
    //might nit exists
    //static typing is prefered
    id dataValue;
    dataValue = c1;
    [dataValue print];
    
    //Class of
    if( [c1 class] == [c2 class]){
        NSLog(@"Same class");
    }
    
    [c1 isMemberOfClass:[Complex class]];
    
    SEL sVar = @selector(alloc);
    
    [Complex instancesRespondToSelector:@selector(alloc)];
    [Complex instancesRespondToSelector:sVar];
    
    if( [c1 respondsToSelector:@selector(print)] == YES ){
        NSLog(@"Responds to print");
        [c1 performSelector:@selector(print)];
    }
    else{
        NSLog(@"Object doesn't respond to print");
    }
    
    if( [c1 isKindOfClass:[Complex class]] == YES ){
        NSLog(@"Responds to print");
        [c1 performSelector:@selector(print)];
    }
    else{
        NSLog(@"Object doesn't respond to print");
    }
    
    @try{
        [c1 print];
    }
    @catch(NSException *e){
        NSLog(@"Exception:%@ %@ ", e.name, e.reason);
        
        //we can use @throw
    }
    @finally{
        NSLog(@"Finally has been called");
    }
    
    // ** Chapter 10 **
    //instancetype
    Complex *c = [[Complex alloc] init: 2 : 3];
    
    [c print];
    
    // moule is define a set of related files
    // you can declare a global vairaible and refernce it with
    // extern int gVariaible
    
    // class methis can't access intance methods, but there are cases
    // in which you need to access variables in this case you could use
    // static in gCounter which is accessible only in the file where it is declared
    // and to the class
    
    //enum
    //typedef
    //casting
    
    enum months { January = 1, February, March };
    
    enum months var = March;
    NSLog(@"The month is:%i", var);
    
    typedef enum months Months;
    
    Months var2 = February;
    
    NSLog(@"The month is:%i", var2);
    
    float var3 = 34.7;
    int var4 = 8;
    int res;
    res = (int)var3/var4;
    
    //Bitwise operation & | ~ >> << 
    
    // Chapter 11 Categories
    // Categories is a way to extend a class without inheritance
    // @interface Fractions (MathOps)
    // ..
    // @end
    
    // Class extension
    // It is an unamed category and can extend the class by adding additional instance variables
    // and proepties. They are implemnted in the main implementation section and not in a separate
    // implementation section. They are considered private in the sense that they are not adverized
    // in the interface.
    
    
    // protocol is a liost of methods that are meant to be implememted by somebody else.
    // If all the methis are implemented the class conform or adopt that protocol
    
    // Does the object conform to protocol?
    if( [c1 conformsToProtocol:@protocol(showmsgA)]){
        NSLog(@"Object conforms to protocol showmsgA");
    }
    if( [c1 respondsToSelector:@selector(printmsgA)]){
        NSLog(@"Object responds to printmsgA");
    }
    
    //Fractions* fr = [[Fractions alloc] init];
    //[fr print];
    //id <showmsgA> fr;
    
    // A category can adopt a protocol
    // @interface Fractions (MathOp) <showmsgA>
    // A protocol can adopt another protocol
    // @protocol someprotocol <showmsgA>
    
    // if you don't want to advertise that your class conforms to a protocol
    // in you .h file you can list it as part of the category
    // @interface ProfilePreview()
    // <NavigationBar>
    // @end
    
    //Delegation. The class that defines the protocol van be thought as delegation
    //Informal protocols are categories that don't implement the methods
    //@optional is intended to replace informal protocols
    
    //Composite Objects One more way to extend a class in addition to inheritance and categories
    //the class includes objects from other classes
    
    // Chapter 12
    // #define #import #ifdef #endif #undef
    
    // Chapter 13 C Langugae review
    // Arrays, two dimensional arrays, functions, blocks, structures and pointers
    
    return 0;
}
