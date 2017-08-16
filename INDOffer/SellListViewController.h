//
//  SellListViewController.h
//  INDOffer
//
//  Created by Saurav on 01/08/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SellCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#import "Helper.h"
#import "WebAPI.h"
@interface SellListViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,APIsDelegate>
{
    NSMutableArray * arraySellList;
    WebAPI * api;
}

@property (strong, nonatomic) IBOutlet UICollectionView *collectioVw;

@end
