//
//  QBTabBarController.h
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QBTabBarController : UITabBarController

@property (nonatomic, strong)  NSArray *normalImageItems;//底部图片数组
@property (nonatomic, strong)  NSArray *selectedImageItems;//底部选中图片数组

@property (nonatomic, assign)  NSUInteger  selectedIndex;//选择第几个tab

@property (nonatomic, strong)  UIImage *tabBackgroundImage;

@end
