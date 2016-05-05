//
//  AKMacroIOS.h
//  AKStudy
//
//  Created by Admin on 25.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#ifndef AKMacroIOS_h
#define AKMacroIOS_h

#define AKRootViewAndReturnIfNil(theClass)\
            - (theClass *)rootView {\
                if ([self isViewLoaded] && [self.view isKindOfClass:[theClass class]]) {\
                return (theClass *)self.view;\
            }\
        return nil;\
        }

#endif /* AKMacroIOS_h */
