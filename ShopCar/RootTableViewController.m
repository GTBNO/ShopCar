//
//  RootTableViewController.m
//  ShopCar
//
//  Created by lanou on 16/2/25.
//  Copyright © 2016年 guantianbu. All rights reserved.
//

#import "RootTableViewController.h"
#import "SignleSelectTableViewController.h"
#import "MutibleSelectTableViewController.h"
#import "PriceTableViewController.h"

@interface RootTableViewController ()

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        SignleSelectTableViewController *SingleVC = [[SignleSelectTableViewController alloc]initWithNibName:@"SignleSelectTableViewController" bundle:nil];
        [self.navigationController pushViewController:SingleVC animated:YES];
    }
    else if (indexPath.row == 0) {
        MutibleSelectTableViewController *vc = [[MutibleSelectTableViewController alloc]initWithNibName:@"MutibleSelectTableViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        PriceTableViewController *vc = [PriceTableViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

@end
