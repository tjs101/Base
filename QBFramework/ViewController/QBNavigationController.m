//
//  QBNavigationController.m
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import "QBNavigationController.h"
#import "QBSystem.h"

@interface QBNavigationController ()

@end

@implementation QBNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        if ([QBSystem IOS7Later]) {
            
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_navigation_IOS7"] forBarMetrics:UIBarMetricsDefault];
        }
        else {
            
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_navigation"] forBarMetrics:UIBarMetricsDefault];
        }
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
