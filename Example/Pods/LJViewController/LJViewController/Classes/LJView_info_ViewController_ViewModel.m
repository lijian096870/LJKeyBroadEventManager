//
//  LJView_info_ViewController_ViewModel.m
//  LJViewController
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJView_info_ViewController_ViewModel.h"
#import "UIViewController+LJViewController.h"

@implementation LJView_info_ViewController_ViewModel

+ (void)initialize
{
    if (self == [self class]) {
        [UIViewController configDidloadMethod_reateView];
    }
}
+(void)load{
    
    [UIViewController configDidloadMethod_reateView];
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isViewControllerView = false;
    }
    return self;
}
@end
