//
//  PropertyTableViewCell.h
//  INDOffer
//
//  Created by Saurav on 31/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *lbl_PropertyTittle;
@property (strong, nonatomic) IBOutlet UILabel *lbl_StateCity;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Price;
@property (strong, nonatomic) IBOutlet UIButton *btn_ViewDetails;


@end
