//
//  AddShopViewController.h
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopUpViewController.h"
#import "Constants.h"
#import "Helper.h"
#import "WebAPI.h"
 
@interface AddShopViewController : UIViewController<UITextFieldDelegate,APIsDelegate>
{
    WebAPI * api;
    NSString * stateID,*Cid,*cityID;
    NSString * shopID;
}
@property (strong,nonatomic) UITextField * txtField;
@property (strong, nonatomic) IBOutlet UILabel *lblShopType;
@property (strong, nonatomic) IBOutlet UITextField *txtField_ShopNm;
@property (strong, nonatomic) IBOutlet UITextField *txtField_Adress;

@property (strong, nonatomic) IBOutlet UILabel *lbl_ShopState;
@property (strong, nonatomic) IBOutlet UIButton *btn_SelectCity;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Zip;

@end
