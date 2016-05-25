//
//  AKImageModel.h
//  AKStudy
//
//  Created by Admin on 25.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKModel.h"

@interface AKImageModel : AKModel
@property (nonatomic, readonly)       NSURL   *url;
@property (nonatomic, readonly)       UIImage *image;

+ (instancetype)imageWithUrl:(NSURL *)url;

- (instancetype)initWithUrl:(NSURL *)url;

- (void)load;
- (void)dump;
- (void)cancel;

@end
