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
#import "AKStringModel.h"
#import "AKStateModel.h"

static const NSString *kAKRemoveButtonString = @"REMOVE CELL";

@interface AKUserViewController ()
@property (nonatomic, readonly) AKUserView   *rootView;

- (void)performChangeWithObject:(AKStateModel *)object;

@end

@implementation AKUserViewController

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKUserView);

- (void)setArrayModel:(AKArrayModel *)arrayModel {
    if (_arrayModel != arrayModel) {
        _arrayModel = arrayModel;
        
        AKWeakify(AKUserViewController);
        [_arrayModel addHandler:^(AKStateModel *object) {
            AKStrongifyAndReturnIfNil(AKUserViewController);
            [strongSelf performChangeWithObject:object];
        }
                       forState:kAKChangedArrayModelState
                         object:self];
    }
}

#pragma mark -
#pragma mark Private

- (void)performChangeWithObject:(AKStateModel *)object {
    UITableView *tableView = self.rootView.tableView;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:object.index inSection:0];
    if (object.state == kAKObjectRemovedState) {
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationTop];
    } else {
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onEditingSwitch:(id)sender {
    AKUserView *rootView = self.rootView;
    rootView.tableView.editing = !rootView.tableView.editing;
}

#pragma mark -
#pragma mark UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AKUserViewCell *cell = [tableView dequeueCellFromNibWithClass:[AKUserViewCell class]];
    [cell fillWithModel:self.arrayModel[indexPath.row]];
    
    return cell;
}

- (void)        tableView:(UITableView *)tableView
       commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayModel removeObjectAtIndex:indexPath.row];
    } else {
        AKStringModel *stringModel = [AKStringModel new];
        [self.arrayModel addObject:stringModel];
    }
}

- (NSString *)                              tableView:(UITableView *)tableView
    titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [kAKRemoveButtonString copy];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath;
{
    [self.arrayModel exchangeObjectAtIndex:sourceIndexPath.row
                         toIndex:destinationIndexPath.row];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

@end
