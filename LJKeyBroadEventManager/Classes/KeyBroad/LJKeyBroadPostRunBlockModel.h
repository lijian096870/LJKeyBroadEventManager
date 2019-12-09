//
//  LJKeyBroadPostRunBlockModel.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/9.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ KeyBroadNotificationBlock)(UIView *view, CGFloat keyBroadHeight);

@interface LJKeyBroadPostRunBlockModel : NSObject

+ (instancetype)sharedInstance;

- (void)addKeyBroadNotificationWillShowBlock:(KeyBroadNotificationBlock)block;

- (void)addKeyBroadNotificationDidShowBlock:(KeyBroadNotificationBlock)block;

- (void)addKeyBroadNotificationFrameChangeBlock:(KeyBroadNotificationBlock)block;

- (void)addKeyBroadNotificationWillHidenBlock:(KeyBroadNotificationBlock)block;

- (void)addKeyBroadNotificationDidHidenBlock:(KeyBroadNotificationBlock)block;

@end
