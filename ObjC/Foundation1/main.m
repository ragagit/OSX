#include <Foundation/Foundation.h>
#include "copy.h"

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
    
    // Chapter 18 Copying Objects
    // If you have two objects Obj1 and Obj2 Obj1 = Obj2 will point to the same address
    // To copy an object id one by implementing a method in conformance with the <NSCopying>
    // or <NSMutableCopying>
    
    NSMutableArray *arr1 = [NSMutableArray array];
    NSMutableArray *arr2 = [arr1 mutableCopy];
    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:@"one", @"two", nil];
    
    NSLog(@"%@", dataArray);
    
    [arr2 removeObjectAtIndex:1];
    
    //shallow copy even you use mutableCopy changing one element will change the second/
    //to avoid that you need deep copy
    
    //Implementing <NSCopying> protocol or ,NSMutableCopying> 
    //Your class must implement the copyWithZone: method or mutableCopyWithZone and invokes
    //the copy method to make a copy
    
    Copy *mycop = [[Copy alloc] init];
    Copy *mycop1;
    
    mycop1 = [mycop copy];
    
    
    //if your class might be subclassed your copyWithZone: method will be inherited
    
    // Fraction *newFract = [[Fraction allocWithZone: zone] init];
    // id newFract = [[[self class] allocWithZone: zone] init];
    // if you are writing a copyWithZone: method for a class whose superclass also implement
    // the <NSCopying> protocol you should call first the copy of the superclass then include
    // your own code
    
    // Copying Objects in setter and getter methods
    //if you don't synthesize you can implement the copy in the setter
    
    Copy *cop1 = [[Copy alloc] init];
    NSString *str = @"This is my string";
    NSString *str1 = [NSString stringWithString:str];
    
    [cop1 setName:str1];
    [cop1 print];
    
    //Or you can use the copy in the property. This will use your copy or the one you
    //inherited
    //@property (nanotomic, copy) NSString *name;
    
    
    
    
    
    
    
    return 0;
}
