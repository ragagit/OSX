//
//  copy.h
//  Foundation1
//
//  Created by Ramses Garcia on 2017-02-21.
//  Copyright © 2017 raga. All rights reserved.
//

#ifndef copy_h
#define copy_h

@interface Copy : NSObject <NSCopying, NSCoding>

@property NSString *name;

-(void)print;
-(void)setName: (NSString*) theName;
@end
#endif /* copy_h */
