//
//  AddEventViewController.m
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()

@end

@implementation AddEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
// Date picker set up
    
    datePicker= [[UIDatePicker alloc]init];
     datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(updateDOB) forControlEvents:UIControlEventValueChanged];
    
    //barbutton item for picker
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 44)];
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouchedAlter:)];
    [toolBar setItems:[NSArray arrayWithObjects:flexButton,doneButton, nil]];
    self.txtField_EventDate.inputAccessoryView=toolBar;

    
    
    api = [[WebAPI alloc]init];
    api.delegate=self;
    
    if([[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"])
        Cid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Cid"];
    

}

- (IBAction)actionSubmit:(id)sender {
    
    if (_txtField_Tittle.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your tittle."];
    }
    else if (_txtField_Desc.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your description."];
    }
    else if(_txtField_EventDate.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your event date."];
    }
    else if(_txtField_Email.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your email."];
    }
    else if ([Helper validateEmailWithString:_txtField_Email.text]==NO)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter valid email."];
    } else if(_txtField_Url.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your url."];
    } else if(_txtField_Price.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your price."];
    }else
    {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        
             [dict setObject:_txtField_Tittle.text forKey:@"name"];
        
        if ([[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"])
            [dict setObject:[[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"] forKey:@"userid"];
        
        [dict setObject:@"InsertEvent" forKey:@"type"];
        [dict setObject:_txtField_Email.text forKey:@"email"];
        
        [dict setObject:_txtField_Desc.text forKey:@"desc"];
        [dict setObject:_txtField_EventDate.text forKey:@"eventdate"];
        [dict setObject:_txtField_Price.text forKey:@"price"];
        
        [dict setObject:_txtField_Url.text forKey:@"url"];
        
        
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        
        [api createEvent:dict];
 
    }

    
    
    NSLog(@"Submit Pressed");
    
}

- (IBAction)actionBackButton:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark -- API's delegate Action
-(void)callbackEventSuccess:(id)response
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
#pragma mark -- Button Action

-(void)doneTouchedAlter:(id)sender
{
    [self.txtField_EventDate resignFirstResponder];
    
    [self updateDOB];
}
#pragma mark -- Helper methods

-(void)updateDOB
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    NSString *dateString = [dateFormat stringFromDate:datePicker.date];
    self.txtField_EventDate.text=[NSString stringWithFormat:@"%@",dateString];
}



#pragma  mark - Textfield Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
    
    return YES;
}
#pragma  mark - Textfield Delegate methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if(textField==self.txtField_EventDate)
    {
        [self.txtField_EventDate setInputView:datePicker];
        return YES;
    }
    return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_txtField_Tittle resignFirstResponder];
    [_txtField_Desc resignFirstResponder];
    [_txtField_Email resignFirstResponder];
    [_txtField_Url resignFirstResponder];
    [_txtField_EventDate resignFirstResponder];
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
