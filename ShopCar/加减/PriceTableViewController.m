//
//  PriceTableViewController.m
//  ShopCar
//
//  Created by lanou on 16/2/26.
//  Copyright © 2016年 guantianbu. All rights reserved.
//

#import "PriceTableViewController.h"
#import "PriceTableViewCell.h"
#import "priceModel.h"

@interface PriceTableViewController ()

@property (nonatomic, strong)NSMutableArray *dataArr;
@property (nonatomic, assign)NSInteger totalPrice;

@property (nonatomic, strong)UILabel *label;

@end

@implementation PriceTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArr = [NSMutableArray array];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PriceTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier: @"PriceReuse"];
    
    for (NSInteger i = 0; i < 4; i++) {
        priceModel *model = [priceModel new];
        model.price = 10 + i;
        model.count = 1;
        [_dataArr addObject:model];
    }
    
    [self calculateTotalPrice];
       
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 470, 320, 40)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:22];
    _label.text = [NSString stringWithFormat:@"总价格: %ld 元", self.totalPrice];
    [self.view addSubview:_label];
    
}

- (void)calculateTotalPrice
{
    self.totalPrice = 0;
    for (int i = 0; i < 4; i++) {
        
        priceModel *model = [priceModel new];
        model = self.dataArr[i];
        self.totalPrice += model.price * model.count;
    }
   _label.text = [NSString stringWithFormat:@"总价格: %ld 元", self.totalPrice]; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PriceReuse" forIndexPath:indexPath];
    
    priceModel *model = [[priceModel alloc]init];
    model = _dataArr[indexPath.row];
    cell.countLabel.text = [NSString stringWithFormat:@"%ld", model.count];
    cell.priceLabel.text = [NSString stringWithFormat:@"单价: %ld", model.price];
    
     
    __weak typeof (cell)weakCell = cell;
    cell.subBlock = ^() {
        
        if ([weakCell.countLabel.text isEqualToString:@"1"]) {
            
        }
        else {
            NSInteger count = [weakCell.countLabel.text integerValue];
            count--;
            weakCell.countLabel.text = [NSString stringWithFormat:@"%ld", count];
            
            priceModel *model = [priceModel new];
            model = _dataArr[indexPath.row];
            model.count -= 1;
            [_dataArr replaceObjectAtIndex:indexPath.row withObject:model];
            [self calculateTotalPrice];
        }
    };
    
    cell.addBlock = ^() {
        
        NSInteger count = [weakCell.countLabel.text integerValue];
        count++;
        weakCell.countLabel.text = [NSString stringWithFormat:@"%ld", count];
        
        priceModel *model = _dataArr[indexPath.row];
        model.count += 1;
        [_dataArr replaceObjectAtIndex:indexPath.row withObject:model];
        [self calculateTotalPrice];
    };
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 59;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
