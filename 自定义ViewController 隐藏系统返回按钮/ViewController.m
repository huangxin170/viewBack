//
//  ViewController.m
//  自定义ViewController 隐藏系统返回按钮
//
//  Created by huangxin on 2021/1/29.
//

#import "ViewController.h"
#import "RootViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


@end
