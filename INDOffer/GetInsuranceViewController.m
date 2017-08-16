//
//  GetInsuranceViewController.m
//  INDOffer
//
//  Created by Saurav on 19/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "GetInsuranceViewController.h"

@interface GetInsuranceViewController ()

@end

@implementation GetInsuranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    api = [[WebAPI alloc]init];
    api.delegate=self;
    
    if([[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"])
    Cid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"];
    
    NSLog(@"country id is == %@",Cid);
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectInsuranceType" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectInsuranceType:) name:@"SelectInsuranceType" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryState" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryState:) name:@"SelectCountryState" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryCity" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryCity:) name:@"SelectCountryCity" object:nil];

    // Do any additional setup after loading the view.
}

- (IBAction)actionInsuranceDropDownButton:(id)sender {
 
    [api getInsuranceList];
    
}
- (IBAction)actionStateDropDown:(id)sender {
    
    if (Cid)
    {
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
         [api getState:Cid];
     }
 }

- (IBAction)actionSelectCity:(id)sender {
    if (stateID)
    {
        
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        [api getCityFromStateID:stateID flag:@"0"];
        
    }
}
- (IBAction)actionSubmit:(id)sender {
    
    
    if (_txtField_PhnNum.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your mobile number."];
    }
    else if (_txtField_Comment.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your comments."];
    } else if (!cityID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select city."];
        
    }else if (!stateID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select state."];
        
    }else if (!insuranceID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select insurance type."];
        
    }
    else
    {
        
         [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
               if ([[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"])
            [dict setObject:[[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"] forKey:@"userid"];
        
        [dict setObject:@"InsertGetIns" forKey:@"type"];
        [dict setObject:_txtField_Comment.text forKey:@"comment"];
        [dict setObject:stateID forKey:@"stateid"];
        [dict setObject:cityID forKey:@"cityid"];
        [dict setObject:_txtField_PhnNum.text forKey:@"phone"];
        [dict setObject:insuranceID forKey:@"insid"];
        [dict setObject:@"I" forKey:@"gettype"];

         [api createInsurance:dict];
        
        
    }
    

}

- (IBAction)actionBackButton:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark -- Button Action

-(void)doneTouchedAlter:(id)sender
{
    [self.txtField_PhnNum resignFirstResponder];
    
 }
#pragma mark -- Api's Delegate Action

-(void)callBackState:(id)response
{
    NSMutableArray *arrCountry = [[NSMutableArray alloc]init];
    
    arrCountry=[response valueForKey:@"statesList"];
    
    
    PopUpViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
    controller.itemArr=arrCountry;
    controller.itemStatus=COUNTRYSTATE;
    [self addChildViewController:controller];
    controller.view.frame = self.view.bounds;
    controller.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
    
}
-(void)callBackCities:(id)response
{
    NSMutableArray *arrCity= [[NSMutableArray alloc]init];
    arrCity=[response valueForKey:@"citiesList"];
    
    NSLog(@"%lu",(unsigned long)arrCity.count);
    
    PopUpViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
    controller.itemArr=arrCity;
    controller.itemStatus=COUNTRYCITY;
    [self addChildViewController:controller];
    controller.view.frame = self.view.bounds;
    controller.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
    
}
-(void)callbackInsuranceTypeList:(id)response
{
    NSLog(@"%@",response);
    NSMutableArray *insuList= [[NSMutableArray alloc]init];
    insuList=[response valueForKey:@"insuranceList"];
    
    
    
        PopUpViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
        controller.itemArr=insuList;
        controller.itemStatus=INSURANCETYPE;
        [self addChildViewController:controller];
        controller.view.frame = self.view.bounds;
        controller.view.backgroundColor = [UIColor clearColor];
        [self.view addSubview:controller.view];
        [controller didMoveToParentViewController:self];
        
    

}
-(void)callbackInsuranceSuccess:(id)response
{
    
    NSLog(@"insurance create === %@",response);
}

-(void)callbackFromAPI:(id)response
{
    [Helper hideIndicatorFromView:self.view];
}
#pragma mark -- Notification's Delegate Action

-(void)SelectCountryState:(NSNotification *)notification
{
    NSDictionary *dict=notification.object;
    
    NSLog(@"get insurance%@",dict);
    if (dict)
    {
        _lbl_SelectState.text=[dict valueForKey:@"name"];
        stateID=[dict valueForKey:@"id"];
    }
    
}
-(void)SelectCountryCity:(NSNotification *)notification

{
    NSDictionary *dict=notification.object;
    
    NSLog(@"%@",dict);
    if (dict)
    {
         [_btnSelectCity setTitle:[dict valueForKey:@"name"] forState:UIControlStateNormal];
        cityID=[dict valueForKey:@"id"];
    }
    
}

-(void)SelectInsuranceType:(NSNotification *)notification
{
     NSDictionary *dict=notification.object;
    
    NSLog(@"%@",dict);
    if (dict)
    {
        _lbl_InsuranceType.text=[dict valueForKey:@"name"];
        insuranceID=[dict valueForKey:@"id"];
    }
}
#pragma  mark - Textfield Delegate methods


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
         return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_txtField_PhnNum resignFirstResponder];
    [_txtField_Comment resignFirstResponder];

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
