//
//  MainViewController.h
//  INDOffer
//
//  Created by Saurav on 18/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetOfferViewController.h"
#import "MainCollectionViewCell.h"
#import "AddOfferViewController.h"
#import "DetailShopViewController.h"
#import "BottomBar.h"
#import "Helper.h"
#import "WebAPI.h"
@interface MainViewController : UIViewController<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,APIsDelegate>
{
    WebAPI * api;
    NSString* shopTyp;
    
    NSMutableArray * shopListArr;
}
@property (strong, nonatomic) IBOutlet UICollectionView *collectionVw;

@property (strong, nonatomic) IBOutlet UIButton *btn_GetOffer;

@property (strong, nonatomic) IBOutlet UIButton *btn_AddOffer;
@property (strong, nonatomic) IBOutlet UIView *sponserView;
@property (strong, nonatomic) IBOutlet UIButton *btnGrocery;
@property (strong, nonatomic) IBOutlet UILabel *clothingLbl;
@property (strong, nonatomic) IBOutlet UIImageView *groceryIcon;
@property (strong, nonatomic) IBOutlet UILabel *groceryLbl;
@property (strong, nonatomic) IBOutlet UIImageView *restaurantIcon;
@property (strong, nonatomic) IBOutlet UILabel *restaurantLbl;
@property (strong, nonatomic) IBOutlet UIImageView *clothingIcon;
@property (strong, nonatomic) IBOutlet UIImageView *eventsIcon;

@property (strong, nonatomic) IBOutlet UIButton *btnRest;
@property (strong, nonatomic) IBOutlet UILabel *eventsLbl;
@property (strong, nonatomic) IBOutlet UIButton *btnOther;
@property (strong, nonatomic) IBOutlet UIButton *btnEvent;

@end
