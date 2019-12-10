//
//  LJKeyBraodResponderCallBlockModel.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadEvent.h"
@interface LJKeyBraodResponderCallBlockModel : NSObject

@property(nonatomic, copy) KeyBroadEventBecomeFirstCallBlock Showblock;

@property(nonatomic, copy) KeyBroadEventBecomeFirstResultCallBlock ShowResultBlock;

@property(nonatomic, copy) KeyBroadEventNotificationViewAnimationBlock animationWillShowBlock;

@property(nonatomic, copy) KeyBroadEventNotificationViewAnimationBlock animationDidShowBlock;

@property(nonatomic, copy) KeyBroadEventNotificationViewAnimationBlock frameChangeBlock;

@property(nonatomic, copy) KeyBroadEventreginFirstCallBlock Hidenblock;

@property(nonatomic, copy) KeyBroadEventNotificationViewAnimationBlock animationWillHidenBlock;

@property(nonatomic, copy) KeyBroadEventNotificationViewAnimationBlock animationDidHidenBlock;

- (instancetype)initWithBroadEventShowEvent :(KeyBroadEventBecomeFirstCallBlock)Showblock BroadEventShowResult:(KeyBroadEventBecomeFirstResultCallBlock)ShowResultBlock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationWillShowBlock
                AndViewAnimationBlock       :(KeyBroadEventNotificationViewAnimationBlock)animationDidShowBlock
                AndFrameChangeBlock         :(KeyBroadEventNotificationViewAnimationBlock)frameChangeBlock HidenEvent:(KeyBroadEventreginFirstCallBlock)Hidenblock AndViewWillHidenAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationWillHidenBlock AndViewDidHidenAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationDidHidenBlock;

@end
