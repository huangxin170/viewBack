//
//  HomeViewController.m
//  自定义ViewController 隐藏系统返回按钮
//
//  Created by huangxin on 2021/4/13.
//

#import "HomeViewController.h"
#import "RootViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(ONActionNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
-(void)ONActionNext{
    RootViewController * rootView = [[RootViewController alloc]init];
    [self.navigationController pushViewController:rootView animated:YES];
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
