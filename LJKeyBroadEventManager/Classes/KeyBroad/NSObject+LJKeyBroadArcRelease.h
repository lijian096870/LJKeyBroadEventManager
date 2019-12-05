//
//  NSObject+LJKeyBroadArcRelease.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSObject (LJKeyBroadArcRelease)

-(void)setKeyBroadArcObjectClassReleaseCallBlockValue:(dispatch_block_t)block;

@end


