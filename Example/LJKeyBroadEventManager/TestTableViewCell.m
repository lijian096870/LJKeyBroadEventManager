//
//  TestTableViewCell.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/8/16.
//  Copyright © 2019 李健. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

//-(void)loop{
//
//    NSLog(@"%@",self.textField.inputAccessoryViewController);
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self loop];
//    });
//
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if([self.textField.text isEqualToString:@"7"]){
            [self.textField removeFromSuperview];
        }
    });
    
    
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
