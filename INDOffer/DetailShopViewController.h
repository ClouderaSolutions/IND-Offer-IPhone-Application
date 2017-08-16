//
//  DetailShopViewController.h
//  INDOffer
//
//  Created by Saurav on 31/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailShopTableViewCell.h"
@interface DetailShopViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property(strong,nonatomic)NSDictionary * dictShopDetail;

@property (strong, nonatomic) IBOutlet UILabel *lbl_shopTittle;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Timing;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Adress;

@property (strong, nonatomic) IBOutlet UITableView *tblVw;



@end
