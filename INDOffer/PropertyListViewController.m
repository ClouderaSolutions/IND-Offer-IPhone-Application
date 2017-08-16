//
//  PropertyListViewController.m
//  INDOffer
//
//  Created by Saurav on 31/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "PropertyListViewController.h"

@interface PropertyListViewController ()

@end

@implementation PropertyListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    api=[[WebAPI alloc]init];
    api.delegate=self;
    
    _tblVw.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    propList=[[NSMutableArray alloc]init];
    
   // [self apiProperty:@"L"];
    // Do any additional setup after loading the view.
}
#pragma mark -- TableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return propList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PropertyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PropertyTableViewCell"];
    cell.lbl_PropertyTittle.text=[[propList objectAtIndex:indexPath.row]valueForKey:@"name"];
    cell.lbl_Price.text=[NSString stringWithFormat:@"$ %@",[[propList objectAtIndex:indexPath.row]valueForKey:@"price"]];
    cell.lbl_StateCity.text=[NSString stringWithFormat:@"%@,%@",[[propList objectAtIndex:indexPath.row]valueForKey:@"city"],[[propList objectAtIndex:indexPath.row]valueForKey:@"state"]];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}
- (IBAction)actionLeaseNPurchase:(UIButton *)sender {
       if (sender.tag==0)
    {
        _btnLease.backgroundColor=LIGHTBLUE;
        _btnPurchase.backgroundColor=LIGHTYELLOW;
        
        [self apiProperty:@"L"];
    }else if (sender.tag==1)
    {
        _btnPurchase.backgroundColor=LIGHTBLUE;
        _btnLease.backgroundColor=LIGHTYELLOW;
        [self apiProperty:@"P"];

    }
    
 }
-(void)apiProperty:(NSString*)agreementStr
{
    [Helper showIndicatorWithText:@"Loading..." inView:self.view];

    [api propertyListLeasePurchase:agreementStr];
}
#pragma mark -- Api's Delegate Action
-(void)callbackPropertyLeasePurchaseList:(id)response
{
    NSLog(@"%@",response);
    propList=[response valueForKey:@"propertyList"];
    [_tblVw reloadData];
    NSLog(@"%@",propList);
 }
-(void)callbackFromAPI:(id)response
{
    [Helper hideIndicatorFromView:self.view];
}

- (IBAction)actionBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)actionSearch:(id)sender {
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
