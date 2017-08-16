//
//  PopUpViewController.m
//  INDOffer
//
//  Created by Saurav on 22/07/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "PopUpViewController.h"

@interface PopUpViewController ()

@end

@implementation PopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tblVw_PopUp.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tblVw_PopUp.separatorStyle = UITableViewCellSeparatorStyleNone;

    // Do any additional setup after loading the view.
}

#pragma mark -- TableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _itemArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PopTableViewCell"];
    
    //UILabel *nameRes = [cell viewWithTag:1];
    if ([_itemStatus isEqualToString:REGISTERTYPE])
    {
        cell.lbl_Item.text=[[_itemArr objectAtIndex:indexPath.row]valueForKey:@"name"];

    }else if ([_itemStatus isEqualToString:COUNTRYSTATE])
    {
        cell.lbl_Item.text=[[_itemArr objectAtIndex:indexPath.row]valueForKey:@"name"];
        
    }else if ([_itemStatus isEqualToString:COUNTRYCITY])
    {
        cell.lbl_Item.text=[[_itemArr objectAtIndex:indexPath.row]valueForKey:@"name"];
        
    }
    else if ([_itemStatus isEqualToString:REGISTERNEARCITY])
    {
        cell.lbl_Item.text=[[_itemArr objectAtIndex:indexPath.row]valueForKey:@"name"];
        
    }else if ([_itemStatus isEqualToString:INSURANCETYPE])
    {
        cell.lbl_Item.text=[[_itemArr objectAtIndex:indexPath.row]valueForKey:@"name"];

    }

    else
    {
        cell.lbl_Item.text=[_itemArr objectAtIndex:indexPath.row];

    }
    
     return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_itemStatus isEqualToString:SHOPTYPE])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectShopType" object:[_itemArr objectAtIndex:indexPath.row]];
        [self removePopView];

    }else if ([_itemStatus isEqualToString:INSURANCETYPE])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectInsuranceType" object:[_itemArr objectAtIndex:indexPath.row]];
        [self removePopView];

    }else if ([_itemStatus isEqualToString:PROPERTYTYPE])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectPropertyType" object:[_itemArr objectAtIndex:indexPath.row]];
        [self removePopView];
        
    }
    else if ([_itemStatus isEqualToString:REGISTERTYPE])
    {
          [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectRegisterType" object:[_itemArr objectAtIndex:indexPath.row]];
        [self removePopView];
     }
    else if ([_itemStatus isEqualToString:COUNTRYSTATE])
    {
          [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectCountryState" object:[_itemArr objectAtIndex:indexPath.row]];
        [self removePopView];
     }
    else if ([_itemStatus isEqualToString:COUNTRYCITY])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectCountryCity" object:[_itemArr objectAtIndex:indexPath.row]];
        [self removePopView];
    }
    else if ([_itemStatus isEqualToString:REGISTERNEARCITY])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"REGISTERNEARCITY" object:[_itemArr objectAtIndex:indexPath.row]];
        [self removePopView];
    }
    


    
    
    NSLog(@"%ld",(long)indexPath.row);
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removePopView];
    
}

-(void)removePopView
{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
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
