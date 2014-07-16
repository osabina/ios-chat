//
//  AppDelegate.h
//  ios-chat
//
//  Created by Osvaldo Sabina on 7/15/14.
//  Copyright (c) 2014 Ozzie Sabina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "LoginViewController.h"
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoginViewController *lvc;
@property (strong, nonatomic) MainViewController *mvc;

@end
