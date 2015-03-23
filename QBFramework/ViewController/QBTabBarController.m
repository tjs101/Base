//
//  QBTabBarController.m
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import "QBTabBarController.h"
#import "QBConfig.h"
#import "QBTableViewController.h"

@interface QBTabBarController ()

@property  (nonatomic, assign)  NSUInteger  currentSelectedIndex;
@property  (nonatomic, assign)  NSUInteger  oldSelectedIndex;
@property  (nonatomic, strong)  NSMutableArray  *tabBarItems;
@end

@implementation QBTabBarController
@synthesize normalImageItems;
@synthesize selectedImageItems;
@synthesize selectedIndex;

@synthesize tabBackgroundImage;

@synthesize currentSelectedIndex;
@synthesize oldSelectedIndex;
@synthesize tabBarItems;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.currentSelectedIndex = 0;
    self.oldSelectedIndex = self.currentSelectedIndex;
    
    self.tabBarItems = [NSMutableArray array];
    
    if (tabBackgroundImage) {
        
        self.tabBar.backgroundImage = nil;
        
        UIImageView  *bgImageView = [[UIImageView alloc] initWithImage:tabBackgroundImage];
        [bgImageView sizeToFit];
        [self.tabBar addSubview:bgImageView];
    }

    
    [self setTabImages:normalImageItems selectedImages:selectedImageItems];
    
    self.selectedIndex = self.currentSelectedIndex;
}

- (void)setTabImages:(NSArray *)images selectedImages:(NSArray *)selectedImages
{
    if ([images count] != [selectedImageItems count] != [self.viewControllers count]) {
        
        NSLog(@"!!!!!!!!!!!!!tabbar图片或者其中添加的视图数量不一致!!!!!!!!!!!!!!!");
        
        return;
    }
    
    NSUInteger  count = [images count];
    
    CGRect rect = self.tabBar.frame;
    NSUInteger  width = rect.size.width/count;
    NSUInteger  height = rect.size.height;
    
    CGFloat x = 0, y = 0;
    
    for (int index = 0; index < count; index ++) {
        
        x = index * width;
        
        UIControl  *control = [[UIControl alloc] initWithFrame:CGRectMake(x, 0, width, height)];
        [control addTarget:self action:@selector(onSelectedClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //image
        UIImage  *image = [images objectAtIndex:index];
        UIImage  *selectedImage = [selectedImages objectAtIndex:index];
        
        x = (width - image.size.width)/2;
        y = (height - image.size.height)/2;
        
        UIImageView  *imageView = [[UIImageView alloc] initWithImage:image highlightedImage:selectedImage];
        [imageView sizeToFit];
        imageView.frame = CGRectMake(x, y, imageView.frame.size.width, imageView.frame.size.height);
        [control addSubview:imageView];
        
        if (self.currentSelectedIndex == index) {
            imageView.highlighted = YES;
        }
        
        
        [self.tabBar addSubview:control];
        [self.tabBarItems addObject:control];
    }
    
}


#pragma mark - selected click

- (void)onSelectedClick:(id)sender
{
    
    UIControl *control = (UIControl *)sender;
    
    NSUInteger  index = [self.tabBarItems indexOfObject:control];
    
    if (index == self.currentSelectedIndex) {
        [self activeSameItem:index];
    }
    else {
        [self activeItem:index];
    }
    
}

#pragma mark -  刷新tabbar

- (void)activeItem:(NSUInteger)index
{
    
    if (index >= self.tabBarItems.count) {
        return;
    }
    
    self.oldSelectedIndex = self.currentSelectedIndex;
    self.currentSelectedIndex = index;
    
    if (index < [self.tabBarItems count]) {
        
        UIView  *view = [self.tabBarItems objectAtIndex:index];
        
        for (UIView *subView in view.subviews) {
            
            if ([subView isKindOfClass:[UIImageView class]]) {
                
                ((UIImageView *)subView).highlighted = YES;
            }
        }
        
    }
    
    if (self.oldSelectedIndex < [self.tabBarItems count]) {
        
        UIView  *view = [self.tabBarItems objectAtIndex:oldSelectedIndex];
        
        for (UIView *subView in view.subviews) {
            
            if ([subView isKindOfClass:[UIImageView class]]) {
                
                ((UIImageView *)subView).highlighted = NO;
            }
        }
        
    }
    
    
    self.selectedIndex = index;
}

#pragma mark -  点击相同tab 进行一系列操作
- (void)activeSameItem:(NSUInteger)index
{
    UIViewController  *viewCtrl = [self.viewControllers objectAtIndex:index];
    
    if ([viewCtrl isKindOfClass:[UINavigationController class]]) {
        
        UIViewController *subViewCtrl = [(UINavigationController *)viewCtrl topViewController];
        
        if ([subViewCtrl isKindOfClass:[QBTableViewController class]]) {
            [(QBTableViewController *)subViewCtrl pullToRefresh];
        }

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
