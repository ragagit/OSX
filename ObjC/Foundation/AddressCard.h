//
//  AddressCard.h
//  Foundation
//
//  Created by Ramses Garcia on 2017-02-11.
//  Copyright © 2017 raga. All rights reserved.
//

#ifndef AddressCard_h
#define AddressCard_h

@interface AddressCard : NSObject
@property (copy, nonatomic) NSString *name, *email, *bookName;//copy = make a copy of the instance var in the setter method
                                                   //assign just make the assignment
                                                   //nonatomic means you don't need to worry about race condition


-(void)setName: (NSString*) theName;
-(void)setEmail: (NSString*) theEmail;
//-(NSString*) name;
//-(NSString*) email;
-(void)print;
-(void)setName:(NSString*)theName andEmail:(NSString*)theEmail;
-(NSComparisonResult)compareNames:(id) element;

@end

@interface AddressBook : NSObject
@property (nonatomic, strong) NSMutableArray *book; //strong says to make an additional reference to the object whenever the setter method is used
@property (copy, nonatomic) NSString *bookName;//copy = make a copy of the instance var in the setter method
-(instancetype)initWithName:(NSString*)anyname;
-(NSUInteger)entries;
-(void)list;
-(void)addCard:(AddressCard*)card;
-(AddressCard*)lookup:(NSString*)theName;
-(void)removeCard:(AddressCard*)theName;
-(void)sort;
@end
#endif /* AddressCard_h */
