//
//  LJKeyBroadEvent.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, KeyBroadEventStyle) {
    KeyBroadEventSelect = 0,
    KeyBroadEventCancel = 1
  
};

typedef BOOL(^canBecomeFirstResponderCallBackBlock)(UIView *view);

typedef void(^KeyBroadEventCallBlock)(UIView *view,KeyBroadEventStyle style);




typedef void(^KeyBroadEventResponderCallBack)(UIView *view);

typedef void(^KeyBroadEventNotificationViewAnimationBlock)(UIView *view,CGFloat keyBroadHeight);

typedef BOOL(^KeyBroadEventNotificationHiddenCallBack)(UIView *view);

@interface LJKeyBroadEvent : NSObject

-(void)configCanBecomeFirstResponderCallBackBlock:(canBecomeFirstResponderCallBackBlock)block;

-(void)registerKeyBroadEventShowEvent:(KeyBroadEventResponderCallBack)Showblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationShowBlock AndFrameChangeBlock:(KeyBroadEventNotificationViewAnimationBlock)frameChangeBlock HidenEvent:(KeyBroadEventResponderCallBack)Hidenblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationHidenBlock;

+ (instancetype)sharedInstance;
@end


