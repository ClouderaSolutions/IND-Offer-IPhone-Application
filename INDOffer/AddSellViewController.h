//
//  AddSellViewController.h
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"
#import "WebAPI.h"
#import "PopUpViewController.h"
@interface AddSellViewController : UIViewController<UITextFieldDelegate,APIsDelegate>

{
    WebAPI * api;
    NSString * stateID,*Cid,*cityID;
    
}

@property (strong, nonatomic) IBOutlet UILabel *lbl_State;

@property (strong, nonatomic) IBOutlet UIButton *btnSelectCity;



@property (strong, nonatomic) IBOutlet UITextField *txtField_Tittle;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Price;
@property (strong, nonatomic) IBOutlet UITextField *txtField_Comment;
@property (strong, nonatomic) IBOutlet UITextField *txtField_Zip;



@end
