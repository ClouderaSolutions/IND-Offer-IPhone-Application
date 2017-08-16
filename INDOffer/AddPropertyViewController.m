//
//  AddPropertyViewController.m
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "AddPropertyViewController.h"

@interface AddPropertyViewController ()

@end

@implementation AddPropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _vwLease.layer.cornerRadius=_vwLease.frame.size.height/2;
    _vw_Seal.layer.cornerRadius=_vw_Seal.frame.size.height/2;
    
    _btnLease.layer.cornerRadius=_btnLease.frame.size.height/2;
    _btnLease.layer.borderColor=PINK.CGColor;
    _btnLease.layer.borderWidth=2.0;
    
    
    _btnSeal.layer.cornerRadius=_btnSeal.frame.size.height/2;
    _btnSeal.layer.borderColor=PINK.CGColor;
    _btnSeal.layer.borderWidth=2.0;
    
    api = [[WebAPI alloc]init];
    api.delegate=self;
    
    if([[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"])
        Cid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"];
    
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectPropertyType" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectPropertyType:) name:@"SelectPropertyType" object:nil];

        
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryState" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryState:) name:@"SelectCountryState" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryCity" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryCity:) name:@"SelectCountryCity" object:nil];
    
    


    // Do any additional setup after loading the view.
}
- (IBAction)actionOfImages:(UIButton *)sender {
    
    if (sender.tag==0) {
        
    }else if (sender.tag==1)
    {
        
    }else if (sender.tag==2)
    {
        
    }
    [Helper showAlertViewWithTitle:@"Alert" message:[NSString stringWithFormat:@"%ld",(long)sender.tag]];
    
}

- (IBAction)actionLeaseNSell:(UIButton *)sender {
    
    if (sender.tag==0)
    {
        _vwLease.backgroundColor=PINK;
        _vw_Seal.backgroundColor=CLEAR;
        agrrementStr=@"L";

        
    }else if (sender.tag==1)
    {
        _vwLease.backgroundColor=CLEAR;
        _vw_Seal.backgroundColor=PINK;
        agrrementStr=@"P";

    }
    
}


- (IBAction)actionOfTypeNState:(UIButton *)sender {
    if (sender.tag==0)
    {
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
        
        
    }else if (sender.tag==1)
    {
        NSLog(@"Value of State");
        if (Cid)
        {
            [Helper showIndicatorWithText:@"Loading..." inView:self.view];
            [api getState:Cid];
        }
        
       }
}
 

- (IBAction)actionOfSubmit:(id)sender {
    
    if (_txtField_Title.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter the tittle."];
    }
    else if (_txtField_Comment.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your comments."];
    } else if (_txtField_Price.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your budjet amount."];
    }
    else if (!cityID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select city."];
        
    }else if (!stateID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select state."];
        
    }else if (!propertyType)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select property type."];
     } 
    else
    {
         [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
       
        if ([[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"])
            [dict setObject:[[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"] forKey:@"userid"];
        [dict setObject:@"InsertProp" forKey:@"type"];
        [dict setObject:agrrementStr forKey:@"agreement"];
        [dict setObject:propertyType forKey:@"proptype"];
        [dict setObject:stateID forKey:@"stateid"];
        [dict setObject:_txtField_Comment.text forKey:@"comment"];
        [dict setObject:_txtField_Price.text forKey:@"price"];
        [dict setObject:_txtField_Title.text forKey:@"name"];

        [api addProperty:dict];
    }
    
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
-(void)callbackAddPropertySuccess:(id)response
{
    NSLog(@"%@",response);
    
     [Helper showAlertViewWithTitle:@"Congratulation" message:[response valueForKey:@"message"]];

}

-(void)callbackFromAPI:(id)response
{
    [Helper hideIndicatorFromView:self.view];
}
#pragma mark -- Notification's Delegate Action
-(void)SelectPropertyType:(NSNotification *)notification
{
    _lblProperty_Type.text=notification.object;
    
    propertyType = [_lblProperty_Type.text substringToIndex:1];
    propertyType = [propertyType uppercaseString];
    
    NSLog(@"%@",propertyType);
}

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
    [_txtField_Title resignFirstResponder];
    [_txtField_Comment resignFirstResponder];
    [_txtField_Price resignFirstResponder];
    
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
