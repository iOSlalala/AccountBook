//
//  ViewController.m
//  AccountBook
//
//  Created by 王馨妍 on 15/6/11.
//  Copyright (c) 2015年 wxy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobileTxF;
@property (weak, nonatomic) IBOutlet UITextField *codeTxF;
@property (weak, nonatomic) IBOutlet UITextField *userNameTxF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTxF1;
@property (weak, nonatomic) IBOutlet UITextField *pwdTxF2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)sendCodeAction:(id)sender {
    [AVOSCloud requestSmsCodeWithPhoneNumber:_mobileTxF.text
                                     appName:@"记账本"
                                   operation:@"注册"
                                  timeToLive:10
                                    callback:^(BOOL succeeded, NSError *error) {
                                        // 执行结果
                                    }];
    
}

- (IBAction)verifyCodeAction:(id)sender {
    [AVOSCloud verifySmsCode:_codeTxF.text
           mobilePhoneNumber:_mobileTxF.text callback:^(BOOL succeeded, NSError *error) {
        
               NSLog(@"%@",succeeded?@"success":@"fail");
               NSLog(@"%@",error);

    }];
}

- (IBAction)registAction:(id)sender {
    AVUser *user = [AVUser user];
    user.username = _userNameTxF.text;
    user.password = _pwdTxF1.text;
    user.mobilePhoneNumber = _mobileTxF.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"succeed!");
        } else {
            NSLog(@"%@",error);
        }
    }];
}
@end
