//
//  AddPropertyViewController.h
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"
#import "Constants.h"
#import "WebAPI.h"
#import "PopUpViewController.h"
@interface AddPropertyViewController : UIViewController<UITextFieldDelegate,APIsDelegate>
{
    WebAPI * api;
    NSString * stateID,*Cid,*cityID,*propertyType,*getType,*agrrementStr;

}

@property (strong, nonatomic) IBOutlet UILabel *lblProperty_Type;
@property (strong, nonatomic) IBOutlet UILabel *lbl_State;


@property (strong, nonatomic) IBOutlet UITextField *txtField_Title;
@property (strong, nonatomic) IBOutlet UITextField *txtField_Price;
@property (strong, nonatomic) IBOutlet UITextField *txtField_Comment;

@property (strong, nonatomic) IBOutlet UIButton *btnSelectCity;


@property (strong, nonatomic) IBOutlet UIView *vwLease;
@property (strong, nonatomic) IBOutlet UIButton *btnLease;

@property (strong, nonatomic) IBOutlet UIView *vw_Seal;
@property (strong, nonatomic) IBOutlet UIButton *btnSeal;

@end
