//
//  AddShopOfferViewController.m
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "AddShopOfferViewController.h"

@interface AddShopOfferViewController ()

@end

@implementation AddShopOfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    api = [[WebAPI alloc]init];
    api.delegate=self;
    
    datePicker= [[UIDatePicker alloc]init];
     datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(updateDOB:) forControlEvents:UIControlEventValueChanged];
    
    //barbutton item for picker
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 44)];
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouchedAlter:)];
    [toolBar setItems:[NSArray arrayWithObjects:flexButton,doneButton, nil]];
    self.txtField_OfferFrom.inputAccessoryView=toolBar;
    self.txtField_OfferTill.inputAccessoryView=toolBar;

    

    
}
- (IBAction)actionOfImages:(UIButton *)sender {
    if (sender.tag==0)
    {
    }else if (sender.tag==1)
    {
        
    }else if (sender.tag==2)
    {
        
    }else if (sender.tag==3)
    {
        
    }
    [Helper showAlertViewWithTitle:@"Alert" message:[NSString stringWithFormat:@"%ld",(long)sender.tag]];

}

- (IBAction)actionSubmit:(id)sender {
    
    if (_txtField_Tittle.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter the tittle."];
    }
    else if (_txtField_OfferFrom.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter start date."];
    } else if (_txtField_OfferTill.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter end date."];
        
    } else if (_txtField_Comment.text.length==0)
    {
        [Helper showAlertViewWithTitle:ALERT message:@"Please enter your comment."];
        
    } else
    {
       
     
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        
        [dict setObject:_txtField_Tittle.text forKey:@"name"];
        
        if ([[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"])
            [dict setObject:[[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"] forKey:@"userid"];
        
        [dict setObject:@"InsertShopOff" forKey:@"type"];
        [dict setObject:_txtField_OfferFrom.text forKey:@"fromdate"];
        
        [dict setObject:_txtField_OfferTill.text forKey:@"todate"];
        [dict setObject:_txtField_Comment.text forKey:@"comment"];
        if ([[NSUserDefaults standardUserDefaults]valueForKey:@"shopID"])
         [dict setObject:([[NSUserDefaults standardUserDefaults]valueForKey:@"shopID"]) forKey:@"shopid"];
        
        
        [api addShopOffer:dict];
        
        
    }
    

}
-(void)updateDOB:(UIDatePicker*)sender
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    NSString *dateString = [dateFormat stringFromDate:datePicker.date];
    if (sender.tag==0)
    {
        self.txtField_OfferFrom.text=[NSString stringWithFormat:@"%@",dateString];

    }else if (sender.tag==1)
    {
        self.txtField_OfferTill.text=[NSString stringWithFormat:@"%@",dateString];

    }
}
#pragma mark -- Api's Delegate Action
-(void)callbackShopOfferSuccess:(id)response
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
    
    [self.txtField_OfferFrom resignFirstResponder];
    [self.txtField_OfferTill resignFirstResponder];

    
    [self updateDOB:datePicker];
}
#pragma  mark - Textfield Delegate methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if(textField==self.txtField_OfferFrom)
    {
        datePicker.tag=0;
        [self.txtField_OfferFrom setInputView:datePicker];
        return YES;
    }else if(textField==self.txtField_OfferTill){
        datePicker.tag=1;
        [self.txtField_OfferTill setInputView:datePicker];
        return YES;
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_txtField_Tittle resignFirstResponder];
    [_txtField_Comment resignFirstResponder];
    [_txtField_OfferFrom resignFirstResponder];
    [_txtField_OfferTill resignFirstResponder];

}


- (IBAction)actionBackButton:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
