//
//  EventBizTableViewCell.h
//  INDOffer
//
//  Created by Saurav on 01/08/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventBizTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lbl_Tittle;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Desc;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Email;

@property (strong, nonatomic) IBOutlet UILabel *lbl_Link;

@property (strong, nonatomic) IBOutlet UILabel *lbl_Price;

@property (strong, nonatomic) IBOutlet UILabel *lbl_AttendingNo;
@property (strong, nonatomic) IBOutlet UIButton *btnAttend;

@end
