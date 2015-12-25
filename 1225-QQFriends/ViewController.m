//
//  ViewController.m
//  1225-QQFriends
//
//  Created by kouhanjin on 15/12/25.
//  Copyright © 2015年 khj. All rights reserved.
//

#import "ViewController.h"
#import "KJFriendGroup.h"
#import "KJFriend.h"
#import "KJHeaderView.h"
#import "KJFriendCell.h"

@interface ViewController ()<KJHeaderViewDelegate>
@property (nonatomic, strong) NSArray *friendGroups;
@end

@implementation ViewController

- (NSArray *)friendGroups
{
    if (_friendGroups == nil) {
        _friendGroups = [KJFriendGroup groupList];
    }
    
    return _friendGroups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.sectionHeaderHeight = 44;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - 数据源代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.friendGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    KJFriendGroup *group = self.friendGroups[section];
    return group.isExpansion ? group.friends.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    KJFriendCell *cell = [KJFriendCell cellWithTableView:tableView];
    KJFriendGroup *group = self.friendGroups[indexPath.section];
    KJFriend *friend = group.friends[indexPath.row];
    
    cell.myFriend = friend;
    
    return cell;
}

#pragma mark - uitableview的代理方法
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    KJFriendGroup *froup = self.friendGroups[section];
//    return froup.name;
//}
/**
 *  现在要解决的问题是自定义头部视图,利用可重用原理，官方提供了一个UITableViewHeaderFooterView类
 *
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    NSLog(@"%s,%d",__func__,section);
    // 创建头部视图
    KJHeaderView *headView = [KJHeaderView headerViewWithTableView:tableView];
//    NSLog(@"%p---%d",headView,section);
    // 设置代理
    headView.delegate = self;
    headView.tag = section;
    // 给模型赋值
    headView.group = self.friendGroups[section];
    return headView;
}

#pragma mark - KJHeaderView的代理
- (void)headViewDidClickButton:(KJHeaderView *)headView
{
    // 只刷新当前组中得数据
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headView.tag];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
//    [self.tableView reloadData];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
