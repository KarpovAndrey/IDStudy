//
//  AKUserViewController.m
//  AKStudy
//
//  Created by Admin on 04.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKUserViewController.h"
#import "AKUserView.h"
#import "NSString+AKExtensions.h"

static const NSUInteger kAKDefaultStringCount = 10;

@interface AKUserViewController ()
@property (nonatomic, readonly) AKUserView   *rootView;
@property (nonatomic, retain)   NSArray      *stringsArray;

- (NSArray *)randomStringsWithCount:(NSUInteger)count;

@end

@implementation AKUserViewController

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKUserView);

#pragma mark -
#pragma mark LifeCycle

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self.rootView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RandomString"];
    
    self.stringsArray = [NSArray arrayWithObject:[self randomStringsWithCount:kAKDefaultStringCount]];
}

#pragma mark -
#pragma mark UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stringsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifire = @"RandomString";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifire];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifire];
    }
    
    UILabel *cellTextLabel = cell.textLabel;
    cellTextLabel.text = [self.stringsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = self.stringsArray[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark Private

- (NSArray *)randomStringsWithCount:(NSUInteger)count {
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    for (NSUInteger index = 0; index < count; index++) {
        [mutableArray addObject:[NSString randomString]];
    }
    
    return [mutableArray copy];
}

@end
