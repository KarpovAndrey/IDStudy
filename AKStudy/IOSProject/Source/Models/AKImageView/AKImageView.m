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
@property (nonatomic, strong) UIImageView               *customImageView;
@property (nonatomic, strong) UIActivityIndicatorView   *spinner;

@property (nonatomic, readonly, getter=isCached) BOOL cached;

- (void)baseInit;
- (void)load;
- (void)showSpinner;

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

- (void)baseInit {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.customImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:imageView];
    
    CALayer *layer = imageView.layer;
    [layer setBorderColor: [[UIColor grayColor] CGColor]];
    [layer setBorderWidth: 0.5];
    self.customImageView = imageView;

    [self showSpinner];
    self.imageModel = [AKImageModel new];
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(AKImageModel *)imageModel {
    if (_imageModel != imageModel) {
        _imageModel = imageModel;
        
        AKWeakify;
        [_imageModel addHandler:^(UIImage *image){
            AKStrongifyAndReturnIfNil(AKImageView);
            strongSelf.customImageView.image = image;
            [strongSelf.spinner stopAnimating];
        } forState:kAKModelLoadedState
                         object:self];
        
        [_imageModel addHandler:^(UIImage *image){
            AKStrongifyAndReturnIfNil(AKImageView);
            strongSelf.imageModel.URL = strongSelf.URL;
        } forState:kAKModelFailedState
                         object:self];
    }
}

- (void)setURL:(NSURL *)URL {
    if (_URL != URL) {
        _URL = URL;
    }

    [self dump];
    [self load];
}

#pragma mark -
#pragma mark Private

- (void)showSpinner {
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:
                                        UIActivityIndicatorViewStyleWhite];
    UIImageView *imageView = self.customImageView;
    spinner.center = imageView.center;
    [spinner startAnimating];
    [imageView addSubview:spinner];
    
    self.spinner = spinner;
}

- (void)load {
    [self.spinner startAnimating];
    self.imageModel.URL = self.URL;
}

#pragma mark -
#pragma mark Public

- (void)dump {
    self.customImageView.image = nil;
}

@end
