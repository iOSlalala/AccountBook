//
//  ViewController.m
//  AccountBook
//
//  Created by 王馨妍 on 15/6/11.
//  Copyright (c) 2015年 wxy. All rights reserved.
//

#import "RegistViewController.h"
#import "LoginViewController.h"

@interface RegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobileTxF;
@property (weak, nonatomic) IBOutlet UITextField *codeTxF;
@property (weak, nonatomic) IBOutlet UITextField *userNameTxF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTxF1;
@property (weak, nonatomic) IBOutlet UITextField *pwdTxF2;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self beginCode:NO];
    [self beginUser:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)beginUser:(BOOL)b{
    _userNameTxF.hidden = !b;
    _pwdTxF1.hidden = !b;
    _pwdTxF2.hidden = !b;
    _registBtn.hidden = !b;
}

- (void)beginCode:(BOOL)b{
    _codeTxF.hidden = !b;
    _confirmBtn.hidden = !b;
}

- (IBAction)sendCodeAction:(id)sender {
    [AVOSCloud requestSmsCodeWithPhoneNumber:_mobileTxF.text
                                     appName:@"记账本"
                                   operation:@"注册"
                                  timeToLive:10
                                    callback:^(BOOL succeeded, NSError *error) {
                                        // 执行结果
                                        if (succeeded) {
                                            [self beginCode:YES];
                                        }
                                    }];
    
}

- (IBAction)verifyCodeAction:(id)sender {
    [AVOSCloud verifySmsCode:_codeTxF.text
           mobilePhoneNumber:_mobileTxF.text callback:^(BOOL succeeded, NSError *error) {
        
               NSLog(@"%@",succeeded?@"success":@"fail");
               NSLog(@"%@",error);
               if (succeeded) {
                   [self beginUser:YES];
               }

    }];
}

- (IBAction)registAction:(id)sender {
    AVUser *user = [AVUser user];
    user.username = _userNameTxF.text;
    user.password = _pwdTxF1.text;
    user.mobilePhoneNumber = _mobileTxF.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            LoginViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            [self.navigationController pushViewController:loginVC animated:YES];
        } else {
            if (error.code ) {
                [AppFunction showAlertViewWithMessage:[error.userInfo objectForKey:@"NSLocalizedDescription"]];
                
            }
        }
    }];
}
@end
