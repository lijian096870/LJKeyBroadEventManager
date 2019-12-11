//
//  LJKeyBroadInputResponderViewEventControl.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface LJKeyBroadInputResponderViewEventControl : NSObject

- (void)beginResponderAllEvent;

- (void)endResponderAllEvent;

- (void)endShowEvent;

- (void)endHidenEvent;

- (BOOL)canResponderHidenEvent;

- (BOOL)canResponderShowEvent;

@end
