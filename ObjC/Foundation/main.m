//
//  main.m
//  Foundation
//
//  Created by Ramses Garcia on 2017-02-05.
//  Copyright © 2017 Ramses Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

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
        //description is a methid that if it doesn't get overriden it return the name of
        //the class of the object and the meemory address
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
	//
        
        
        
    }
    return 0;
}
