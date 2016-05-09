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
#import "AKArrayModel.h"

@interface AKUserViewController ()
@property (nonatomic, readonly) AKUserView   *rootView;

@end

@implementation AKUserViewController

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKUserView);

#pragma mark -
#pragma mark LifeCycle

- (void)loadView {
    [super loadView];
    
    self.rootView.tableView.editing = YES;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.editing = YES;
    
    [self.rootView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RandomString"];
}

#pragma mark -
#pragma mark UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AKUserViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AKUserViewCell class])];
    
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([AKUserViewCell class]) bundle:[NSBundle mainBundle]];
        cell = [[nib instantiateWithOwner:[AKUserViewCell class] options:nil] firstObject];
    }
    
    [cell fillWithModel:self.arrayModel[indexPath.row]];
        
    return cell;
}

//Removing cell with swipe
- (void)        tableView:(UITableView *)tableView
       commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayModel removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (NSString *)                              tableView:(UITableView *)tableView
    titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"REMOVE CELL";
}

//Moving cells
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath;
{
    [self.arrayModel exchangeObjectAtIndex:sourceIndexPath.row
                                      withObjectAtIndex:destinationIndexPath.row];
}

@end
