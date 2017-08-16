//
//  EventBizViewController.h
//  INDOffer
//
//  Created by Saurav on 01/08/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventBizTableViewCell.h"
#import "Helper.h"
#import "WebAPI.h"
 @interface EventBizViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    WebAPI * api;
    NSMutableArray * arrEBList;
}
@property (strong, nonatomic) IBOutlet UIButton *btnEvent;
@property (strong, nonatomic) IBOutlet UIButton *btnBiz;

@end
