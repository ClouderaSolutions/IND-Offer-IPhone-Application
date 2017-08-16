//
//  RegisterViewController.m
//  INDOffer
//
//  Created by Saurav on 17/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
#define kOFFSET_FOR_KEYBOARD 50.0
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    api = [[WebAPI alloc]init];
    api.delegate=self;

    // Do any additional setup after loading the view.
    
  
    
    datePicker= [[UIDatePicker alloc]init];
    [datePicker setMaximumDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(updateDOB) forControlEvents:UIControlEventValueChanged];
    
    //barbutton item for picker
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 44)];
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouchedAlter:)];
    [toolBar setItems:[NSArray arrayWithObjects:flexButton,doneButton, nil]];
    self.txtField_DOB.inputAccessoryView=toolBar;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectRegisterType" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectRegisterType:) name:@"SelectRegisterType" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryState" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryState:) name:@"SelectCountryState" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectCountryCity" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectCountryCity:) name:@"SelectCountryCity" object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"REGISTERNEARCITY" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectRegisterNearCity:) name:@"REGISTERNEARCITY" object:nil];
 }


#pragma mark --  Action's button

- (IBAction)actionSelectCountry:(id)sender {
    
    [Helper showIndicatorWithText:@"Loading..." inView:self.view];

    [api getCountry];
    
    
 }

- (IBAction)actionSelectState:(id)sender {
    if (countryID)
    {
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
         [api getState:countryID];

    }else
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select country first."];
        
        [self actionSelectCountry:self];

    }
}
- (IBAction)actionSelectCity:(id)sender {
    if (stateID)
    {
         [Helper showIndicatorWithText:@"Loading..." inView:self.view];
         [api getCityFromStateID:stateID flag:@"0"];
 
    }else
    {
        if (countryID)
        {
            [Helper showAlertViewWithTitle:ALERT message:@"Please select state first."];
             [self actionSelectState:self];
        }else
        {
            [Helper showAlertViewWithTitle:ALERT message:@"Please select country first."];
            
            [self actionSelectCountry:self];

        }
        
        
    }
}

- (IBAction)actionSelectNearCity:(id)sender {
    
    if (stateID)
    {
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        [api getNearCityFromStateID:stateID flag:@"1"];
    }else
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select state first."];
        
     }
   
    
}
- (IBAction)actionContinue:(id)sender {
    
    if (_txtField_Name.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your name."];
    }
    else if (_txtField_DOB.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your date of birth."];
    }
    else if(_txField_MblNo.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your mobile number."];
    }
    else if(_txtField_Email.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your email."];
    }
    else if ([Helper validateEmailWithString:_txtField_Email.text]==NO)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter valid email."];
    }
    else if (_txtField_Zip.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your zip code."];
    }
    else if ([Helper isInternetConnected]==NO)
    {
        [Helper showAlertViewWithTitle:OOPS message:INTERNET_ERROR];
    }else if (!countryID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select country."];
        [self actionSelectCountry:self];

     }
    else if (!stateID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select state."];
        
    }else if (!cityID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select city."];
        
    }else if (!nearCityID)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please select nearer city."];
        
    }


    else
    {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setObject:_txtField_Name.text forKey:@"name"];
        [dict setObject:@"UserRegister" forKey:@"type"];

        [dict setObject:_txtField_Email.text forKey:@"email"];
        [dict setObject:_txtField_DOB.text forKey:@"dob"];
        [dict setObject:_txField_MblNo.text forKey:@"mobile"];
        [dict setObject:_txtField_Zip.text forKey:@"zip"];
        [dict setObject:countryID forKey:@"Cid"];

        [dict setObject:stateID forKey:@"stateid"];
        [dict setObject:cityID forKey:@"cityid"];
        [dict setObject:nearCityID forKey:@"nearby"];
        
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        
        [api signUpWithDetail:dict];
    }

//    MainViewController *MainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
//    
//    [self.navigationController pushViewController:MainViewController animated:YES];
    
    
}

#pragma mark -- API's delegate Action
-(void)callBackCountry:(id)response
{
  
    NSMutableArray *arrCountry = [[NSMutableArray alloc]init];
    
    arrCountry=[response valueForKey:@"countryList"];
    
//    NSMutableArray *itmArr=[[NSMutableArray alloc]init];
//
//    for (NSDictionary * name in arrCountry)
//    {
//        [itmArr addObject:[name valueForKey:@"name"]];
//    }
    
     PopUpViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
    controller.itemArr=arrCountry;
    controller.itemStatus=REGISTERTYPE;
    [self addChildViewController:controller];
    controller.view.frame = self.view.bounds;
    controller.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
    
 
    
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
 

-(void)callBackNearCities:(id)response

{
    NSMutableArray *arrCity= [[NSMutableArray alloc]init];
    arrCity=[response valueForKey:@"citiesList"];
    
    NSLog(@"%lu",(unsigned long)arrCity.count);
    
    PopUpViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
    controller.itemArr=arrCity;
    controller.itemStatus=REGISTERNEARCITY;
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

-(void)callbackSignUpSuccess:(id)response
{
    NSLog(@"response is == %@",response);
    
     
    [Helper showAlertViewWithTitle:ALERT message:[response objectForKey:@"message"]];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    }

#pragma mark -- NOTIFICAION'S Delegate Action


-(void)SelectRegisterType:(NSNotification *)notification
{
    
    NSDictionary *dict=notification.object;
    
    NSLog(@"%@",dict);
    if (dict)
    {
        _lbl_Country.text=[dict valueForKey:@"name"];
        countryID=[dict valueForKey:@"id"];
    }
   
}
-(void)SelectCountryState:(NSNotification *)notification
{
    NSDictionary *dict=notification.object;
    
    NSLog(@"%@",dict);
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
        NSString* trimes = [[dict valueForKey:@"name"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [_btnSelectCity setTitle:trimes forState:UIControlStateNormal];
        cityID=[dict valueForKey:@"id"];
    }

}
-(void)SelectRegisterNearCity:(NSNotification *)notification

{
    NSDictionary *dict=notification.object;
    
    NSLog(@"%@",dict);
    if (dict)
    {
        _btnSelectNearCity.titleLabel.text=[dict valueForKey:@"name"];
        nearCityID=[dict valueForKey:@"id"];
    }
    

}

#pragma mark -- Button Action

-(void)doneTouchedAlter:(id)sender
{
    [self.txtField_DOB resignFirstResponder];
    
    [self updateDOB];
}

#pragma mark -- Helper methods

-(void)updateDOB
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    NSString *dateString = [dateFormat stringFromDate:datePicker.date];
    self.txtField_DOB.text=[NSString stringWithFormat:@"%@",dateString];
}

#pragma  mark - Textfield Delegate methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if(textField==self.txtField_DOB)
    {
        [self.txtField_DOB setInputView:datePicker];
        return YES;
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
         [textField resignFirstResponder];
     
    
    return YES;
}


-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

#pragma mark -- Memory Warning

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
