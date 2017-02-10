#import <Foundation/Foundation.h>
#import "Fractions.h"
#import "showmsg.h"

@interface Complex: Fractions <showmsgA, showmsgB>

	@property double real, imaginary;

	-(void) print;
	-(void) setReal: (double) a andImaginary: (double) b;
	-(Complex *) add: (Complex *) f;
    -(instancetype) initNum: (int) iNum andDen: (int) iDen;

@end


