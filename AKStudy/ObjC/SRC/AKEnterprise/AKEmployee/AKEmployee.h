//
//  AKEmployee.h
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKMoneyProtocol.h"
#import "AKWorkerProtocol.h"

@interface AKEmployee : NSObject <AKMoneyProtocol, AKWorkerProtocol>
@property (nonatomic, assign) id <AKWorkerProtocol> delegate;

- (void)performWorkWithObject:(id)object;

@end
