//
//  GetInsuranceViewController.h
//  INDOffer
//
//  Created by Saurav on 19/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
 #import "Constants.h"
#import "Helper.h"
#import "PopUpViewController.h"
#import "WebAPI.h"
@interface GetInsuranceViewController : UIViewController<UITextFieldDelegate,APIsDelegate>

{
    WebAPI * api;
    NSString * stateID,*Cid,*cityID,*insuranceID;
}
@property (strong, nonatomic) IBOutlet UILabel *lbl_InsuranceType;

@property (strong, nonatomic) IBOutlet UITextField *txtField_PhnNum;

@property (strong, nonatomic) IBOutlet UILabel *lbl_SelectState;

@property (strong, nonatomic) IBOutlet UIButton *btnSelectCity;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Comment;


@end
