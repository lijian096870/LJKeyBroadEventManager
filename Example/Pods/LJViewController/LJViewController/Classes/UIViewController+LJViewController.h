//
//  UIViewController+LJViewController.h
//  LJViewController
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJViewControllerManager.h"

@interface UIViewController (LJViewController)

+(void)configDidloadMethod_reateView;

+(void)addViewControllerLoadViewBlock:(LJViewControllerLoadViewBlock)block;

@end


