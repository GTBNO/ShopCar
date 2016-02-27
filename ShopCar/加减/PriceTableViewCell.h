//
//  PriceTableViewCell.h
//  ShopCar
//
//  Created by lanou on 16/2/26.
//  Copyright © 2016年 guantianbu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^subBlock)();

typedef void(^addBlock)();

@interface PriceTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (copy, nonatomic)subBlock subBlock;
@property (copy, nonatomic)addBlock addBlock;

@end
