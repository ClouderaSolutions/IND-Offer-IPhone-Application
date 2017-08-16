//
//  DetailShopTableViewCell.h
//  INDOffer
//
//  Created by Saurav on 31/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailShopTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *lbl_DayOff;
@property (strong, nonatomic) IBOutlet UILabel *lbl_FromDate;
@property (strong, nonatomic) IBOutlet UILabel *lbl_ToDate;
@property (strong, nonatomic) IBOutlet UILabel *lbl_NoOfViews;
@property (strong, nonatomic) IBOutlet UIButton *btnViewOffer;

@end
