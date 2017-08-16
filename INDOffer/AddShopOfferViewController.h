//
//  AddShopOfferViewController.h
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"
#import "Constants.h"
#import "WebAPI.h"
@interface AddShopOfferViewController : UIViewController<UITextFieldDelegate,APIsDelegate>
{
    WebAPI * api;
    UIDatePicker *datePicker;

}

@property (strong, nonatomic) IBOutlet UITextField *txtField_Tittle;

@property (strong, nonatomic) IBOutlet UITextField *txtField_OfferFrom;

@property (strong, nonatomic) IBOutlet UITextField *txtField_OfferTill;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Comment;

@end
