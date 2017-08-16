//
//  AddBizViewController.h
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"
#import "WebAPI.h"
@interface AddBizViewController : UIViewController<UITextFieldDelegate,APIsDelegate>
{
    WebAPI * api;
}
@property (strong, nonatomic) IBOutlet UITextField *txtField_Tittle;
@property (strong, nonatomic) IBOutlet UITextField *txtField_Desc;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Email;

@property (strong, nonatomic) IBOutlet UITextField *txtField_Url;

@end
