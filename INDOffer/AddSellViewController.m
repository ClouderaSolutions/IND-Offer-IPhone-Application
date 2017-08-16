//
//  AddSellViewController.m
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "AddSellViewController.h"

@interface AddSellViewController ()

@end

@implementation AddSellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    api = [[WebAPI alloc]init];
    api.delegate=self;
    
    if([[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"]){
        Cid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"];
 
    }
    
    // Do any additional setup after loading the view.
    
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryState" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryState:) name:@"SelectCountryState" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryCity" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryCity:) name:@"SelectCountryCity" object:nil];

}
- (IBAction)actionSubmit:(id)sender {
    
    
    
    if (_txtField_Tittle.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter the tittle."];
    }
    else if (_txtField_Comment.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your comments."];
    } else if (_txtField_Price.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your budjet amount."];
    }else if (_txtField_Zip.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter zip code."];
    }
    else if (!cityID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select city."];
        
    }else if (!stateID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select state."];
        
    }else
    {
 
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        
        if ([[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"])
            [dict setObject:[[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"] forKey:@"userid"];
        [dict setObject:@"InsertSell" forKey:@"type"];
        [dict setObject:_txtField_Tittle.text forKey:@"name"];
        [dict setObject:_txtField_Price.text forKey:@"price"];
        [dict setObject:_txtField_Comment.text forKey:@"comment"];
        [dict setObject:_txtField_Zip.text forKey:@"zip"];
        [dict setObject:stateID forKey:@"stateid"];
        [dict setObject:cityID forKey:@"cityid"];
        
        [api addSellProperty:dict];
    }
 }

- (IBAction)actionSelectState:(id)sender {
    
    NSLog(@"Value of State");
    if (Cid)
    {
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        [api getState:Cid];
    }

}

- (IBAction)actionUploadImages:(UIButton *)sender {
    
    
}
- (IBAction)actionSelectCity:(id)sender {
    
    NSLog(@"Select City");
    if (stateID)
    {
        
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        [api getCityFromStateID:stateID flag:@"0"];
        
    }
}


- (IBAction)actionBackButton:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
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

-(void)callbackAddSellPropertySuccess:(id)response
{
    NSLog(@"%@",response);
    
    [Helper showAlertViewWithTitle:@"Congratulation" message:[response valueForKey:@"message"]];
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
        _lbl_State.text=[dict valueForKey:@"name"];
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

#pragma  mark - Textfield Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_txtField_Tittle resignFirstResponder];
    [_txtField_Comment resignFirstResponder];
    [_txtField_Price resignFirstResponder];
    [_txtField_Zip resignFirstResponder];

    
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
