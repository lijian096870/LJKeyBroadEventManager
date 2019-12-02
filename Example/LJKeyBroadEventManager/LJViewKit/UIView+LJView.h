//
//  UIView+LJView.h
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//


#import <UIKit/UIKit.h>


#import "LJViewKit.h"

@interface UIView (LJView)

@property(nonatomic,assign,readwrite)BOOL callbackOn;


-(void)setFrame:(CGRect)frame and:(BOOL)callback;

-(void)setFrameChangeBlock:(viewFrameChangeBlock)block;
-(void)addFrameChangeBlock:(viewFrameChangeBlock)block;


@end
