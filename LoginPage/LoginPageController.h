//
//  LoginPageController.h
//  LoginPage
//
//  Created by Zeaconeus on 14-10-16.
//  Copyright (c) 2014年 Zeaconeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginPageController : UIViewController <UITextFieldDelegate> {
    NSInteger index;
    UITextField *_usernameField;
    UITextField *_passwordField;
    UIButton *_loginButton;
    UIImageView *_backgroundImageView;
    NSArray *_imageArray;
    NSTimer *_timer;
}

@end
