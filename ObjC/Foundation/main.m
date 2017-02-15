//
//  main.m
//  Foundation
//
//  Created by Ramses Garcia on 2017-02-05.
//  Copyright © 2017 Ramses Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Chapter 15 NSNumber
        NSNumber *myNumber, *myNumber2;
        NSInteger myInt;
        
        myNumber = [NSNumber numberWithInt:100];
        myInt = [myNumber integerValue];
        
        NSLog(@"myNumber:%li", myInt);
        
        myNumber = [NSNumber numberWithLong:125577899];
        NSUInteger var;
        var = [myNumber longValue];
        
        myNumber2 = [[ NSNumber alloc] initWithFloat:1.34];
        if( [myNumber compare:myNumber2])
            NSLog(@"Numbers are equal");
        else
            NSLog(@"Not the same");


        if( [myNumber compare:myNumber2] == NSOrderedAscending)
            NSLog(@"Number myNumber is less than second");
        else
            NSLog(@"First number bigger");
        
        NSNumber *someNum;
        someNum = @130;
        
        NSInteger res;
        res = [someNum integerValue];
        
        //Chapter 15 NSString
        NSString *str1 = @"This is string A";
        NSString *str2 = @"This is string B";
        NSString *res1;
        
        NSComparisonResult compareResult;
        
        //NSString is unmutable
        //We can use %@ to print any string, content of an array, dictionaries and sets
        //description is a methd that if it doesn't get overriden it return the name of
        //the class of the object and the memory address
        NSLog(@" string:%@ has length:%lu", str1, [str1 length]); // lenght of a string
        NSLog(@"Description of str object:%@", [str1 description]);
        
        res1 = [NSString stringWithString:str2];
        
        NSLog(@"res1:%@", res1);
        
        res1 = [ str1 stringByAppendingString:str2]; //Appending string
        
        NSLog(@"res1 after appending:%@", res1);
        
        if( [str1 isEqualToString:str2] == YES){    //string comparison
            NSLog(@"Strings are the same");
        }
        else
            NSLog(@"Strings are not the same");
        
        compareResult = [str1 compare:str2];
        
        if( compareResult == NSOrderedAscending )
            NSLog(@"str1 < str2");
        else if( compareResult == NSOrderedSame)
            NSLog(@"str1 == str2");
        else
            NSLog(@"str1 > str2");
        
        res1 = [str1 uppercaseString];
        
        NSLog(@"Upper:%s", [res1 UTF8String]);                   //upper case
        
        res1 = [str2 lowercaseString];                          // lower case
        
        NSLog(@"res1:%@", res1);
        
        res1 = [str1 substringToIndex:3];           //extract first 3 chars
        NSLog(@"res1:%@", res1);
        
        res1 = [str2 substringFromIndex:5];
        NSLog(@"res1:%@", res1);
        
        res1 = [[ str1 substringFromIndex: 3 ] substringToIndex:5]; //string range
        
        res1 = [str2 substringWithRange:NSMakeRange(3, 5)];
        
        NSLog(@"res1:%@", res1);
        
        NSRange subRange;
        
        subRange = [ str1 rangeOfString:@"string A"];
        
        NSLog(@"String is at index %lu lenght is:%lu", subRange.location, subRange.length);
        
        if( subRange.location == NSNotFound)
            NSLog(@"String not found");
        else
            NSLog(@"string is at index %lu", subRange.location);
        
        
        // NSMutableString
        NSString *search, *replace;
        NSMutableString *mstr;
        NSRange substr;
        
        mstr = [NSMutableString stringWithString:str1];
        NSLog(@"%@", mstr);
        
        //Insert characters
        [mstr insertString:@" mutable" atIndex:7];
        NSLog(@"%@", mstr);
        
        //Concatenatiom
        [mstr insertString:@" and string B" atIndex:[mstr length]];
        NSLog(@"%@", mstr);
        
        //Append
        [mstr appendString:@" and string C"];
        NSLog(@"%@", mstr);
        
        //Delete string
        [mstr deleteCharactersInRange:NSMakeRange(16, 13)];
        NSLog(@"%@", mstr);
        
        //Find range and then use it for deletion
        substr = [mstr rangeOfString:@"string B and"];
        
        if( substr.location != NSNotFound){
            [mstr deleteCharactersInRange:substr];
            NSLog(@"%@", mstr);
        }
        
        //Set the muatable string directly
        [mstr setString:@"This is string A"];
        NSLog(@"%@", mstr);
        
        //Replacing characters
        [mstr replaceCharactersInRange:NSMakeRange(8, 8) withString:@"a mutable string"];
        NSLog(@"%@", mstr);
        
        //Search and replace
        search = @"This is";
        replace = @"An example of";
        
        substr = [mstr rangeOfString:search];
        if(substr.location != NSNotFound){
            [mstr replaceCharactersInRange:substr withString:replace];
            NSLog(@"%@", mstr);
        }
        
        //Search and replace all occurrences
        search = @"a";
        replace = @"X";
        
        substr = [mstr rangeOfString:search];
        while( substr.location != NSNotFound){
            [mstr replaceCharactersInRange:substr withString:replace];
            substr = [mstr rangeOfString:search];
        }
        //or
        
        [mstr replaceOccurrencesOfString:search withString:replace options:0 range:NSMakeRange(0, [mstr length])];
        
        //Arrays
        NSArray *months = [NSArray arrayWithObjects:@"January", @"February", nil];
        NSLog(@"%@", months);
        
        for(int i=0; i<2; i++){
            NSLog(@"%i %@", i, [months objectAtIndex:i]);
        }
        //You can also
        NSArray *OtherMonths=@[@"March", @"April", @"May"];
        NSLog(@"%@", OtherMonths);
        
        for(int i=0; i<2; i++){
            NSLog(@"%i %@", i, OtherMonths[i]);
        }

        NSMutableArray *numbers = [NSMutableArray array];//array creates an empty mutable array
                                                         // and can grow as large as you like
        for( int j=0; j<10; j++){
            numbers[j] = @(j);//or
            //[numbers addObject:@(j)];
        }
        
        AddressCard *card1 = [[AddressCard alloc] init];
        AddressCard *card2 = [[AddressCard alloc] init];
        
        [card1 setName:@"John Smith"];
        [card2 setEmail:@"JohnS@server.com"];
        [card2 setName:@"David Bacon"];
        [card2 setEmail:@"davidb@server.com"];
        
        [card1 print];
        [card2 print];
        
        AddressCard *card3 = [[AddressCard alloc] init];
        
        [card3 setName:@"Kevin Wag" andEmail:@"Johnny Depp"];
        [card3 print];
        
        AddressBook *addrbook = [[AddressBook alloc] initWithName:@"My Address Book"];
        
        [addrbook addCard:card1];
        [addrbook addCard:card2];
        [addrbook addCard:card3];
        
        [addrbook list];
        
        NSLog(@"Entries:%li", [addrbook entries]);
        
        //Looking up sometbing in the address book
        AddressCard *person = [addrbook lookup:@"Kevin Wag"];
        if(person != nil)
            NSLog(@"Person found");
        else
            NSLog(@"Person found");
        
        //Removing card
        [addrbook removeCard:card3];
        
        //Sorting Arrays
        [addrbook list];
        [addrbook sort];
        [addrbook list];
        
        //There are case in which you need to store structures or values for this you use NSValue
        //this allows structures into objects, this is often called "wrapping"
        
        CGPoint myPoint;
        NSValue *pointObj;
        NSMutableArray *touchPoints=[NSMutableArray array];
        myPoint.x =100;
        myPoint.y = 200;
        pointObj = [NSValue valueWithPoint:myPoint];
        [touchPoints addObject:pointObj];
        
        // Dictionary Objects
        // it is a collection of data consisting of key-object pairs
        
        NSMutableDictionary *glossary = [NSMutableDictionary dictionary];
        [glossary setObject:@"A class defined so other classes can inherit from it" forKey:@"abstract class"];
        [glossary setObject:@"To implement all the methods defined in a protocol" forKey:@"adopt"];
        
        NSLog(@"abstract class:%@", [glossary objectForKey:@"abstract"]);
        NSLog(@"adopt:%@", glossary[@"adopt"]);
        
        for (NSString *key in glossary) {
            NSLog(@"%@:%@", key, [glossary objectForKey:key]);
        }
        
        //Another way to create immutable dictionary
        
        NSDictionary *dict = @{@"Abstract" : @"Abstract class", @"Adopt" : @"Adopt class" };
        NSArray *keys = [dict allKeys];
        for (NSString *key in keys) {
            NSLog(@"%@:%@", key, [dict objectForKey:key]);
        }
        
        //Set Objects
        //It is collection of unique objects
        NSMutableSet *set1 = [NSMutableSet setWithObjects:@1, @2, @3, nil];
        NSMutableSet *set2 = [NSMutableSet setWithObjects:@10, @20, @30, nil];
        NSMutableSet *set3 = [NSMutableSet setWithObjects:@11, @22, @33, nil];
        
        NSLog(@"set1: ");
        [set1 print];
        NSLog(@"set2: ");
        [set2 print];
        NSLog(@"set3: ");
        [set3 print];
        
        //set is equal to
        if( [set1 isEqualToSet:set2] == YES)
            NSLog(@"set1 equals set2");
        else
            NSLog(@"set1 is not equals set2");
        
        //set contains
        if( [set1 containsObject :@10] == YES)
            NSLog(@"set1 contains 10");
        else
            NSLog(@"set1 does not contain 10");

        //Adding object
        [set1 addObject:@44];
        
        //Removing object
        [set1 removeObject:@10];
        
        NSLog(@"set1 after adding 4 and removing 10");
        [set1 print];
        
        //Intersection
        [set1 intersectSet:set2];
        [set1 print];
        
        //Union
        [set1 unionSet:set3];
        [set1 print];
        
        //NSCountedSet can havd repeated objects, it just keep a count on each one
        
        //NSindexSet is used to store ordered indexes into some other data structure
        
        
        //File management
        //All starts with
        NSFileManager *fm;
        fm = [NSFileManager defaultManager];
        
        //Remove file
        if( [ fm removeItemAtPath:@"todolist" error:NULL] == NO)
            NSLog(@"Couldn't remove file todolidt");
        
        NSString *fName=@"/Users/raga/Documents/afile.txt";
        NSString *fName1=@"/Users/raga/Documents/afilecopied.txt";
        NSDictionary *attr;
        
        if( [fm fileExistsAtPath:fName] == YES)
            NSLog(@"File exists");
        else
            NSLog((@"File doesn't exist"));
        
        //Copy file
        if( [fm copyItemAtPath:fName toPath:fName1 error:NULL] == NO)
            NSLog(@"Copy failed");
        
        //Check if those files are equal
        if( [fm contentsEqualAtPath:fName andPath:fName1] == YES)
            NSLog(@"Files are equal");
        else
            NSLog(@"Files are not equal");
        
        //Rename the copy
        if( [fm moveItemAtPath:fName1 toPath:@"/Users/raga/Documents/afilecopied.txt" error:NULL] == YES)
            NSLog(@"File could be renamed");
        else
            NSLog(@"Files could not be renamed");
        
        //Getting file properties
        if( (attr = [fm attributesOfItemAtPath:fName1 error:NULL]) == nil)
            NSLog(@"Couldn't get file attributes!");
        
        NSLog(@"File size: %llu bytes", [[attr objectForKey:NSFileSize] unsignedLongLongValue]);
        
        //Deleting a file
        if( [fm removeItemAtPath:fName error:NULL] == NO)
            NSLog(@"File removal failed");
        
        //Display the content of a file
        NSLog(@"%@", [NSString stringWithContentsOfFile:fName1 encoding:NSUTF8StringEncoding error:NULL]);
        
        //NSData
        //It reads data and stores in a buffer
        NSData *fileData;
        fileData = [fm contentsAtPath:fName1];
        
        if(fileData == nil)
            NSLog(@"File read failed");
        
        //Writes data to a file
        if( [fm createFileAtPath:fName contents:fileData attributes:nil]==NO)
            NSLog(@"Couldn't create the copy");
        else
            NSLog(@"File copy successful!");
        
        
        //Working with Directories
        NSString *dirName = @"myDir";
        NSString *path;
        
        path = [fm currentDirectoryPath];
        NSLog(@"Current directory path:%@", path);
        
        //Creating a directory
        if([ fm createDirectoryAtPath:dirName withIntermediateDirectories:YES attributes:nil error:NULL] == NO)
            NSLog(@"Unable to craete directory");
        
        //Rename directory
        if([fm moveItemAtPath:dirName toPath:@"newDir" error:NULL] == NO)
            NSLog(@"Dir renamed failed");
        
        
        //Changing directory
        if([fm changeCurrentDirectoryPath:@"newDir"] == NO)
            NSLog(@"Change directory failed");
            
        path = [fm currentDirectoryPath];
        NSLog(@"Current directory path:%@", path);

        // enumaratorAtPath: enumarates dir content and the contect of any dir inside
        // contentsOfDircetoryAtPath: only files and dirs not dirs content
        
        NSDirectoryEnumerator *dirEnum;
        NSArray *dirArray;
        
        //if([fm changeCurrentDirectoryPath:@"/Users/raga/Documents"] == NO)
        //    NSLog(@"Change directory failed");
        
        dirEnum = [fm enumeratorAtPath:path];
        BOOL flag;
        while((path = [dirEnum nextObject]) != nil){
            [fm fileExistsAtPath:path isDirectory:&flag];
            if(flag == YES)
                [dirEnum skipDescendants];
              NSLog(@"%@", path);
        }
        
        dirArray = [fm contentsOfDirectoryAtPath:[fm currentDirectoryPath] error:NULL];
        
        for(path in dirArray)
            NSLog(@"%@", path);
        
        
        //Working with paths
        
        //Get temporary working directory
        NSString *tempdir = NSTemporaryDirectory();
        NSString *fullpath;
        NSLog(@"Temp directory is %@", tempdir);
        
        //Base dir
        NSLog(@"Base dir is %@", [path lastPathComponent]);
        
        fullpath = [path stringByAppendingString: @"myfile.txt"];
        
        //File extension
        NSString *ext = [fullpath pathExtension];
        NSLog(@"Extension is:%@", ext);
        
        //Home directory
        NSString *homedir = NSHomeDirectory(); //or NSHomeDirectoryForUSer
        NSLog(@"Home dir:%@", homedir);
        
        //Devide path into components
        NSArray *components = [homedir pathComponents];
        
        for( path in components)
            NSLog(@"%@", path);
        
        
        
    }
    return 0;
}
