//
//  KJFriendGroup.h
//  1225-QQFriends
//
//  Created by kouhanjin on 15/12/25.
//  Copyright © 2015年 khj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KJFriendGroup : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger online;
/**
 *  标识这组是否需要展开,  YES : 展开 ,  NO : 关闭
 */
@property (nonatomic, assign, getter = isExpansion) BOOL expansion;
/**
 *  面向模型的开发，数组中要装friend这个模型
 */
@property (nonatomic, strong) NSArray *friends;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)groupWithDic:(NSDictionary *)dic;

+ (NSArray *)groupList;
@end
