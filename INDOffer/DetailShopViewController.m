//
//  DetailShopViewController.m
//  INDOffer
//
//  Created by Saurav on 31/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "DetailShopViewController.h"

@interface DetailShopViewController ()

@end

@implementation DetailShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self shopDetailFromDict];
    
    _tblVw.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
  //  _tblVw.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view.
}
- (IBAction)actionBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}
#pragma mark -- TableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailShopTableViewCell"];
    
    return cell;

}
-(void)shopDetailFromDict
{
 
    NSLog(@"%@",_dictShopDetail);
    
    _lbl_shopTittle.text=[_dictShopDetail valueForKey:@"name"];
    _lbl_Timing.text=[_dictShopDetail valueForKey:@"timing"];
    
    NSString * adress=[NSString stringWithFormat:@"%@,%@-,%@,%@",[_dictShopDetail valueForKey:@"address"],[_dictShopDetail valueForKey:@"city"],[_dictShopDetail valueForKey:@"zip"],[_dictShopDetail valueForKey:@"state"]];
    _lbl_Adress.text=adress;
    _lbl_Adress.adjustsFontSizeToFitWidth=true;
    
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
