#import "Complex.h"

@implementation Complex

	@synthesize real, imaginary;

	-(void) print
	{
		NSLog(@" %g + %gi", real, imaginary);
	}

	-(void) setReal: (double) a andImaginary: (double) b
	{
		real = a;
		imaginary = b;
	}

	-(Complex *) add: (Complex *) f
	{
		Complex *result = [[Complex alloc] init];

		result.real = real + f.real;
		result.imaginary = imaginary + f.imaginary;

		return result;
	}

    // instancetype indicates that the return type from the init method
    // will be od the same class as the type of the object it is initializing
    // that is, the receiver of the init.
    -(instancetype) initNum: (int) iNum andDen: (int) iDen{
        self = [super init];
        
        if(self)
           self = [self init: iNum : iDen];
        real = iNum;
        imaginary = iDen;
        
        
        return self;
    }

    -(void)printmsgA{
        NSLog(@"Message from protocol showmsgA");
    }
    -(void)printmsgB{
        NSLog(@"Message from protocol showmsgB");
    }



@end
