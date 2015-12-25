//
//  KJFriend.m
//  1225-QQFriends
//
//  Created by kouhanjin on 15/12/25.
//  Copyright © 2015年 khj. All rights reserved.
//

#import "KJFriend.h"

@implementation KJFriend
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)friendWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)friendsListWithArray:(NSArray *)array
{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[self friendWithDic:dic]];
    }
    
    return arrayM;
}
@end
