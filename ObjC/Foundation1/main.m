#include <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
	@autoreleasepool{

	}
    
    //Automatic Reference Counting
    //As of XCode 4.2 programmers no longer have to think about memory management
    //The memory models are:
    // 1. Automatic garbage collection
    // Objective C 2.0 supports it but iOS runtime env doesn't, as of OSX 10.8 is deprecated
    // 2. Manual refernce counting and Auto-release pool
    // When an object is created, its initial count is set to 1. Every time you need to
    // ensure that the object be kept around you increment its reference by 1 this is done
    // [myFraction retain];
    // When you don't need it
    // [myFraction release];
    // when it reaches 0 systems know is no longer needed and sends a dealloc message
    // fucntions like addObject ot removeObjectAtIndex increment and release
    //'dangling pointer' is when you make a reference to a pointer that has been released
    //'over releasing an object'
    // If you have a function that returns a pointer, the function can't release it immediateley
    // the autoreleasepool takes care of that, it drains the pool. To add an object to the list
    // of objects you do
    // [result autorelease]
    // Mot all newly created objects are added to the autorelease pool, those created with
    // alloc, copy, mutableCopy or new, you are said to ownthe object. You are responsible to
    // release the object
    // [ frac1 release]
    // Fraction *result = [[Fraction alloc] init] autorelease]; or
    // return [result autorelease]
    // Cocoa and iOS apps run inisde what is called a run or event loop. To process an event
    // the system creates a new autorelease pool, when the event is over the pools gets drained
    // all object will be release unless you retain it
    // @property( nonatomic, retain )
    // To ensure the array's survival at the end of the event loops
    // data = [[ NSMutableArray array] retain];
    // data = [[NSMutableArray alloc] init
    // self.data = [ NSMutableArray array];
    // By default all object pointer variables are strong variables, this means assigning an
    // object reference to such a variable causes that object to be retained. Further the old
    // object reference will be release before the assignment is made.
    // Fraction* f1 ....
    // Fraction* f2 ....
    // f2= f2 f2 reference would be lost you don't need to declare strong except on property
    // @property (strong, nonatomic) NSMutableArray *birds;
    // 'Weak Variables' is when there is relationship between objects for exaple parent view
    // and child view. If one of them is released will cause problems on the other 'retain'
    // cycle
    // __weak UIView *parentView
    // @property (weak, nonatomic)
    // if your program generates a lot of temporary objects you may want to create multiple
    // autoreleasepools
    return 0;
}
