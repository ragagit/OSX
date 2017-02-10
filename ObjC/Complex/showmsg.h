//
//  showmsg.h
//  Complex
//
//  Created by Ramses Garcia on 2017-01-31.
//  Copyright © 2017 Ramses Garcia. All rights reserved.
//

#ifndef showmsg_h
#define showmsg_h

@protocol showmsgA

@required
-(void)printmsgA;

@optional
-(void)printOptMsgA;

@end

@protocol showmsgB

-(void)printmsgB;

@end
#endif /* showmsg_h */
