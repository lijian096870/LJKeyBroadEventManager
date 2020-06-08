//
//  TestTableViewCell.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/8/16.
//  Copyright © 2019 李健. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
  
    
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    TestTableViewCell *text = [super allocWithZone:zone];
    
    return text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
