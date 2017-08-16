//
//  AddBizViewController.m
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "AddBizViewController.h"

@interface AddBizViewController ()

@end

@implementation AddBizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    api = [[WebAPI alloc]init];
    api.delegate=self;
    
    
}

- (IBAction)actionSubmit:(id)sender {
    
    if (_txtField_Tittle.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your title."];
    }
    else if (_txtField_Desc.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your description."];
    }else if(_txtField_Email.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your email."];
    }
    else if ([Helper validateEmailWithString:_txtField_Email.text]==NO)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter valid email."];
    } else if(_txtField_Url.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your url."];
    }else
    {
    
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        
        
        if ([[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"])
            [dict setObject:[[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"] forKey:@"userid"];
        [dict setObject:_txtField_Tittle.text forKey:@"name"];
        [dict setObject:@"InsertBiz" forKey:@"type"];
        [dict setObject:_txtField_Email.text forKey:@"email"];
         [dict setObject:_txtField_Desc.text forKey:@"desc"];
        [dict setObject:_txtField_Url.text forKey:@"url"];
        
        
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        
        [api createBiz:dict];
        
    }
    
    
    

}

- (IBAction)actionBackButton:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark -- API's delegate Action
-(void)callbackBizSuccess:(id)response
{
    
    NSLog(@"%@",response);
    
    if ([[response objectForKey:@"success"] integerValue]==1)
    {
        [Helper showAlertViewWithTitle:@"Congratulation" message:[response objectForKey:@"message"]];
    }
}
-(void)callbackFromAPI:(id)response
{
    [Helper hideIndicatorFromView:self.view];
}

#pragma  mark - Textfield Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_txtField_Tittle resignFirstResponder];
    [_txtField_Desc resignFirstResponder];
    [_txtField_Email resignFirstResponder];
    [_txtField_Url resignFirstResponder];
    
    
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
