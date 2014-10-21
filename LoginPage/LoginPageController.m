//
//  LoginPageController.m
//  LoginPage
//
//  Created by Zeaconeus on 14-10-16.
//  Copyright (c) 2014年 Zeaconeus. All rights reserved.
//

#import "LoginPageController.h"

@interface LoginPageController ()

@end

@implementation LoginPageController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeInterface];
    
}

- (void)initializeInterface {
    self.view.backgroundColor = [UIColor whiteColor];
    index = 0;
    _imageArray = [[NSArray alloc] initWithObjects:@"login_background1", @"login_background2", @"login_background3", @"login_background4", nil];
    
    _backgroundImageView = [[UIImageView alloc] init];
    _backgroundImageView.frame = self.view.frame;
    _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    _backgroundImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_imageArray[0] ofType:@"jpg"]];
    [self.view addSubview:_backgroundImageView];
    
    UILabel *logoLabel = [[UILabel alloc] init];
    logoLabel.bounds = CGRectMake(0, 0, 200, 100);
    logoLabel.center = CGPointMake(SCREEN_SIZE.width / 2, SCREEN_SIZE.height * 0.2);
    logoLabel.text = @"iDear";
    logoLabel.textAlignment = NSTextAlignmentCenter;
    logoLabel.textColor = [UIColor colorWithRed:0.252 green:0.624 blue:0.090 alpha:1.000];
    logoLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:40];
    [self.view addSubview:logoLabel];
    _usernameField = [[UITextField alloc] init];
    _usernameField.bounds = CGRectMake(0, 0, SCREEN_SIZE.width * 0.7, 30);
    _usernameField.center = CGPointMake(SCREEN_SIZE.width / 2, SCREEN_SIZE.height * 0.3);
    _usernameField.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.255];
    _usernameField.placeholder = @"Username";
    _usernameField.textColor = [UIColor colorWithRed:0.252 green:0.624 blue:0.090 alpha:1.000];
    _usernameField.textAlignment = NSTextAlignmentCenter;
    _usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
    _usernameField.clearButtonMode = UITextFieldViewModeAlways;
    _usernameField.keyboardAppearance = UIKeyboardAppearanceDark;
    _usernameField.alpha = 0;
    _usernameField.delegate = self;
    [self.view addSubview:_usernameField];
    
    _passwordField = [[UITextField alloc] init];
    _passwordField.bounds = CGRectMake(0, 0, SCREEN_SIZE.width * 0.7, 30);
    _passwordField.center = CGPointMake(SCREEN_SIZE.width / 2, CGRectGetMaxY(_usernameField.frame) + 40);
    _passwordField.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.255];
    _passwordField.placeholder = @"Password";
    _passwordField.textColor = [UIColor colorWithRed:0.252 green:0.624 blue:0.090 alpha:1.000];
    _passwordField.textAlignment = NSTextAlignmentCenter;
    _passwordField.secureTextEntry = YES;
    _passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    _passwordField.keyboardAppearance = UIKeyboardAppearanceDark;
    _passwordField.clearsOnInsertion = YES;
    _passwordField.alpha = 0;
    _passwordField.delegate = self;
    [self.view addSubview:_passwordField];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.bounds = CGRectMake(0, 0, SCREEN_SIZE.width * 0.4, 30);
    _loginButton.center = CGPointMake(SCREEN_SIZE.width / 2, SCREEN_SIZE.height * 0.618);
    _loginButton.backgroundColor = [UIColor colorWithWhite:0.173 alpha:1.000];
    [_loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    _loginButton.alpha = 0;
    _loginButton.enabled = NO;
    [self.view addSubview:_loginButton];
    
    [UIView animateWithDuration:0.7
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            _usernameField.alpha = 1;
                            _passwordField.alpha = 1;
                            _loginButton.alpha = 0.9;
                        } completion:nil];
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3
                                              target:self
                                            selector:@selector(changeImage)
                                            userInfo:nil
                                             repeats:YES];
    [_timer fire];
}

- (void)changeImage {
    if (index == _imageArray.count - 1) {
        index = 0;
    } else {
        index++;
    }
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_imageArray[index] ofType:@"jpg"]];
    [UIView transitionWithView:_backgroundImageView
                      duration:3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _backgroundImageView.image = image;
                    }
                    completion:nil];
}

- (void)login {
    NSLog(@"Login");
}

#pragma mark -------------------- textField的代理方法
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (_usernameField.text.length == 0 || _passwordField.text.length == 0) {
        _loginButton.enabled = NO;
        _loginButton.backgroundColor = [UIColor colorWithWhite:0.173 alpha:1.000];
    } else {
        _loginButton.enabled = YES;
        _loginButton.backgroundColor = [UIColor colorWithRed:0.252 green:0.624 blue:0.090 alpha:1.000];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self.view endEditing:YES];
}

@end
