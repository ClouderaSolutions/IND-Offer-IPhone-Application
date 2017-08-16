//
//  AddShopViewController.m
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "AddShopViewController.h"

@interface AddShopViewController ()

@end

@implementation AddShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    api = [[WebAPI alloc]init];
    api.delegate=self;
    
    if([[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"])
        Cid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"];

    // Do any additional setup after loading the view.
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectShopType" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectShopType:) name:@"SelectShopType" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryState" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryState:) name:@"SelectCountryState" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryCity" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryCity:) name:@"SelectCountryCity" object:nil];
    
    

}


- (IBAction)actionShopType:(id)sender {
    
    
     
    NSLog(@"Select shop type");
    
    NSMutableArray *shopArray=[NSMutableArray arrayWithObjects:@"Grocery",@"Restaurant",@"Other", nil];
    
    PopUpViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
    controller.itemArr=shopArray;
    controller.itemStatus=SHOPTYPE;
    [self addChildViewController:controller];
    controller.view.frame = self.view.bounds;
    controller.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];

}

- (IBAction)actionState:(id)sender {
    NSLog(@"Value of State");
     if (Cid)
    {
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        [api getState:Cid];
    }


}
- (IBAction)actionUpdateLogo:(id)sender {
    
    NSLog(@"Update logo");

}
- (IBAction)actionSelectCity:(id)sender {
    
    NSLog(@"Select City");
    if (stateID)
    {
        
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        [api getCityFromStateID:stateID flag:@"0"];
        
    }
  }

- (IBAction)actionSubmitPressed:(id)sender {
    
    NSLog(@"Submit pressed");
    
    if (_txtField_ShopNm.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your shop name."];
    }
    else if (_txtField_Adress.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your adress."];
    } else if (_txtField_Zip.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your zip."];
        
    }else if (!stateID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select state."];
        
    }else
    {
        
         [Helper showIndicatorWithText:@"Loading..." inView:self.view];
         
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        
             [dict setObject:_txtField_ShopNm.text forKey:@"name"];
        
        if ([[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"])
            [dict setObject:[[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"] forKey:@"userid"];
        
        [dict setObject:@"InsertShop" forKey:@"type"];
        [dict setObject:_txtField_ShopNm.text forKey:@"shoptype"];
        
        [dict setObject:_txtField_Adress.text forKey:@"address"];
        [dict setObject:_txtField_Zip.text forKey:@"zip"];
        [dict setObject:stateID forKey:@"stateid"];
        
        
        [api createShop:dict];
        

    }
    
}

 
 
- (IBAction)actionBackButton:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark -- Api's Delegate Action
-(void)callbackShopAdded:(id)response
{
    NSLog(@"%@",response);
    
    if ([[response objectForKey:@"success"] integerValue]==1)
    {
        [Helper showAlertViewWithTitle:@"Congratulation" message:[response objectForKey:@"message"]];
        
        shopID=[response valueForKey:@"shopid"];
        
        [[NSUserDefaults standardUserDefaults]setObject:shopID forKey:@"shopID"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}
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
        _lbl_ShopState.text=[dict valueForKey:@"name"];
        stateID=[dict valueForKey:@"id"];
    }
    
}
-(void)SelectCountryCity:(NSNotification *)notification

{
    NSDictionary *dict=notification.object;
    
    NSLog(@"%@",dict);
    if (dict)
    {
         [_btn_SelectCity setTitle:[dict valueForKey:@"name"] forState:UIControlStateNormal];

        cityID=[dict valueForKey:@"id"];
    }
    
}
-(void)SelectShopType:(NSNotification *)notification
{
    _lblShopType.text=notification.object;
}

#pragma  mark - Textfield Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_txtField_Zip resignFirstResponder];
    [_txtField_ShopNm resignFirstResponder];
    [_txtField_Adress resignFirstResponder];
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
