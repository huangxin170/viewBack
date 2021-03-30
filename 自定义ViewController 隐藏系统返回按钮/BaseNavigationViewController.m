//
//  BaseNavigationViewController.m
//  自定义ViewController 隐藏系统返回按钮
//
//  Created by huangxin on 2021/2/2.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.interactivePopGestureRecognizer.delegate = (id)self;

}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    //push的时候自定义左侧返回按钮
    if (self.topViewController && self.viewControllers.count > 1) {
        UIBarButtonItem * backitem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"backarrow"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = backitem;
    }
    
}
//手势判断，如果是在栈顶，禁止手势
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.viewControllers.count == 1) {
        return NO;
    }
    return true;
}
-(void)back{
    [self popViewControllerAnimated:YES];
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
