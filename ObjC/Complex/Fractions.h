//
//  Fractions.h
//  Complex
//
//  Created by Ramses Garcia on 2017-01-29.
//  Copyright © 2017 Ramses Garcia. All rights reserved.
//

#ifndef Fractions_h
#define Fractions_h

@interface Fractions : NSObject
@property int nNum, nDen;

    -(instancetype)init: (int) nNum : (int) nDen;
    -(Fractions*)add: (Fractions*) f;

@end

#endif /* Fractions_h */
