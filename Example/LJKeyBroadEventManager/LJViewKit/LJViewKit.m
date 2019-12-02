//
//  [view startAdapt]; LJViewKit.m
//  PP
//
//  Created by 李健 on 2018/7/31.
//  Copyright © 2018年 李健. All rights reserved.
//
#import "LJViewKit.h"
#import "UIView+LJView.h"


void viewsetFrameChangeBlock(UIView *view,viewFrameChangeBlock block){
    
    [view setFrameChangeBlock:block];
    
}
void viewAddFrameChangeBlock(UIView *view,viewFrameChangeBlock block){
    [view addFrameChangeBlock:block];
}
