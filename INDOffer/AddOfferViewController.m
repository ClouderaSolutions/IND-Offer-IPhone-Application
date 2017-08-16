//
//  AddOfferViewController.m
//  INDOffer
//
//  Created by Saurav on 21/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "AddOfferViewController.h"

@interface AddOfferViewController ()

@end

@implementation AddOfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"Shopid"])
    {
        _btn_Shop.hidden=true;
        _btn_PatelBrother.hidden=false;

    }else
    {
        _btn_Shop.hidden=false;
        _btn_PatelBrother.hidden=true;

    }
    // Do any additional setup after loading the view.
}

 

- (IBAction)actionaddOfferEvent:(UIButton *)sender {
    
    
    if (sender.tag==0)
    {
        NSLog(@"SHOP");
        
        AddShopViewController *addShopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddShopViewController"];
        
        [self.navigationController pushViewController:addShopViewController animated:YES];
        

    }else if (sender.tag==1)
    {
        AddShopOfferViewController *addShopOfferViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddShopOfferViewController"];
        
        [self.navigationController pushViewController:addShopOfferViewController animated:YES];
        

        NSLog(@"PATEL BROTHERS");

    }else if (sender.tag==2)
    {
        AddPropertyViewController *addPropertyViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddPropertyViewController"];
        
        [self.navigationController pushViewController:addPropertyViewController animated:YES];
        

        NSLog(@"PROPERTY");
        
    }else if (sender.tag==3)
    {
        AddSellViewController *addSellViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddSellViewController"];
        
        [self.navigationController pushViewController:addSellViewController animated:YES];
        

        NSLog(@"SELL");
        
    }else if (sender.tag==4)
    {
        AddBizViewController *addBizViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddBizViewController"];
        
        [self.navigationController pushViewController:addBizViewController animated:YES];
        
 
        NSLog(@"BIZ");
        
    }else if (sender.tag==5)
    {
        
        AddEventViewController *addEventViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddEventViewController"];
        
        [self.navigationController pushViewController:addEventViewController animated:YES];
        

        NSLog(@"EVENT");
        
    }
    
}

- (IBAction)actionBackButton:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
