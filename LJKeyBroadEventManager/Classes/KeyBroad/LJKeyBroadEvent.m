//
//  LJKeyBroadEvent.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadEvent.h"
#import "LJKeyBroadEventManager.h"
#import "LJKeyBroadNotificationManager.h"
#import "UIResponder+becomeFirstResponderCallBack.h"
#import "LJKeyBraodResponderCallBlockModel.h"
#import "LJKeyBroadPostRunBlockModel.h"
@interface LJKeyBroadEvent ()

@property(nonatomic, strong) NSMutableSet   *becomeFirstSet;
@property(nonatomic, strong) NSMutableSet   *reginFirstSet;
@property(nonatomic, strong) NSMutableSet   *becomeFirstResultSet;

@property(nonatomic, copy) canBecomeFirstResponderCallBackBlock canBecomeFirstResponder;

@property(nonatomic, strong) NSMutableSet *responderSet;

@property(nonatomic, strong) LJKeyBroadNotificationManager *keyBroadNotManager;

@end

@implementation LJKeyBroadEvent

- (void)registerKeyBroadEventShowEvent:(KeyBroadEventBecomeFirstCallBlock)Showblock BroadEventShowResult:(KeyBroadEventBecomeFirstResultCallBlock)ShowResultBlock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationShowWillBlock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationShowDidBlock AndFrameChangeBlock:(KeyBroadEventNotificationViewAnimationBlock)frameChangeBlock HidenEvent:(KeyBroadEventreginFirstCallBlock)Hidenblock AndViewWillHidenAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationWillHidenBlock AndViewDidHidenAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationDidHidenBlock {
    [self blingNotEvent];

    LJKeyBraodResponderCallBlockModel *model = [[LJKeyBraodResponderCallBlockModel alloc]initWithBroadEventShowEvent:Showblock BroadEventShowResult:ShowResultBlock
        AndViewAnimationBlock                                                                                       :animationShowWillBlock AndViewAnimationBlock:animationShowDidBlock AndFrameChangeBlock:frameChangeBlock HidenEvent:Hidenblock AndViewWillHidenAnimationBlock:animationWillHidenBlock AndViewDidHidenAnimationBlock:animationDidHidenBlock];

    [self.responderSet addObject:model];

    [self registerKeyBroadEventBecomeFirst:^BOOL (UIView *view) {
        BOOL result = YES;

        for (LJKeyBraodResponderCallBlockModel *model in self.responderSet) {
            if (model.Showblock) {
                result = model.Showblock(view) && result;
            }
        }

        return result;
    }];

    [self registerKeyBroadEventReginsFirst:^(UIView *view) {
        for (LJKeyBraodResponderCallBlockModel *model in self.responderSet) {
            if (model.Hidenblock) {
                model.Hidenblock(view);
            }
        }
    }];

    [self registerKeyBroadEventBecomeFirstResult:^(UIView *view, BOOL result) {
        for (LJKeyBraodResponderCallBlockModel *model in self.responderSet) {
            if (model.ShowResultBlock) {
                model.ShowResultBlock(view, result);
            }
        }
    }];
}

- (void)configCanBecomeFirstResponderCallBackBlock:(canBecomeFirstResponderCallBackBlock)block {
    self.canBecomeFirstResponder = block;
}

- (void)registerKeyBroadEventBecomeFirst:(KeyBroadEventBecomeFirstCallBlock)block {
    [self blingEvent];

    if (block) {
        [self.becomeFirstSet addObject:block];
    }
}

- (void)registerKeyBroadEventBecomeFirstResult:(KeyBroadEventBecomeFirstResultCallBlock)block {
    [self blingEvent];

    if (block) {
        [self.becomeFirstResultSet addObject:block];
    }
}

- (void)registerKeyBroadEventReginsFirst:(KeyBroadEventreginFirstCallBlock)block {
    [self blingEvent];

    if (block) {
        [self.reginFirstSet addObject:block];
    }
}

- (void)blingNotEvent {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        [[LJKeyBroadPostRunBlockModel sharedInstance] addKeyBroadNotificationDidShowBlock:^(UIView *view, CGFloat keyBroadHeight) {
            if ([view isKindOfClass:UIView.class]) {
                for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
                    if (model.animationDidShowBlock) {
                        model.animationDidShowBlock(view, keyBroadHeight);
                    }
                }
            }
        }];

        [[LJKeyBroadPostRunBlockModel sharedInstance]addKeyBroadNotificationDidHidenBlock:^(UIView *view, CGFloat keyBroadHeight) {
            if ([view isKindOfClass:UIView.class]) {
                for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
                    if (model.animationDidHidenBlock) {
                        model.animationDidHidenBlock(view, keyBroadHeight);
                    }
                }
            }
        }];

        [[LJKeyBroadPostRunBlockModel sharedInstance]addKeyBroadNotificationFrameChangeBlock:^(UIView *view, CGFloat keyBroadHeight) {
            if ([view isKindOfClass:UIView.class]) {
                for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
                    if (model.frameChangeBlock) {
                        model.frameChangeBlock(view, keyBroadHeight);
                    }
                }
            }
        }];

        [[LJKeyBroadPostRunBlockModel sharedInstance]addKeyBroadNotificationWillShowBlock:^(UIView *view, CGFloat keyBroadHeight) {
            if ([view isKindOfClass:UIView.class]) {
                for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
                    if (model.animationWillShowBlock) {
                        model.animationWillShowBlock(view, keyBroadHeight);
                    }
                }
            }
        }];

        [[LJKeyBroadPostRunBlockModel sharedInstance]addKeyBroadNotificationWillHidenBlock:^(UIView *view, CGFloat keyBroadHeight) {
            if ([view isKindOfClass:UIView.class]) {
                for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
                    if (model.animationWillHidenBlock) {
                        model.animationWillHidenBlock(view, keyBroadHeight);
                    }
                }
            }
        }];

        //        [self.keyBroadNotManager addKeyBroadNotificationFrameChangeBlock:^(UIView *view, CGFloat keyBroadHeight) {
        //            if ([view isKindOfClass:UIView.class]) {
        //                for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
        //                    if (model.frameChangeBlock) {
        //                        model.frameChangeBlock(view, keyBroadHeight);
        //                    }
        //                }
        //            }
        //        }];
        //        [self.keyBroadNotManager addKeyBroadNotificationWillShowBlock:^(UIView *view, CGFloat keyBroadHeight) {
        //            if ([view isKindOfClass:UIView.class]) {
        //                for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
        //                    if (model.animationWillShowBlock) {
        //                        model.animationWillShowBlock(view, keyBroadHeight);
        //                    }
        //                }
        //            }
        //        }];
        //        [self.keyBroadNotManager addKeyBroadNotificationDidShowBlock:^(UIView *view, CGFloat keyBroadHeight) {
        //            if ([view isKindOfClass:UIView.class]) {
        //                for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
        //                    if (model.animationDidShowBlock) {
        //                        model.animationDidShowBlock(view, keyBroadHeight);
        //                    }
        //                }
        //            }
        //        }];
        //        [self.keyBroadNotManager addKeyBroadNotificationHideBlock:^(UIView *view, CGFloat keyBroadHeight) {
        //            if ([view isKindOfClass:UIView.class]) {
        //                for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
        //                    if (model.animationHidenBlock) {
        //                        model.animationHidenBlock(view, keyBroadHeight);
        //                    }
        //                }
        //            }
        //        }];
    });
}

- (void)blingEvent {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        [UIResponder configCanBecomeFirstResponderCallBackBlock:^BOOL (UIView *_Nonnull view) {
            if ([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]]) {
                if (self.canBecomeFirstResponder) {
                    return self.canBecomeFirstResponder(view);
                } else {
                    return true;
                }
            } else {
                return true;
            }
        }];

        [UIResponder configbecomeFirstResponderCallBackBlock:^BOOL (UIView *_Nonnull view) {
            if ([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]]) {
                BOOL result = YES;

                for (KeyBroadEventBecomeFirstCallBlock block in self.becomeFirstSet) {
                    result = block(view) && result;
                }

                return result;
            } else {
                return YES;
            }
        }];
        [UIResponder configresignFirstResponderCallBackBlock:^(UIView *_Nonnull view) {
            if ([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]]) {
                for (KeyBroadEventreginFirstCallBlock Block in self.reginFirstSet) {
                    Block(view);
                }
            }
        }];

        [UIResponder configbecomeFirstResponderResultCallBackBlock:^(UIView *view, BOOL result) {
            if ([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]]) {
                for (KeyBroadEventBecomeFirstResultCallBlock Block in self.becomeFirstResultSet) {
                    Block(view, result);
                }
            }
        }];
    });
}

- (LJKeyBroadNotificationManager *)keyBroadNotManager {
    if (_keyBroadNotManager == nil) {
        _keyBroadNotManager = [[LJKeyBroadNotificationManager alloc]init];
    }

    return _keyBroadNotManager;
}

- (NSMutableSet *)responderSet {
    if (_responderSet == nil) {
        _responderSet = [NSMutableSet set];
    }

    return _responderSet;
}

- (NSMutableSet *)reginFirstSet {
    if (_reginFirstSet == nil) {
        _reginFirstSet = [NSMutableSet set];
    }

    return _reginFirstSet;
}

- (NSMutableSet *)becomeFirstSet {
    if (_becomeFirstSet == nil) {
        _becomeFirstSet = [NSMutableSet set];
    }

    return _becomeFirstSet;
}

- (NSMutableSet *)becomeFirstResultSet {
    if (_becomeFirstResultSet == nil) {
        _becomeFirstResultSet = [NSMutableSet set];
    }

    return _becomeFirstResultSet;
}

static id _instace;
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [super allocWithZone:zone];
    });
    return _instace;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

+ (instancetype)new
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instace;
}

@end
