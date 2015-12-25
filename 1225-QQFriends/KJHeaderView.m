//
//  KJHeaderView.m
//  1225-QQFriends
//
//  Created by kouhanjin on 15/12/25.
//  Copyright © 2015年 khj. All rights reserved.
//

#import "KJHeaderView.h"
#import "KJFriendGroup.h"

@interface KJHeaderView()
@property (nonatomic, weak) UIButton *nameView;
@property (nonatomic, weak) UILabel *countView;
@end

@implementation KJHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *HeadViewID = @"headID";
    
    KJHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HeadViewID];
    if (headView == nil) {
        // 在初始化的时候，就添加子控件， 那么重写initWithReuseIdentifier方法
        headView = [[KJHeaderView alloc] initWithReuseIdentifier:HeadViewID];
    }
    
    return headView;
}
/**
 *  在init的初始化方法中,view的frame\bounds没有值
 */
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 添加子控件
        // 添加button
        UIButton *nameView = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:nameView];
        // 按钮左边的箭头
        [nameView setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        // 设置按钮的背景图片
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        // 设置按钮的文字，用于模拟
//        [nameView setTitle:@"我的好友" forState:UIControlStateNormal];
        // 设置文字的颜色
        [nameView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置按钮的内容左对齐
        nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置按钮的内边距
        nameView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        // 按钮中文字的内边距
//        nameView.imageEdgeInsets
        nameView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        // 设置按钮内部的imageView的内容模式为居中
        nameView.imageView.contentMode = UIViewContentModeCenter;
        // 超出边框的内容不需要裁剪
        nameView.imageView.clipsToBounds = NO;
        
        // 给按钮设置监听事件
        [nameView addTarget:self action:@selector(nameViewClick:) forControlEvents:UIControlEventTouchUpInside];
        self.nameView = nameView;
        
        // 添加在线人数
        UILabel *countView = [[UILabel alloc] init];
        [self.contentView addSubview:countView];
        countView.textAlignment = NSTextAlignmentRight;
        countView.textColor = [UIColor grayColor];
        countView.font = [UIFont systemFontOfSize:14];
        self.countView = countView;
    }
    
    return self;
}
/**
 *  当一个控件的frame发生改变的时候就会调用
 *
 *  一般在这里布局内部的子控件(设置子控件的frame)
 */
- (void)layoutSubviews
{
#warning 一定要调用super方法
    [super layoutSubviews];
    
    // 按钮的frame
    self.nameView.frame = self.bounds;
    // 在线人数的frame
    CGFloat countViewY = 0;
    CGFloat countViewH = self.bounds.size.height;
    CGFloat countViewW = 150;
    CGFloat countViewX = self.bounds.size.width - countViewW - 10;
    
    self.countView.frame = CGRectMake(countViewX, countViewY, countViewW, countViewH);
}

- (void)setGroup:(KJFriendGroup *)group
{
    _group = group;
    // 给按钮设置
    [self.nameView setTitle:group.name forState:UIControlStateNormal];
    // 设置在线好友数
    self.countView.text = [NSString stringWithFormat:@"%ld/%ld",(long)group.online,(long)group.friends.count];
    //解决重用带来的问题
    [self imageViewChangeTransform];
}

#pragma mark -按钮监听事件
- (void)nameViewClick:(UIButton *)button
{
   
    // 修改组模型的标记(状态取反)
    self.group.expansion = !self.group.isExpansion;
    [self imageViewChangeTransform];
    // 通知代理，刷新表格
    if ([self.delegate respondsToSelector:@selector(headViewDidClickButton:)]) {
        [self.delegate headViewDidClickButton:self];
    }
    
    
}

- (void)imageViewChangeTransform
{
    [UIView animateWithDuration:0.25 animations:^{
        if (self.group.expansion) {
            self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        }else
        {
            self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
        }
    }];
    
}
@end
