//
//  SignleSelectCell.h
//  ShopCar
//
//  Created by lanou on 16/2/25.
//  Copyright © 2016年 guantianbu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^singleBlock)();

@interface SignleSelectCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *singeleSelectBtn;

@property (copy, nonatomic)singleBlock singleBlock;

@end
