//
//  BaseTabBarController.m
//  自定义ViewController 隐藏系统返回按钮
//
//  Created by huangxin on 2021/4/13.
//

#import "BaseTabBarController.h"
#import "BaseNavigationViewController.h"
#import "HomeViewController.h"
#import "MsgViewController.h"
#import "MyViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:[[HomeViewController alloc]init] WithTitle:@"首页"];
    [self addChildViewController:[[MsgViewController alloc]init] WithTitle:@"消息"];
    [self addChildViewController:[[MyViewController alloc] init] WithTitle:@"我的"];
    
}
-(void)addChildViewController:(UIViewController *)childController WithTitle:(NSString * )title {
    
    BaseNavigationViewController * navi = [[BaseNavigationViewController alloc]initWithRootViewController:childController];
    childController.title = title;
    [self addChildViewController:navi];
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
