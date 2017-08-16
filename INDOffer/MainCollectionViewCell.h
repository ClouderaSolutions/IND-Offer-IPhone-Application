//
//  MainCollectionViewCell.h
//  INDOffer
//
//  Created by Saurav on 19/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgVw_Item;
@property (strong, nonatomic) IBOutlet UIImageView *mapIcon;
@property (strong, nonatomic) IBOutlet UILabel *discount;

@property (strong, nonatomic) IBOutlet UILabel *lbl_Item;


@end
