//
//  RootViewController.m
//  自定义ViewController 隐藏系统返回按钮
//
//  Created by huangxin on 2021/1/29.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第二页";
    // Do any additional setup after loading the view.
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"跳转下一页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)nextPush{
    RootViewController * root = [[RootViewController alloc]init];
    [self.navigationController pushViewController:root animated:YES];
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
