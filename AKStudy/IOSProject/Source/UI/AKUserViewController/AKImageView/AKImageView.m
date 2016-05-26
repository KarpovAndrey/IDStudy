//
//  AKImageView.m
//  AKStudy
//
//  Created by Admin on 26.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKImageView.h"
#import "AKImageModel.h"

@interface AKImageView ()
@property (nonatomic, strong) UIImageView               *imageView;
@property (nonatomic, strong) UIActivityIndicatorView   *activityIndicator;

- (void)baseInit;
- (void)load;
- (void)showActivityIndicatorAnimation;

@end

@implementation AKImageView

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self baseInit];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUrl:(NSString *)url {
    if (_url != url) {
        _url = url;
    }
    
    self.model = [AKImageModel imageWithURL:url];
    self.imageView.image = nil;
    
    AKWeakify;
    [_model addHandler:^(UIImage *image){
        AKStrongifyAndReturnIfNil(AKImageView);
        strongSelf.imageView.image = image;
        [strongSelf.activityIndicator stopAnimating];
    } forState:kAKModelLoadedState
                object:self];
    
    [self load];
}

#pragma mark -
#pragma mark Private

- (void)baseInit {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.frame];
    self.imageView.backgroundColor = [UIColor clearColor];
    [self addSubview:imageView];
    
    CALayer *layer = imageView.layer;
    [layer setBorderColor: [[UIColor grayColor] CGColor]];
    [layer setBorderWidth: 0.5];
    
    self.imageView = imageView;
}

- (void)load {
    [self showActivityIndicatorAnimation];
    [self.model load];
}

- (void)showActivityIndicatorAnimation {
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.color = [UIColor whiteColor];
    activityIndicator.hidesWhenStopped = YES;
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    activityIndicator.center = self.imageView.center;
    [activityIndicator startAnimating];
    
    UIImageView *imageView = self.imageView;
    [imageView addSubview:activityIndicator];
    
    self.activityIndicator = activityIndicator;
}

@end
