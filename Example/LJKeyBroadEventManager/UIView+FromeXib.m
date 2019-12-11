//
//  UIView+FromeXib.m
//  LJProjectKit
//
//  Created by 李健 on 2019/3/18.
//  Copyright © 2019年 李健. All rights reserved.
//

#import "UIView+FromeXib.h"

@implementation UIView (FromeXib)

+ (instancetype)FromeXib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
