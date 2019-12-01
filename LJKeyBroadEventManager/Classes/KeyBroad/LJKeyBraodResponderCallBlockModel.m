//
//  LJKeyBraodResponderCallBlockModel.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import "LJKeyBraodResponderCallBlockModel.h"

@implementation LJKeyBraodResponderCallBlockModel

- (instancetype)initWithBroadEventShowEvent:(KeyBroadEventResponderCallBack)Showblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationShowBlock AndFrameChangeBlock:(KeyBroadEventNotificationViewAnimationBlock)frameChangeBlock HidenEvent:(KeyBroadEventResponderCallBack)Hidenblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationHidenBlock{
    self = [super init];
    if (self) {
        _Showblock = Showblock;
        _animationShowBlock = animationShowBlock;
        
        _frameChangeBlock = frameChangeBlock;
                
        _Hidenblock  =  Hidenblock;
        _animationHidenBlock = animationHidenBlock;
    
    }
    return self;
}


@end
