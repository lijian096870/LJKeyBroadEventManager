//
//  UIView+AllocBack.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/11/29.
//  Copyright © 2019 李健. All rights reserved.
//

#import "UIView+AllocBack.h"

static viewAllocBlock viewAllocBlock_block = nil;

@implementation UIView (AllocBack)

+(void)configAllocBlock:(viewAllocBlock)block{
    
    viewAllocBlock_block = block;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    UIView  *ins = [super allocWithZone:zone];
    
    if(viewAllocBlock_block){
        viewAllocBlock_block(ins);
    }
    
    return ins;
    
}


@end
