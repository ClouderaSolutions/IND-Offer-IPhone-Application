//
//  RegisterViewController.h
//  INDOffer
//
//  Created by Saurav on 17/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "WebAPI.h"
#import "Helper.h"
@interface RegisterViewController : UIViewController<UITextFieldDelegate>
{
    UIDatePicker *datePicker;
    WebAPI *api;
    NSString * countryID,*stateID,*cityID,*nearCityID;
}

@property (strong, nonatomic) IBOutlet UITextField *txtField_Name;

@property (strong, nonatomic) IBOutlet UITextField *txtField_DOB;
@property (strong, nonatomic) IBOutlet UITextField *txField_MblNo;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Email;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Zip;

@property (strong, nonatomic) IBOutlet UIButton *btnCountry;
@property (strong, nonatomic) IBOutlet UIButton *btnState;
 
@property (strong, nonatomic) IBOutlet UILabel *lbl_Country;
@property (strong, nonatomic) IBOutlet UILabel *lbl_State;

@property (strong, nonatomic) IBOutlet UIButton *btnSelectCity;
@property (strong, nonatomic) IBOutlet UIButton *btnSelectNearCity;
@property (strong, nonatomic) IBOutlet UIButton *btnContinue;


@end
