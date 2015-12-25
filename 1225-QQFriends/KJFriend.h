//
//  KJFriend.h
//  1225-QQFriends
//
//  Created by kouhanjin on 15/12/25.
//  Copyright © 2015年 khj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KJFriend : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign, getter=isVip) BOOL vip;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)friendWithDic:(NSDictionary *)dic;

+ (NSArray *)friendsListWithArray:(NSArray *)array;
@end
