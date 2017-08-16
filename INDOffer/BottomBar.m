//
//  BottomBar.m
//  infoApp
//
//  Created by HashBrown Systems on 05/09/14.
//  Copyright (c) 2014 Hashbrown Systems Pvt Ltd. All rights reserved.
//

#import "BottomBar.h"

@implementation BottomBar

-(void)showBottomBar:(UITabBarController *)tabBarController
{
    UIImage *selectedImage0 = [UIImage imageNamed:@"shop_selected.png"];
    UIImage *unselectedImage0 = [UIImage imageNamed:@"shop_white.png"];
    
    UIImage *selectedImage1 = [UIImage imageNamed:@"property_selected.png"];
    UIImage *unselectedImage1 = [UIImage imageNamed:@"property_white.png"];
    
    UIImage *selectedImage2 = [UIImage imageNamed:@"sell_selected.png"];
    UIImage *unselectedImage2 = [UIImage imageNamed:@"sell_white.png"];
    
    UIImage *selectedImage3 = [UIImage imageNamed:@"business_selected.png"];
    UIImage *unselectedImage3 = [UIImage imageNamed:@"business_white.png"];
    
    //UIImage *selectedImage4 = [UIImage imageNamed:@"request_blue.png"];
    //UIImage *unselectedImage4 = [UIImage imageNamed:@"request_gray.png"];
    
    selectedImage0 = [selectedImage0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    unselectedImage0 = [unselectedImage0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selectedImage1 = [selectedImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    unselectedImage1 = [unselectedImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selectedImage2 = [selectedImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    unselectedImage2 = [unselectedImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selectedImage3 = [selectedImage3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    unselectedImage3 = [unselectedImage3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //selectedImage4 = [selectedImage4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //unselectedImage4 = [unselectedImage4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabBar.items objectAtIndex:3];
    //UITabBarItem *item4 = [tabBar.items objectAtIndex:4];
    
    item0.image=unselectedImage0;
    item1.image=unselectedImage1;
    item2.image=unselectedImage2;
    item3.image=unselectedImage3;
    //item4.image=unselectedImage4;
    
    item0.title=@"";
    item1.title=@"";
    item2.title=@"";
    item3.title=@"";
    //item4.title=@"";
    
    item0.selectedImage=selectedImage0;
    item1.selectedImage=selectedImage1;
    item2.selectedImage=selectedImage2;
    item3.selectedImage=selectedImage3;
    //item4.selectedImage=selectedImage4;
    
    item0.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item1.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item2.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item3.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    //item4.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
}

@end
