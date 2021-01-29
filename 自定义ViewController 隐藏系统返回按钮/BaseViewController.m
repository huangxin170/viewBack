//
//  BaseViewController.m
//  自定义ViewController 隐藏系统返回按钮
//
//  Created by huangxin on 2021/1/29.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //不是栈中第一个页面的时候显示自定义的返回按钮
    if (self.navigationController.viewControllers.count > 1) {
        UIBarButtonItem * backitem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"backarrow"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        self.navigationItem.leftBarButtonItem = backitem;
    }
    //实现系统的滑动返回手势
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}
//判断如果已经回到栈顶了禁用滑动手势
-(void)viewWillAppear:(BOOL)animated{
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }else{
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}
//返回实现
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
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
