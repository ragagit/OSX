//
//  AddressCard.m
//  Foundation
//
//  Created by Ramses Garcia on 2017-02-11.
//  Copyright © 2017 raga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

@implementation AddressCard
@synthesize name, email;
//{
//    NSString *name;
//    NSString *email;
//}

-(void) setName: (NSString*)theName
{
    name = [NSString stringWithString:theName];
    
}

-(void) setEmail:(NSString*)theEmail
{
    email = [NSString stringWithString:theEmail];
}

-(void)setName:(NSString*)theName andEmail:(NSString*)theEmail{
    self.name = theName; //This way you are calling the setter. If you put only name=theName it is legal but it's just an asignment not copy
    self.email = theEmail;//[self email: theEmail];
}

//-(NSString*)name{
//    return name;
//}
//
//-(NSString*)email{
//    return email;
//}

-(void)print{
    NSLog(@"%s", [name UTF8String]);
    NSLog(@"%s", [email UTF8String]);
}

-(NSComparisonResult)compareNames:(id) element{
    return [name compare: [element name]];
}
@end

@implementation AddressBook

@synthesize book, bookName;

-(NSUInteger)entries{
    return [book count];
}

-(instancetype) initWithName:(NSString *)anyname{
    self = [super init];
    
    if(self){
        //bookName = [NSString stringWithString: anyname];
        self.bookName = anyname;
        book = [NSMutableArray array];
    }
    return self;
}

//Overriding the init method
-(instancetype)init{
    return [ self initWithName:@"NoName"];
}

-(void)addCard:(AddressCard *)card{
    [book addObject:card];
}
-(void)list{
    //NSLog(@"Array content:%@", book);
    //Fast enumeration
    for( AddressCard *theCard in book)
        NSLog(@"%s %s", [theCard.name UTF8String], [theCard.email UTF8String]);
}

-(AddressCard*)lookup:(NSString *)theName{
    for(AddressCard *nextCard in book){
        if( [nextCard.name caseInsensitiveCompare:theName] == NSOrderedSame )
            return nextCard;
        else
            return nil;
    }
    return nil;
}

-(void)removeCard:(AddressCard*)theCard{
    [book removeObjectIdenticalTo:theCard];
}

-(void)sort{
    [book sortUsingSelector:@selector(compareNames:)];
}

@end
