//
//  AKStateModel.h
//  AKStudy
//
//  Created by Admin on 16.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AKObjectState) {
    kAKObjectAddedState,
    kAKObjectRemovedState,
};

@interface AKStateModel : NSObject
@property (nonatomic, assign) AKObjectState    state;
@property (nonatomic, assign) NSUInteger       index;

@end
