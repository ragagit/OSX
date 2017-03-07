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
    // Not all newly created objects are added to the autorelease pool, those created with
    // alloc, copy, mutableCopy or new, you are said to own the object. You are responsible to
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
    // data = [[NSMutableArray alloc] init]
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
    NSLog(@"%@", arr2);
    
    [dataArray removeObjectAtIndex:1];
    
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
    
    // Chapter 19 Archiving
    //Archiving with XML propertiey lists
    //MAc OSX applications use XML property lists (plists) for sorting things such as your
    //default preferences, application settings and configuration
    //NSString, NSDictionary, NSArray, NSDate, NSNumber you can use writeToFile:atomically
    
    NSDictionary *glossary = @{ @"abstract class":@"A class defined",
                                @"adopt":@"To implement all methids",
                                @"archiving":@"storing an object"};
    
    if( [glossary writeToFile:@"glossary" atomically:YES] == NO)
        NSLog(@"Save to file failed!");
    
    //For reading you use dictionaryWithContentsOfFile: arrayWithContentsOfFile:
    // dataWithContentsOfFile, stringWithContentsOfFile:
    
    NSDictionary *gloss = [NSDictionary dictionaryWithContentsOfFile:@"glossary"];
    
    for( NSString *key in gloss)
        NSLog(@"%@: %@", key, gloss[key]);
    
    //There are deafult encoder/decoder for basic types
    // encodeBool:forKey:   decodeBool:forKey
    // encodeInt:forKey:    decodeInt:forKey
    // encodeDouble:forKey: decodeDouble:forKey
                                
    //Archiving with NSKeyedArchiver
    //It enables you to save any type of objects, this is done by creating keyed archive
    //before sequential archive was created with NSArchiver class. Sequential archives
    //requires that the data be read back in precisely the same order in which was written
    //when you archuve an objectyou give a key
    [NSKeyedArchiver archiveRootObject:glossary toFile:@"glossary.archive"];
    
    NSDictionary *gloss1 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"glossary.archive"];
    
    for(NSString *key in glossary)
        NSLog(@"%@: %@", key, gloss1[key]);
    
    //Wrtiting Encoding and Decoding Methods
    //To archive your own class you need to specify encode and decode encodeWithCoder:
    //and initWithDecoder according to <NSCoding>
    
    Copy *myObj = [[Copy alloc] init];
    myObj.name = @"myname";
    if([NSKeyedArchiver archiveRootObject:myObj toFile:@"copy.archive"] == NO){
        NSLog(@"Archiving failed");
    }
    
    Copy *mystr = [NSKeyedUnarchiver unarchiveObjectWithFile:@"copy.archive"];
    NSLog(@"my string is:%@", mystr.name);
    
    //Using NSData to create custom archives
    //The next statement creates a mutable data area (buffer)
    // buffer = [NSMutableData data];
    
    NSMutableData *dataArea = [NSMutableData data];
    
    
    @try {
        NSArchiver *arch = [[NSArchiver alloc] initForWritingWithMutableData:dataArea];
        
        [arch encodeObject:mystr forKey:@"mybook"];

        if([dataArea writeToFile:@"myarchive" atomically:YES] == NO){
            NSLog(@"Archiving failed");
        }

    } @catch (NSException *exception) {
        NSLog(@"reason:%@", exception.reason);
    } @finally {
        NSLog(@"Archiving failed");
    }
    
    //Deep copy of objects (using memory)
    NSData *data;
    NSMutableArray *dArray=[NSMutableArray arrayWithObjects:
                               [NSMutableString stringWithString:@"one"],
                               [NSMutableString stringWithString:@"two"],
                               [NSMutableString stringWithString:@"three"],nil];
    
    NSMutableArray *dArray2;
    NSMutableString *mStr;
    
    data = [NSKeyedArchiver archivedDataWithRootObject:dArray];
    
    dArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    mStr = dArray2[0];
    
    [mStr appendString:@"ONE"];
    
    NSLog(@"%@", mStr);
    
    
    return 0;
}
