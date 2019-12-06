//
//  NSObject+LJKeyBroadArcRelease.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "NSObject+LJKeyBroadArcRelease.h"
#import <objc/runtime.h>
#import "LJKeyBroadArcReleaseModel.h"

@implementation NSObject (LJKeyBroadArcRelease)

- (void)setKeyBroadArcObjectClassReleaseCallBlockValue:(dispatch_block_t)block {
    [self keyBroadArcObjectClassReleaseCallBlock_value].block = block;
}

- (LJKeyBroadArcReleaseModel *)keyBroadArcObjectClassReleaseCallBlock_value
{
    LJKeyBroadArcReleaseModel *obj = objc_getAssociatedObject(self, @selector(keyBroadArcObjectClassReleaseCallBlock_value));

    if ([obj isKindOfClass:[LJKeyBroadArcReleaseModel class]]) {
        return obj;
    } else {
        LJKeyBroadArcReleaseModel *mess = [[LJKeyBroadArcReleaseModel alloc]init];
        objc_setAssociatedObject(self, @selector(keyBroadArcObjectClassReleaseCallBlock_value), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return mess;
    }
}

@end
