//
//  HMLoginController.m
//  通讯录
//
//  Created by 宋钢强 on 16/4/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMLoginController.h"
#import "MBProgressHUD.h"


@interface HMLoginController ()

/**
 *  用户名
 */
@property (weak, nonatomic) IBOutlet UITextField *userNameField;

/**
 *  密码
 */
@property (weak, nonatomic) IBOutlet UITextField *passWordField;

/**
 *  记住密码开关
 */
@property (weak, nonatomic) IBOutlet UISwitch *rmbSwitch;
/**
 *  自动登陆开关
 */

@property (weak, nonatomic) IBOutlet UISwitch *autoSwitch;

/**
 *  登陆按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation HMLoginController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //文本输入框的点击事件监听
    [self.userNameField addTarget:self action:@selector(textchange:) forControlEvents:UIControlEventEditingChanged];
    [self.passWordField addTarget:self action:@selector(textchange:) forControlEvents:UIControlEventEditingChanged];
    
    
//   监听开关状态的改变
    [self.rmbSwitch addTarget:self action:@selector(rmbSwitchValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.autoSwitch addTarget:self action:@selector(autoSwitchValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    
//    监听登录按钮的点击事件
    [self.loginBtn addTarget:self action:@selector(clickLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
//登陆按钮点击
-(void)clickLoginBtn:(UIButton *)sender{
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:self.view];
    
    hud.labelText = @"正在登陆。。。";
    [self.navigationController.view addSubview:hud];
    [hud show:YES];
    
    
    
    
    NSString *userName = self.userNameField.text;
    NSString *passWord = self.passWordField.text;
//    NSLog(@"正在登陆");
    if ([userName isEqualToString:@"xx"]&&[passWord isEqualToString:@"123123"]) {
        [self performSegueWithIdentifier:@"go2List" sender:@"123"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
        
    }else{
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"用户名或密码错误";
       
        
        [hud hide:YES afterDelay:1.0];
//        NSLog(@"用户名或密码错误");
    
    }


}

//
//方法实现
-(void)textchange:(UITextField *)sender{

    NSString *userName = self.userNameField.text;
    NSString *password = self.passWordField.text;
    
    
    if (userName.length > 0 && password.length > 0) {
        self.loginBtn.enabled = YES;
    }else{
        self.loginBtn.enabled = NO;
    
    }


}
//记住密码
-(void)rmbSwitchValueChanged:(UISwitch *)sender{
//    记住密码关闭，自动登录必须关闭
    if (sender.isOn == NO) {
        self.autoSwitch.on = NO;
    }


}
//自动登陆
-(void)autoSwitchValueChanged:(UISwitch *)sender{
//自动登录打开，记住密码必须打开
    if (sender.isOn == YES) {
        self.rmbSwitch.on = YES;
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
