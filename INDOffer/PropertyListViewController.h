//
//  PropertyListViewController.h
//  INDOffer
//
//  Created by Saurav on 31/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PropertyTableViewCell.h"
#import "Constants.h"
#import "Helper.h"
#import "WebAPI.h"
@interface PropertyListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,APIsDelegate>
{
    WebAPI * api;
    NSMutableArray * propList;
}
@property (strong, nonatomic) IBOutlet UITableView *tblVw;


@property (strong, nonatomic) IBOutlet UIButton *btnLease;
@property (strong, nonatomic) IBOutlet UIButton *btnPurchase;

@end
