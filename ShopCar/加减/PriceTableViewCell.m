//
//  PriceTableViewCell.m
//  ShopCar
//
//  Created by lanou on 16/2/26.
//  Copyright © 2016年 guantianbu. All rights reserved.
//

#import "PriceTableViewCell.h"

@implementation PriceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)subHandle:(id)sender {
    
    if (self.subBlock) {
        self.subBlock();
    }
}
- (IBAction)addHandle:(id)sender {
    
    if (self.addBlock) {
        self.addBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
