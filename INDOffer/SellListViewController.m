//
//  SellListViewController.m
//  INDOffer
//
//  Created by Saurav on 01/08/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "SellListViewController.h"

@interface SellListViewController ()

@end

@implementation SellListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    api=[[WebAPI alloc]init];
    api.delegate=self;
    
    [Helper showIndicatorWithText:@"Loading..." inView:self.view];
    [api sellListProperty];
    // Do any additional setup after loading the view.
}


#pragma mark -- CollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return arraySellList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"SellCollectionViewCell";
    
    SellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    [cell.imgVwItem sd_setImageWithURL:[NSURL URLWithString:[[arraySellList objectAtIndex:indexPath.row]valueForKey:@"logo"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image)
        {
            cell.imgVwItem.image=image;
        }
    }];
    cell.lbl_Price.text=[[arraySellList objectAtIndex:indexPath.row]valueForKey:@"price"];
    cell.lbl_Price.adjustsFontSizeToFitWidth=true;
    
    cell.layer.borderColor=[UIColor yellowColor].CGColor;
    cell.layer.borderWidth=1;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld",(long)indexPath.item);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/2, 195);
}
#pragma mark -- Api's Delegate Action
-(void)callbackSellPropertyList:(id)response
{
    NSLog(@"%@",response);
    
    arraySellList=[response valueForKey:@"sellList"];
    
    NSLog(@"%@",arraySellList);
    
    [_collectioVw reloadData];
    
}
-(void)callbackFromAPI:(id)response
{
    [Helper hideIndicatorFromView:self.view];
}

- (IBAction)actionBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:TRUE];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
