//
//  FirstResponderModel.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "FirstResponderModel.h"

@implementation FirstResponderModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isFirstResponder = false;
    }
    return self;
}
@end
