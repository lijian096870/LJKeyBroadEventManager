//
//  LJKeyBroadArcReleaseModel.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadArcReleaseModel.h"

@implementation LJKeyBroadArcReleaseModel

- (void)dealloc
{
    if(self.block){
        self.block();
    }
}

@end
