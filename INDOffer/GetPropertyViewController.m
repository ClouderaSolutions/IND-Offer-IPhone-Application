//
//  GetPropertyViewController.m
//  INDOffer
//
//  Created by Saurav on 19/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "GetPropertyViewController.h"

@interface GetPropertyViewController ()

@end

@implementation GetPropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    api = [[WebAPI alloc]init];
    api.delegate=self;
    
    if([[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"])
        Cid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"];
    


    _vw_Lease.layer.cornerRadius=_vw_Lease.frame.size.height/2;
    _vw_Sell.layer.cornerRadius=_vw_Sell.frame.size.height/2;
    
    _btn_Lease.layer.cornerRadius=_btn_Lease.frame.size.height/2;
    _btn_Lease.layer.borderColor=PINK.CGColor;
    _btn_Lease.layer.borderWidth=2.0;
    
    
    _btn_Seal.layer.cornerRadius=_btn_Seal.frame.size.height/2;
    _btn_Seal.layer.borderColor=PINK.CGColor;
    _btn_Seal.layer.borderWidth=2.0;

 
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectPropertyType" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectPropertyType:) name:@"SelectPropertyType" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryState" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryState:) name:@"SelectCountryState" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryCity" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryCity:) name:@"SelectCountryCity" object:nil];
    

    
    // Do any additional setup after loading the view.
}
- (IBAction)actionAggrementTyp:(UIButton *)sender {
    
    if (sender.tag==0)
    {
        NSLog(@"Lease");
        _vw_Lease.backgroundColor=PINK;
        _vw_Sell.backgroundColor=CLEAR;
        
        agrrementStr=@"L";

        
        
    }else if (sender.tag==1)
    {
        NSLog(@"Sell");
        agrrementStr=@"P";

        _vw_Sell.backgroundColor=PINK;
        _vw_Lease.backgroundColor=CLEAR;

    }
    
    
}
- (IBAction)actionSelectState:(id)sender {
    
    NSLog(@"Select State");
    
    if (Cid)
    {
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        [api getState:Cid];
    }


}

- (IBAction)actionPropertyTyp:(id)sender {
    
    NSLog(@"Select property Typ");
    
    
    NSMutableArray *itmArr=[NSMutableArray arrayWithObjects:@"Residential",@"Commercial",@"Plot/Land",nil];
    
    PopUpViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
    controller.itemArr=itmArr;
    controller.itemStatus=PROPERTYTYPE;
    [self addChildViewController:controller];
    controller.view.frame = self.view.bounds;
    controller.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];

    
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
    } else if (_txtField_Budjet.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your budjet amount."];
    }
    else if (!cityID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select city."];
        
    }else if (!stateID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select state."];
        
    }else if (!agrrementStr)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select agreement type (Lease or Sell)."];
        
    }else if (!proptype)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select property type."];
        
    }
    else
    {
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        if ([[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"])
            [dict setObject:[[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"] forKey:@"userid"];
        
        [dict setObject:@"InsertGetProp" forKey:@"type"];
        [dict setObject:_txtField_Comment.text forKey:@"comment"];
        [dict setObject:_txtField_Budjet.text forKey:@"price"];
        [dict setObject:stateID forKey:@"stateid"];
        [dict setObject:cityID forKey:@"cityid"];
        [dict setObject:_txtField_PhnNum.text forKey:@"phone"];
        [dict setObject:@"P" forKey:@"gettype"];
        [dict setObject:proptype forKey:@"proptype"];
        [dict setObject:agrrementStr forKey:@"agreement"];
    
         [api getProperty:dict];
        
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

-(void)callbackGetPropertySuccess:(id)response

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
    [_btnCity setTitle:[dict valueForKey:@"name"] forState:UIControlStateNormal];
        cityID=[dict valueForKey:@"id"];
    }
    
}
-(void)SelectPropertyType:(NSNotification *)notification
{
    _lbl_PropertyType.text=notification.object;
    
    proptype = [_lbl_PropertyType.text substringToIndex:1];
                             
    proptype = [proptype uppercaseString];
    
    NSLog(@"%@",proptype);
}

 #pragma  mark - Textfield Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_txtField_PhnNum resignFirstResponder];
    [_txtField_Budjet resignFirstResponder];
    [_txtField_Comment resignFirstResponder];
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
