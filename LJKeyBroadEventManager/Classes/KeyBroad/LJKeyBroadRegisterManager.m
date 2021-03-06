//
//  LJKeyBroadRegisterManager.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadRegisterManager.h"
#import "UIViewController+KeyBoradManager.h"
#import "LJKeyBroadEvent.h"
#import "LJKeyBroadEventManager.h"
#import "LJkeyBroadConfig.h"
#import "LJViewControllerManager.h"
#import "UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h"
@interface LJKeyBroadRegisterManager ()

@property(nonatomic, strong) NSMutableSet *set;

@end

@interface UIViewController () <LJKeyboardManagerDelegate>

@end

@implementation LJKeyBroadRegisterManager

- (void)removeKeyBroadResponder:(UIViewController <LJKeyboardManagerDelegate> *)keyBroadResponder {
    if ([keyBroadResponder isKindOfClass:[UIViewController class]]) {
        [self.set removeObject:keyBroadResponder.keyBroad_mess_uniqueID];
    }
}

- (void)registerKeyBroadResponder:(UIViewController <LJKeyboardManagerDelegate> *)keyBroadResponder {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        [[LJKeyBroadEvent sharedInstance] configCanBecomeFirstResponderCallBackBlock:^BOOL (UIView *view) {
            UIViewController *viewController = viewGetSuperController(view);

            if ([viewController isKindOfClass:[UIViewController class]]) {
                if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                    if ([viewController respondsToSelector:@selector(canBecomeFirstResponder:)]) {
                        return [viewController canBecomeFirstResponder:view];
                    } else {
                        return true;
                    }
                } else {
                    return true;
                }
            } else {
                return true;
            }
        }];

        [[LJKeyBroadEvent sharedInstance] registerKeyBroadEventShowEvent:^BOOL (UIView *view) {
            UIViewController *viewController = viewGetSuperController(view);

            if ([viewController isKindOfClass:[UIViewController class]]) {
                if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                    return [viewController.NSObject_KeyBoradEventResponderModel_viewController_info ShowKeyBroad:view];
                }
            }

            return YES;
        } BroadEventShowResult:^(UIView *view, BOOL result) {
            UIViewController *viewController = viewGetSuperController(view);

            if ([viewController isKindOfClass:[UIViewController class]]) {
                if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                    return [viewController.NSObject_KeyBoradEventResponderModel_viewController_info ShowkeyBroadResult:view AndResult:result];
                }
            }
        } AndViewAnimationBlock:^(UIView *view, CGFloat keyBroadHeight) {
            if ([self canShowEvent:view]) {
                UIViewController *viewController = viewGetSuperController(view);

                if ([viewController isKindOfClass:[UIViewController class]]) {
                    if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                        [viewController.NSObject_KeyBoradEventResponderModel_viewController_info ShowKeyBroadWillAnimation:view andkeyBroadHeight:keyBroadHeight];
                    }
                }
            } else if ([self canWindowRotateShowEvent:view]) {
                UIViewController *viewController = viewGetSuperController(view);

                if ([viewController isKindOfClass:[UIViewController class]]) {
                    if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                        [viewController.NSObject_KeyBoradEventResponderModel_viewController_info windowRotateTimeKeyBroadWillShow:view andkeyBroadHeight:keyBroadHeight];
                    }
                }
            }
        }  AndViewAnimationBlock:^(UIView *view, CGFloat keyBroadHeight) {
            if ([self canShowEvent:view]) {
                UIViewController *viewController = viewGetSuperController(view);

                if ([viewController isKindOfClass:[UIViewController class]]) {
                    if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                        [viewController.NSObject_KeyBoradEventResponderModel_viewController_info ShowKeyBroadDidAnimation:view andkeyBroadHeight:keyBroadHeight];
                    }
                }
            } else if ([self canWindowRotateShowEvent:view]) {
                UIViewController *viewController = viewGetSuperController(view);

                if ([viewController isKindOfClass:[UIViewController class]]) {
                    if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                        [viewController.NSObject_KeyBoradEventResponderModel_viewController_info windowRotateTimeKeyBroadDidShow:view andkeyBroadHeight:keyBroadHeight];
                    }
                }
            }
        } AndFrameChangeBlock:^(UIView *view, CGFloat keyBroadHeight) {
            if ([self canShowEvent:view]) {
                UIViewController *viewController = viewGetSuperController(view);

                if ([viewController isKindOfClass:[UIViewController class]]) {
                    if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                        [viewController.NSObject_KeyBoradEventResponderModel_viewController_info keyBroadFrameChange:view andkeyBroadHeight:keyBroadHeight];
                    }
                }
            } else if ([self canWindowRotateShowEvent:view]) {
                UIViewController *viewController = viewGetSuperController(view);

                if ([viewController isKindOfClass:[UIViewController class]]) {
                    if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                        [viewController.NSObject_KeyBoradEventResponderModel_viewController_info windowRotateTimeKeyBroadChangeFrameShow:view andkeyBroadHeight:keyBroadHeight];
                    }
                }
            }
        } HidenEvent:^(UIView *view) {
            UIViewController *viewController = viewGetSuperController(view);

            if ([viewController isKindOfClass:[UIViewController class]]) {
                if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                    [viewController.NSObject_KeyBoradEventResponderModel_viewController_info HiddenKeyBroad:view];
                }
            }
        } AndViewWillHidenAnimationBlock:^(UIView *view, CGFloat keyBroadHeight) {
            if ([self canHidenEvent:view]) {
                UIViewController *viewController = viewGetSuperController(view);

                if ([viewController isKindOfClass:[UIViewController class]]) {
                    if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                        [viewController.NSObject_KeyBoradEventResponderModel_viewController_info HiddenBroadWillAnimation:view];
                    }
                }
            } else if ([self canWindowRotateHidenEvent:view]) {
                UIViewController *viewController = viewGetSuperController(view);

                if ([viewController isKindOfClass:[UIViewController class]]) {
                    if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                        [viewController.NSObject_KeyBoradEventResponderModel_viewController_info windowRotateTimeKeyBroadHiden:view];
                    }
                }
            }
        } AndViewDidHidenAnimationBlock:^(UIView *view, CGFloat keyBroadHeight) {
            if ([self canHidenEvent:view]) {
                UIViewController *viewController = viewGetSuperController(view);

                if ([viewController isKindOfClass:[UIViewController class]]) {
                    if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                        [viewController.NSObject_KeyBoradEventResponderModel_viewController_info HiddenBroadDidAnimation:view];
                    }
                }
            } else if ([self canWindowRotateHidenEvent:view]) {
                UIViewController *viewController = viewGetSuperController(view);

                if ([viewController isKindOfClass:[UIViewController class]]) {
                    if ([self isRegister:viewController.keyBroad_mess_uniqueID]) {
                        [viewController.NSObject_KeyBoradEventResponderModel_viewController_info windowRotateTimeKeyBroadHiden:view];
                    }
                }
            }
        }];
    });

    if ([keyBroadResponder isKindOfClass:[UIViewController class]]) {
        NSString *ID = keyBroadResponder.keyBroad_mess_uniqueID;
        [self.set addObject:ID];

        [keyBroadResponder.NSObject_KeyBoradEventResponderModel_viewController_info configDestroyBlock:^{
            [self.set removeObject:ID];
        }];
    }
}

- (void)ShowkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view {
    if ([self canShowEvent:view]) {
        if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
            UIViewController *responderViewController = viewGetSuperController(view);

            if ([responderViewController isKindOfClass:UIViewController.class]) {
                if ([self isRegister:responderViewController.keyBroad_mess_uniqueID]) {
                    [responderViewController.NSObject_KeyBoradEventResponderModel_viewController_info ShowkeyBroadInputAccessoryViewRelateCallBlock:view];
                }
            }
        }
    }
}

- (void)HiddenkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view {
    if ([self canHidenEvent:view]) {
        if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
            UIViewController *responderViewController = viewGetSuperController(view);

            if ([responderViewController isKindOfClass:UIViewController.class]) {
                if ([self isRegister:responderViewController.keyBroad_mess_uniqueID]) {
                    [responderViewController.NSObject_KeyBoradEventResponderModel_viewController_info HiddenkeyBroadInputAccessoryViewRelateCallBlock:view];
                }
            }
        }
    }
}

- (BOOL)canShowEvent:(UIView *)view {
    if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
        return [view.keyBroadInputResponderViewEventControl_view canResponderShowEvent];
    } else {
        return NO;
    }
}

- (BOOL)canWindowRotateShowEvent:(UIView *)view {
    if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
        return [view.keyBroadInputResponderViewEventControl_view canwindowRotateTimeShowEvent];
    } else {
        return NO;
    }
}

- (BOOL)canHidenEvent:(UIView *)view {
    if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
        return [view.keyBroadInputResponderViewEventControl_view canResponderHidenEvent];
    } else {
        return NO;
    }
}

- (BOOL)canWindowRotateHidenEvent:(UIView *)view {
    if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
        return [view.keyBroadInputResponderViewEventControl_view canWindowRotateTimeHidenEvent];
    } else {
        return NO;
    }
}

- (BOOL)isRegister:(NSString *)key {
    for (NSString *object in self.set) {
        if ([key isEqualToString:object]) {
            return YES;
        }
    }

    return NO;
}

- (NSMutableSet *)set {
    if (_set == nil) {
        _set = [NSMutableSet set];
    }

    return _set;
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
