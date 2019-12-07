//
//  LJKeyBraodResponderCallBlockModel.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import "LJKeyBraodResponderCallBlockModel.h"

@implementation LJKeyBraodResponderCallBlockModel

- (instancetype)initWithBroadEventShowEvent:(KeyBroadEventBecomeFirstCallBlock)Showblock BroadEventShowResult:(KeyBroadEventBecomeFirstResultCallBlock)ShowResultBlock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationWillShowBlock
                      AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationDidShowBlock
                        AndFrameChangeBlock:(KeyBroadEventNotificationViewAnimationBlock)frameChangeBlock HidenEvent:(KeyBroadEventreginFirstCallBlock)Hidenblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationHidenBlock {
    self = [super init];
    
    if (self) {
        _Showblock = Showblock;
        
        _ShowResultBlock = ShowResultBlock;
        
        _animationWillShowBlock = animationWillShowBlock;
        
        _animationDidShowBlock = animationDidShowBlock;
        
        
        _frameChangeBlock = frameChangeBlock;
        
        _Hidenblock = Hidenblock;
        _animationHidenBlock = animationHidenBlock;
    }
    
    return self;
}

@end
