//
//  AddEventViewController.h
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"
#import "WebAPI.h"
@interface AddEventViewController : UIViewController<UITextFieldDelegate,APIsDelegate>
{
    WebAPI * api;
    
    NSString * Cid;
    UIDatePicker *datePicker;

}

@property (strong, nonatomic) IBOutlet UITextField *txtField_Tittle;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Desc;

@property (strong, nonatomic) IBOutlet UITextField *txtField_EventDate;
@property (strong, nonatomic) IBOutlet UITextField *txtField_Email;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Url;
@property (strong, nonatomic) IBOutlet UITextField *txtField_Price;

@end
