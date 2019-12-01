//
//  NSNotificationCenter+LJKeyBroadNotification.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import <UIKit/UIKit.h>

typedef void(^KeyBroadNotificationBlock)(CGFloat keyBroadHeight);

@interface NSNotificationCenter (LJKeyBroadNotification)

+(void)addKeyBroadNotificationShowBlock:(KeyBroadNotificationBlock)block;

+(void)addKeyBroadNotificationFrameChangeBlock:(KeyBroadNotificationBlock)block;

+(void)addKeyBroadNotificationHideBlock:(dispatch_block_t)block;

@end


