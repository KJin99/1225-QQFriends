//
//  KJFriendCell.m
//  1225-QQFriends
//
//  Created by kouhanjin on 15/12/25.
//  Copyright © 2015年 khj. All rights reserved.
//

#import "KJFriendCell.h"
#import "KJFriend.h"

@implementation KJFriendCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *CellID = @"cellID";
    KJFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[KJFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellID];
    }
    return cell;
}

- (void)setMyFriend:(KJFriend *)myFriend
{
    _myFriend = myFriend;
    // 设置
    self.imageView.image = [UIImage imageNamed:myFriend.icon];
    self.textLabel.text = myFriend.name;
    self.detailTextLabel.text = myFriend.intro;
    // 会员
    self.textLabel.textColor = myFriend.isVip ? [UIColor redColor] : [UIColor blackColor];
}
@end
