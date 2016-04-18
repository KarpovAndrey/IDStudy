//
//  AKMacroObjC.h
//  AKStudy
//
//  Created by Admin on 18.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#ifndef AKMacroObjC_h
#define AKMacroObjC_h

#define AKWeakify\
            __weak id weakSelf = self;

#define AKStrongifyAndReturnIfNil\
            __strong id strongSelf = weakSelf;\
            if (!strongSelf) {\
                return;\
            }


#endif /* AKMacroObjC_h */
