//
//  EventBizViewController.m
//  INDOffer
//
//  Created by Saurav on 01/08/17.
//  Copyright © 2017 Techeclat. All rights reserved.
//

#import "EventBizViewController.h"

@interface EventBizViewController ()

@end

@implementation EventBizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    api=[[WebAPI alloc]init];
    api.delegate=self;
    // Do any additional setup after loading the view.
}
- (IBAction)actionBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:TRUE];
}
 
- (IBAction)actionEventBiz:(UIButton *)sender {
}



#pragma mark -- TableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrEBList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventBizTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventBizTableViewCell"];
    
    
//    cell.lbl_PropertyTittle.text=[[propList objectAtIndex:indexPath.row]valueForKey:@"name"];
//    cell.lbl_Price.text=[NSString stringWithFormat:@"$ %@",[[propList objectAtIndex:indexPath.row]valueForKey:@"price"]];
//    cell.lbl_StateCity.text=[NSString stringWithFormat:@"%@,%@",[[propList objectAtIndex:indexPath.row]valueForKey:@"city"],[[propList objectAtIndex:indexPath.row]valueForKey:@"state"]];
//    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 135;
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
