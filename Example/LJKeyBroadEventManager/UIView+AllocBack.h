//
//  UIView+AllocBack.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/11/29.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJClassAllocCallback.h"

@interface UIView (AllocBack)

+(void)configAllocBlock:(viewAllocBlock)block;

@end


