//
//  LJTextField.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJTextField.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a) / 255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface LJTextField ()

@property(nonatomic, strong) UIView *topView;

@end

@implementation LJTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(chengAcc:) name:@"1234567891" object:nil];
}

- (void)chengAcc:(NSNotification *)not {
 

    self.topView = nil;
    
    self.inputAccessoryView = self.topView;
    
    [self reloadInputViews];
        
    
}
- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40.0)];
        _topView.backgroundColor = randomColor;
    }

    return _topView;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
