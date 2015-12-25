//
//  KJHeaderView.h
//  1225-QQFriends
//
//  Created by kouhanjin on 15/12/25.
//  Copyright © 2015年 khj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KJFriendGroup, KJHeaderView;

@protocol KJHeaderViewDelegate <NSObject>

@optional
- (void)headViewDidClickButton:(KJHeaderView *)headView;

@end

@interface KJHeaderView : UITableViewHeaderFooterView
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) KJFriendGroup *group;
/**
 *  代理属性
 */
@property (nonatomic, weak) id<KJHeaderViewDelegate> delegate;
@end
