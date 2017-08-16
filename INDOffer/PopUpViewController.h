//
//  PopUpViewController.h
//  INDOffer
//
//  Created by Saurav on 22/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopTableViewCell.h"
#import "Constants.h"
@interface PopUpViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)NSMutableArray *itemArr;

@property (strong, nonatomic) IBOutlet UITableView *tblVw_PopUp;
@property (strong, nonatomic) IBOutlet NSString *itemStatus;



@end
