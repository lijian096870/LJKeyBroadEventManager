//
//  LJKeyBraodResponderCallBlockModel.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadEvent.h"
@interface LJKeyBraodResponderCallBlockModel : NSObject

@property(nonatomic,copy)KeyBroadEventResponderCallBack Showblock;

@property(nonatomic,copy)KeyBroadEventNotificationViewAnimationBlock animationShowBlock;


@property(nonatomic,copy)KeyBroadEventNotificationViewAnimationBlock frameChangeBlock;


@property(nonatomic,copy)KeyBroadEventResponderCallBack Hidenblock;

@property(nonatomic,copy)KeyBroadEventNotificationViewAnimationBlock animationHidenBlock;

- (instancetype)initWithBroadEventShowEvent:(KeyBroadEventResponderCallBack)Showblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationShowBlock AndFrameChangeBlock:(KeyBroadEventNotificationViewAnimationBlock)frameChangeBlock HidenEvent:(KeyBroadEventResponderCallBack)Hidenblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationHidenBlock;


@end


