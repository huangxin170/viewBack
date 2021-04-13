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
    //如果不设置颜色，第一次push是会卡顿
    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.interactivePopGestureRecognizer.delegate = (id)self;

}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //有tabbar的时候写上，进入下一页隐藏tabbar ，一定要写在[super pushViewController:viewController animated:animated];上面，如果没有tabbar，可以不写
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
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
//返回的时候如果是第一页，显示tabbar ，如果没有tabbar的时候可以不写
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    if (self.viewControllers.count >= 1) {
        self.hidesBottomBarWhenPushed = YES;
    }else{
        self.hidesBottomBarWhenPushed = NO;
    }
    return [super popViewControllerAnimated:animated];
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
