//
//  ViewController.m
//  INDOffer
//
//  Created by Saurav on 17/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "ViewController.h"
#import <IQKeyboardManager.h>
@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    api = [[WebAPI alloc]init];
    api.delegate=self;

    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    
//    if (!otpStr)
//    {
//        _constraint_Email.constant=110;
//    }
    
    
    _viewLogin.layer.cornerRadius=4.0;
    _btnLoginOTP.layer.cornerRadius=4.0;
    
 
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:_strSignUp.text];
    [text addAttribute: NSForegroundColorAttributeName value: [UIColor lightGrayColor] range: NSMakeRange(0, 22)];
    [text addAttribute: NSForegroundColorAttributeName value: [UIColor darkGrayColor] range: NSMakeRange(22, 8)];
    [_strSignUp setAttributedText: text];
    
    [_strSignUp setFont:[UIFont systemFontOfSize:13]];
    _strSignUp.adjustsFontSizeToFitWidth=YES;
    
     if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Userid"])
    {
        UITabBarController * tabbar=[self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        [self.navigationController pushViewController:tabbar animated:YES];
        

   }

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];

}

- (IBAction)actionLogin:(id)sender {
    
    if (!otpStr)
    {
        [self verifyEmail];
    }else
    {
        NSLog(@"match OTP");
        
       [self verifyOTP];
    }
 }



- (IBAction)actionRegister:(id)sender {
    
    RegisterViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark -- APIs Delegate

-(void)callbackFromAPI:(id)response
{
    [Helper hideIndicatorFromView:self.view];
}

-(void)callbackLoginSuccess:(id)response
{
       NSLog(@"call back logn == %@",response);
    dictData=response;
    
    otpStr=[NSString stringWithFormat:@"%@",[response valueForKey:@"otp"]];
    userID=[response valueForKey:@"userid"];
    
    [_btnLoginOTP setTitle:@"Login" forState:UIControlStateNormal];
    
//    if (otpStr)
//    {
//        _constraint_Email.constant=30.0;
//    }
    
}

-(void)verifyOTP
{
    
    if(_txtField_OTP.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your otp."];
    }else if([_txtField_OTP.text isEqualToString:otpStr])
    {
        NSLog(@"Successful matched");
//        NSUserDefaults *boolUserDefaults = [NSUserDefaults standardUserDefaults];
//        [boolUserDefaults setBool:true forKey:@"isLogin"];
        
        NSLog(@"%@",dictData);
        
        [Helper saveAllValuesInUserDefaults:dictData];
       
        
        UITabBarController * tabbar=[self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        [self.navigationController pushViewController:tabbar animated:YES];

//        MainViewController *MainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
//        [self.navigationController pushViewController:MainViewController animated:YES];
        
    }else
    {
         [Helper showAlertViewWithTitle:ALERT message:@"Please check your otp."];
    }
    
}


#pragma mark -- TextField


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (IS_IPHONE_5)
    {
        if (textField.tag!=0)
        {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationBeginsFromCurrentState:YES];
            [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-25, self.view.frame.size.width, self.view.frame.size.height)];
        }
        [UIView commitAnimations];
        
    }
    //    else
    //    {
    //        CGRect frame1=self.view.frame;
    //        frame1.origin.y=-55;
    //        [self.view setFrame:frame1];
    //    }
    
}
-(void)framOnDefaulSize
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    CGRect frame1=self.view.frame;
    frame1.origin.y=0;
    [self.view setFrame:frame1];
    [UIView commitAnimations];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
        [textField resignFirstResponder];
        [self framOnDefaulSize];
        
    
    return YES;
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self framOnDefaulSize];
    
    [self.view endEditing:YES];
}

-(void)verifyEmail
{
    if(_txtField_Email.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your email."];
    }
    else if ([Helper validateEmailWithString:_txtField_Email.text]==NO)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter valid email."];
    } else
    {
        [_txtField_Email resignFirstResponder];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setObject:_txtField_Email.text forKey:@"email"];
        [dict setObject:@"Login" forKey:@"type"];
        
        
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        
        [api signUpWithOtp:dict];
    }
    
}
-(void)goToMainClass
{
    MainViewController *MainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [self.navigationController pushViewController:MainViewController animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
