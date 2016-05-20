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
#import "AKLoadingView.h"

static NSString * const kAKRemoveButtonString = @"REMOVE CELL";

@interface AKUserViewController ()
@property (nonatomic, readonly) AKUserView      *rootView;
@property (nonatomic, strong)   AKLoadingView   *loadingView;

- (void)performChangeWithObject:(AKStateModel *)object;
- (void)load;

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
                       forState:kAKArrayModelChangedState
                         object:self];
        
        [_arrayModel addHandler:^(AKStateModel *object) {
            AKStrongifyAndReturnIfNil(AKUserViewController);
            AKUserView *view = strongSelf.rootView;
            [view.tableView reloadData];
            [view removeLoadingViewAnimated:YES];
        }
                       forState:kAKArrayModelLoadedState
                         object:self];
        
        [self load];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self load];
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

- (void)load {
    [self.rootView showLoadingViewWithMessage:@"Show must go on" animated:YES];
    [_arrayModel loadArrayModel];
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
    AKArrayModel *model = self.arrayModel;
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [model removeObjectAtIndex:indexPath.row];
    } else {
        AKStringModel *stringModel = [AKStringModel new];
        [model addObject:stringModel];
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
