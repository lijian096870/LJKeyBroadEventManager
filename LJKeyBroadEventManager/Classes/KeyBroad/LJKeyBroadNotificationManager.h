//
//  LJKeyBroadNotificationManager.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import <Foundation/Foundation.h>

typedef void(^KeyBroadNotificationBlock)(UIView *view,CGFloat keyBroadHeight);

@interface LJKeyBroadNotificationManager : NSObject

-(void)addKeyBroadNotificationShowBlock:(KeyBroadNotificationBlock)block;

-(void)addKeyBroadNotificationFrameChangeBlock:(KeyBroadNotificationBlock)block;

-(void)addKeyBroadNotificationHideBlock:(KeyBroadNotificationBlock)block;

@end


