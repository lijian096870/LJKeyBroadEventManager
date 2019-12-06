//
//  LJKeyBroadEvent.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS (NSUInteger, KeyBroadEventStyle) {
    KeyBroadEventSelect = 0,
    KeyBroadEventCancel = 1
};

typedef BOOL (^ canBecomeFirstResponderCallBackBlock)(UIView *view);

typedef BOOL (^ KeyBroadEventBecomeFirstCallBlock)(UIView *view);
typedef void (^ KeyBroadEventBecomeFirstResultCallBlock)(UIView *view, BOOL result);

typedef void (^ KeyBroadEventreginFirstCallBlock)(UIView *view);

typedef void (^ KeyBroadEventNotificationViewAnimationBlock)(UIView *view, CGFloat keyBroadHeight);

typedef BOOL (^ KeyBroadEventNotificationHiddenCallBack)(UIView *view);

@interface LJKeyBroadEvent : NSObject

- (void)configCanBecomeFirstResponderCallBackBlock:(canBecomeFirstResponderCallBackBlock)block;

- (void)registerKeyBroadEventShowEvent:(KeyBroadEventBecomeFirstCallBlock)Showblock BroadEventShowResult:(KeyBroadEventBecomeFirstResultCallBlock)ShowResultBlock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationShowBlock AndFrameChangeBlock:(KeyBroadEventNotificationViewAnimationBlock)frameChangeBlock HidenEvent:(KeyBroadEventreginFirstCallBlock)Hidenblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationHidenBlock;

+ (instancetype)sharedInstance;
@end
