//
//  LJKeyBroadNotificationManager.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import <Foundation/Foundation.h>

typedef void (^ KeyBroadNotificationBlock)(UIView *view, CGFloat keyBroadHeight);

@interface LJKeyBroadNotificationManager : NSObject

- (void)addKeyBroadNotificationWillShowBlock:(KeyBroadNotificationBlock)block;

- (void)addKeyBroadNotificationDidShowBlock:(KeyBroadNotificationBlock)block;

- (void)addKeyBroadNotificationFrameChangeBlock:(KeyBroadNotificationBlock)block;

- (void)addKeyBroadNotificationWillHideBlock:(KeyBroadNotificationBlock)block;

- (void)addKeyBroadNotificationDidHideBlock:(KeyBroadNotificationBlock)block;

@end
