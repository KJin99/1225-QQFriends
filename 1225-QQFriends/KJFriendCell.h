//
//  KJFriendCell.h
//  1225-QQFriends
//
//  Created by kouhanjin on 15/12/25.
//  Copyright © 2015年 khj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KJFriend;
@interface KJFriendCell : UITableViewCell
/**
 *  不能以friend作为属性，因为是c++中得关键字
 */
@property (nonatomic, strong) KJFriend *myFriend;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
