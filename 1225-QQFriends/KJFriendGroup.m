//
//  KJFriendGroup.m
//  1225-QQFriends
//
//  Created by kouhanjin on 15/12/25.
//  Copyright © 2015年 khj. All rights reserved.
//

#import "KJFriendGroup.h"
#import "KJFriend.h"

@implementation KJFriendGroup
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
//        self.name = dic[@"name"];
//        self.online = [dic[@"online"] integerValue];
//        // 数组中装friend模型
//        NSArray *friendArr = dic[@"friends"];
//        self.friends = [KJFriend friendsListWithArray:friendArr];
        // 1, 先用KVC注入所有属性
        [self setValuesForKeysWithDictionary:dic];
        // 2， 在特殊处理friends属性，变为模型
        self.friends = [KJFriend friendsListWithArray:self.friends];
    }
    
    return self;
}

+ (instancetype)groupWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)groupList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[self groupWithDic:dic]];
    }
    
    return arrayM;
}
@end
