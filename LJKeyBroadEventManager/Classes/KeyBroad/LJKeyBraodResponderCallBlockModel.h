//
//  LJKeyBraodResponderCallBlockModel.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadEvent.h"
@interface LJKeyBraodResponderCallBlockModel : NSObject

@property(nonatomic,copy)KeyBroadEventBecomeFirstCallBlock Showblock;

@property(nonatomic,copy)KeyBroadEventBecomeFirstResultCallBlock ShowResultBlock;

@property(nonatomic,copy)KeyBroadEventNotificationViewAnimationBlock animationShowBlock;


@property(nonatomic,copy)KeyBroadEventNotificationViewAnimationBlock frameChangeBlock;


@property(nonatomic,copy)KeyBroadEventreginFirstCallBlock Hidenblock;

@property(nonatomic,copy)KeyBroadEventNotificationViewAnimationBlock animationHidenBlock;

- (instancetype)initWithBroadEventShowEvent:(KeyBroadEventBecomeFirstCallBlock)Showblock BroadEventShowResult:(KeyBroadEventBecomeFirstResultCallBlock)ShowResultBlock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationShowBlock AndFrameChangeBlock:(KeyBroadEventNotificationViewAnimationBlock)frameChangeBlock HidenEvent:(KeyBroadEventreginFirstCallBlock)Hidenblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationHidenBlock;


@end


