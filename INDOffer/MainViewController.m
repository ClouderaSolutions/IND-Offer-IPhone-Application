//
//  MainViewController.m
//  INDOffer
//
//  Created by Saurav on 18/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "MainViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BottomBar *bottomBar = [[BottomBar alloc]init];
    [bottomBar showBottomBar:self.tabBarController];
    
    api=[[WebAPI alloc]init];
    api.delegate=self;
    
    [self getshopList];
    shopListArr=[[NSMutableArray alloc]init];
    
    _btn_GetOffer.layer.cornerRadius=10;
    _btn_AddOffer.layer.cornerRadius=10;
    
    _clothingLbl.adjustsFontSizeToFitWidth=YES;

    _sponserView.layer.cornerRadius=12.5;
    _sponserView.clipsToBounds=YES;
    
    [_groceryLbl setTextColor:[Helper colorFromHexString:@"64AD35"]];
    [_groceryIcon setImage:[UIImage imageNamed:@"grocerySel.png"]];
    
    // Do any additional setup after loading the view.
}

#pragma mark -- Action methods

- (IBAction)actionGetOffer:(id)sender {
    
    GetOfferViewController *getOfferController = [self.storyboard instantiateViewControllerWithIdentifier:@"GetOfferViewController"];
    
    [self.navigationController pushViewController:getOfferController animated:YES];
}

- (IBAction)actionAddOffer:(id)sender {
    
    AddOfferViewController *addOfferViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddOfferViewController"];
    
    [self.navigationController pushViewController:addOfferViewController animated:YES];

}

- (IBAction)actionOfButtons:(UIButton *)sender
{
    if (sender.tag==0)
    {
        NSLog(@"Grocery");
        
        shopTyp=@"G";
        
        [_groceryLbl setTextColor:[Helper colorFromHexString:@"64AD35"]];
        [_groceryIcon setImage:[UIImage imageNamed:@"grocerySel.png"]];
        
        [_restaurantLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_restaurantIcon setImage:[UIImage imageNamed:@"restaurant.png"]];
        
        [_clothingLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_clothingIcon setImage:[UIImage imageNamed:@"clothing.png"]];
        
        [_eventsLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_eventsIcon setImage:[UIImage imageNamed:@"events.png"]];
        
         
    }else if (sender.tag==1)
    {
        NSLog(@"Restaurant");
        shopTyp=@"R";
        
        [_groceryLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_groceryIcon setImage:[UIImage imageNamed:@"grocery-dark.png"]];
        
        [_restaurantLbl setTextColor:[Helper colorFromHexString:@"64AD35"]];
        [_restaurantIcon setImage:[UIImage imageNamed:@"restraunt-green.png"]];
        
        [_clothingLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_clothingIcon setImage:[UIImage imageNamed:@"clothing.png"]];
        
        [_eventsLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_eventsIcon setImage:[UIImage imageNamed:@"events.png"]];


    }else if (sender.tag==2)
    {
        NSLog(@"Clothing");
        shopTyp=@"O";
        
        [_groceryLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_groceryIcon setImage:[UIImage imageNamed:@"grocery-dark.png"]];
        
        [_restaurantLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_restaurantIcon setImage:[UIImage imageNamed:@"restaurant.png"]];
        
        [_clothingLbl setTextColor:[Helper colorFromHexString:@"64AD35"]];
        [_clothingIcon setImage:[UIImage imageNamed:@"clothing-green.png"]];
        
        [_eventsLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_eventsIcon setImage:[UIImage imageNamed:@"events.png"]];
        
        
    }else if (sender.tag==3)
    {
        
      //  [Helper showAlertViewWithTitle:ALERT message:@"In work"];
        NSLog(@"Event");
        shopTyp=@"O";
        
        [_groceryLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_groceryIcon setImage:[UIImage imageNamed:@"grocery-dark.png"]];
        
        [_restaurantLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_restaurantIcon setImage:[UIImage imageNamed:@"restaurant.png"]];
        
        [_clothingLbl setTextColor:[Helper colorFromHexString:@"868585"]];
        [_clothingIcon setImage:[UIImage imageNamed:@"clothing.png"]];
        
        [_eventsLbl setTextColor:[Helper colorFromHexString:@"64AD35"]];
        [_eventsIcon setImage:[UIImage imageNamed:@"events-green.png"]];

    }
    [self getshopList];

}

-(void)getshopList
{
    if (shopTyp)
    {
        [Helper showIndicatorWithText:@"Loading..." inView:self.view];
        
        [api getShopList:shopTyp];
     }else
     {
         [Helper showIndicatorWithText:@"Loading..." inView:self.view];
         
         [api getShopList:@"G"];
     }
}
- (IBAction)actionOfTabButtons:(UIButton *)sender {
    
    /*if (sender.tag==0)
    {
        NSLog(@"Shop");
        
    }else if (sender.tag==1)
    {
        NSLog(@"Property");
        
        PropertyListViewController *propertyListViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PropertyListViewController"];
        [self.navigationController pushViewController:propertyListViewController animated:YES];


    }else if (sender.tag==2)
    {
        NSLog(@"Sell");
        SellListViewController *sellListViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SellListViewController"];
        [self.navigationController pushViewController:sellListViewController animated:YES];

    }else if (sender.tag==3)
    {
        NSLog(@"Biz/Event");
        
        EventBizViewController *eventBizViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"EventBizViewController"];
        [self.navigationController pushViewController:eventBizViewController animated:YES];

    }*/
}



#pragma mark -- CollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return shopListArr.count;
}

 - (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"MainCollectionViewCell";
    
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (indexPath.item==0 || indexPath.item==1)
    {
        cell.mapIcon.hidden=NO;
        cell.discount.hidden=NO;
    }
    else
    {
        cell.mapIcon.hidden=YES;
        cell.discount.hidden=YES;
    }
    
    [cell.imgVw_Item sd_setImageWithURL:[NSURL URLWithString:[[shopListArr objectAtIndex:indexPath.row]valueForKey:@"logo"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image)
        {
            cell.imgVw_Item.image=image;
        }
    }];
    
    NSString * adressName=[NSString stringWithFormat:@"%@, %@, %@",[[shopListArr objectAtIndex:indexPath.row]valueForKey:@"name"],[[shopListArr objectAtIndex:indexPath.row]valueForKey:@"address"],[[shopListArr objectAtIndex:indexPath.row]valueForKey:@"city"]];
    
    cell.lbl_Item.text=adressName;
    cell.lbl_Item.adjustsFontSizeToFitWidth=true;
    
     return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailShopViewController *controllerDetailShop = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailShopViewController"];
    controllerDetailShop.dictShopDetail=[shopListArr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controllerDetailShop animated:YES];

    NSLog(@"%ld",(long)indexPath.item);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width-1)/2, 120);
}
#pragma mark -- Api's Delegate Action
-(void)callbackShopList:(id)response
{
    NSLog(@"%@",response);
    
    shopListArr=[response valueForKey:@"shopList"];
    
    NSLog(@"%@",shopListArr);
    
    [_collectionVw reloadData];
    
}
-(void)callbackFromAPI:(id)response
{
    [Helper hideIndicatorFromView:self.view];
}

#pragma mark -- Navigation Button Action
- (IBAction)actionMenuPressed:(UIButton *)sender {
    [Helper showAlertViewWithTitle:ALERT message:@"MENU"];

}
- (IBAction)actionSearchPressed:(UIButton *)sender {
    [Helper showAlertViewWithTitle:ALERT message:@"SEARCH"];

}
- (IBAction)actionNotificationPressed:(id)sender {
    [Helper showAlertViewWithTitle:ALERT message:@"NOTIFICATION"];

}
- (IBAction)actionSharingPressed:(UIButton *)sender {
    [Helper showAlertViewWithTitle:ALERT message:@"SHARE"];

}

#pragma mark -- Memory Warning

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
