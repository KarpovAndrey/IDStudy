//
//  CGGeametry+AKCategory.h
//  AKStudy
//
//  Created by Admin on 30.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

CG_INLINE CGRect
CGRectMakeWithSize(CGFloat x, CGFloat y, CGSize size) {
    return CGRectMake(x, y, size.width, size.height);
}

CG_INLINE CGRect
CGRectMakeWithPointAndSize(CGPoint point, CGSize size) {
    return CGRectMake(point.x, point.y, size.width, size.height);
}

CG_INLINE CGRect
CGRectMakeWithOriginWithSize(CGSize size) {
    return CGRectMake(0, 0, size.width, size.height);
}

//SQUARE
CG_INLINE CGRect
CGRectMakeWithPointSquare(CGPoint point, CGFloat sideLength) {
    return CGRectMake(point.x, point.y, sideLength, sideLength);
}

CG_INLINE CGRect
CGRectMakeWithOriginSquare(CGFloat sideLength) {
    return CGRectMake(0, 0, sideLength, sideLength);
}

CG_INLINE CGRect
CGRectMakeSquare(CGFloat x, CGFloat y, CGFloat sideLength) {
    return CGRectMake(x, y, sideLength, sideLength);
}
