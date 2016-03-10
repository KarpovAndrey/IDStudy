//
//  AKEmployee.h
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKMoneyProtocol.h"

@interface AKEmployee : NSObject <AKMoneyProtocol>
@property (nonatomic, assign) NSUInteger money;

@end
