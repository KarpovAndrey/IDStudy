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

- (void)setStringsModel:(AKArrayModel *)arrayModel {
    if (_arrayModel != arrayModel) {
        _arrayModel = arrayModel;
        [self.rootView.tableView reloadData];
    }
}

#pragma mark -
#pragma mark LifeCycle

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.rootView.tableView.editing = YES;
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

//Adding cells
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
