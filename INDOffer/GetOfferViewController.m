//
//  GetOfferViewController.m
//  INDOffer
//
//  Created by Saurav on 19/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "GetOfferViewController.h"

@interface GetOfferViewController ()

@end

@implementation GetOfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)actionGetInsurance:(id)sender {
    
    GetInsuranceViewController *getInsuranceController = [self.storyboard instantiateViewControllerWithIdentifier:@"GetInsuranceViewController"];
    
    [self.navigationController pushViewController:getInsuranceController animated:YES];

    
}

- (IBAction)actionProperty:(id)sender {
    
    GetPropertyViewController *getPropertyController = [self.storyboard instantiateViewControllerWithIdentifier:@"GetPropertyViewController"];
    
    [self.navigationController pushViewController:getPropertyController animated:YES];
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
