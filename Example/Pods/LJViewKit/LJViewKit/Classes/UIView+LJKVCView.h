//
//  UIView+LJKVCView.h
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//


#import <UIKit/UIKit.h>


#import "LJViewKit.h"

@interface UIView (LJKVCView)

-(void)setFrameChangeBlock:(viewFrameChangeBlock)block;
-(void)addFrameChangeBlock:(viewFrameChangeBlock)block;


@end
