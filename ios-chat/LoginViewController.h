//
//  LoginViewController.h
//  ios-chat
//
//  Created by Osvaldo Sabina on 7/15/14.
//  Copyright (c) 2014 Ozzie Sabina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "MainViewController.h"

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)onLoginButton:(id)sender;
- (IBAction)onSignupButton:(id)sender;


@end
