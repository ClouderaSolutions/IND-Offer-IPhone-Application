//
//  ViewController.h
//  INDOffer
//
//  Created by Saurav on 17/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "Helper.h"
#import "RegisterViewController.h"
#import "WebAPI.h"
#import "Helper.h"
@interface ViewController : UIViewController<UITextFieldDelegate,APIsDelegate>

{
    WebAPI *api;

    
    NSString * otpStr,* userID;
    NSDictionary * dictData;
 }
@property (strong, nonatomic) IBOutlet UIImageView *imgVw_Logo;
@property (strong, nonatomic) IBOutlet UIView *viewLogin;
@property (strong, nonatomic) IBOutlet UILabel *strSignUp;


@property (strong, nonatomic) IBOutlet UITextField *txtField_Email;
@property (strong, nonatomic) IBOutlet UIButton *btnLoginOTP;
@property (strong, nonatomic) IBOutlet UIButton *btnRegister;
@property (strong, nonatomic) IBOutlet UITextField *txtField_OTP;
@property (strong, nonatomic) IBOutlet UIView *vw_OTP;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constraint_Email;


@end

