//
//  AKMoneyProtocol.h
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AKMoneyProtocol <NSObject>
@property (nonatomic, assign) NSUInteger money;

@required

- (void)takeMoney:(NSUInteger)money;

@optional

- (NSUInteger)giveMoney;

@end
