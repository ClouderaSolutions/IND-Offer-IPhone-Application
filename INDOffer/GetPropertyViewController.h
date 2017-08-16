//
//  GetPropertyViewController.h
//  INDOffer
//
//  Created by Saurav on 19/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
 #import "PopUpViewController.h"
#import "WebAPI.h"
@interface GetPropertyViewController : UIViewController<UITextFieldDelegate,APIsDelegate>
{
    WebAPI * api;
    
    NSString * stateID,*Cid,*cityID,*agrrementStr,*proptype;
}
@property (strong, nonatomic) IBOutlet UIView *vw_Lease;
@property (strong, nonatomic) IBOutlet UIButton *btn_Lease;
@property (strong, nonatomic) IBOutlet UIView *vw_Sell;
@property (strong, nonatomic) IBOutlet UIButton *btn_Seal;


@property (strong, nonatomic) IBOutlet UITextField *txtField_PhnNum;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Budjet;

@property (strong, nonatomic) IBOutlet UILabel *lbl_PropertyType;
@property (strong, nonatomic) IBOutlet UIButton *btnPropertyTyp;
@property (strong, nonatomic) IBOutlet UILabel *lbl_State;
@property (strong, nonatomic) IBOutlet UIButton *btn_StateTyp;

@property (strong, nonatomic) IBOutlet UIButton *btnCity;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Comment;


@end
