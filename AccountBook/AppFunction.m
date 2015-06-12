//
//  AppFunction.m
//  AccountBook
//
//  Created by 王馨妍 on 15/6/12.
//  Copyright (c) 2015年 wxy. All rights reserved.
//

#import "AppFunction.h"
#import "UIView+Toast.h"

@implementation AppFunction

+ (void)showAlertViewWithMessage:(NSString *)message
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window makeToast:message];
    //    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:window];
    //    [window addSubview:HUD];
    //    HUD.mode = MBProgressHUDModeCustomView;
    //    HUD.customView = nil;
    //    HUD.labelText = message;
    //    [HUD show:YES];
    //    [HUD hide:YES afterDelay:2];
    
    //    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //    hud.labelText = NSLocalizedString(@"Searching", nil);
    //    [hud hide:YES afterDelay:2];
    
    //    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //    [alertView show];
}

@end
