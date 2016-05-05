//
//  AKUserViewController.m
//  AKStudy
//
//  Created by Admin on 04.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKUserViewController.h"
#import "AKUserView.h"
#import "AKUserViewCell.h"

@interface AKUserViewController ()
@property (nonatomic, readonly) AKUserView   *rootView;
@property (nonatomic, retain)   NSArray      *stringsArray;

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
    
    self.stringsArray = [NSString randomStrings];
}

#pragma mark -
#pragma mark UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stringsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifierWithClass:[self class]];
//    
//    cell.textLabel.text = self.stringsArray[indexPath.row];

    AKUserViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AKUserViewCell class])];
    
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([AKUserViewCell class]) bundle:[NSBundle mainBundle]];
        cell = [[nib instantiateWithOwner:[AKUserViewCell class] options:nil] firstObject];
    }
    
    cell.cellLabel.text = self.stringsArray[indexPath.row];
    
    return cell;
}

@end
