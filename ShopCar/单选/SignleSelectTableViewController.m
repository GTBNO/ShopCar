//
//  SignleSelectTableViewController.m
//  ShopCar
//
//  Created by lanou on 16/2/25.
//  Copyright © 2016年 guantianbu. All rights reserved.
//

#import "SignleSelectTableViewController.h"
#import "SignleSelectCell.h"

@interface SignleSelectTableViewController ()

@property (assign, nonatomic)NSInteger index;
@property (assign, nonatomic)BOOL isSelect;

@end

@implementation SignleSelectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SignleSelectCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"singleReuse"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SignleSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"singleReuse" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    if (indexPath.row != self.index) {
        
        cell.singeleSelectBtn.selected = NO;
    }
    
    else {
        cell.singeleSelectBtn.selected = self.isSelect;
    }
    
    cell.singleBlock = ^() {
        
        self.index = indexPath.row;
       
    };
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)setIndex:(NSInteger)index
{
    // 当前点击的cell
    SignleSelectCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];

    if (_index != index) {
        
        cell.singeleSelectBtn.selected = YES;
     
        // 上次选中的cell
        SignleSelectCell *cell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_index inSection:0]];
        cell1.singeleSelectBtn.selected = NO;
     //  [cell1.singeleSelectBtn setBackgroundImage:[UIImage imageNamed:@"0.jpg"] forState:(UIControlStateNormal)];
        
        _index = index;
    }
    
    else {
        
        cell.singeleSelectBtn.selected = !cell.singeleSelectBtn.selected;
    }
    self.isSelect = cell.singeleSelectBtn.selected;
}


@end
