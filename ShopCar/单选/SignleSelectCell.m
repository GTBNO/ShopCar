//
//  SignleSelectCell.m
//  ShopCar
//
//  Created by lanou on 16/2/25.
//  Copyright © 2016年 guantianbu. All rights reserved.
//

#import "SignleSelectCell.h"

@implementation SignleSelectCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)singleSelectHandle:(id)sender {
    
    if (self.singleBlock) {
        self.singleBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
