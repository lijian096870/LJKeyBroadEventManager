//
//  LJKeyBroadManager.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadManager.h"
#import "LJKeyBroadRespoderModel.h"
#import "LJkeyBroadConfig.h"
#import "LJKeyboardToolBar.h"
#import "LJKeyBroadEventManager.h"
#import "UIViewController+KeyBoradManager.h"
#import "LJViewControllerManager.h"
#import "LJKeyBroadMoveOffsetManager.h"
#import "LJKeyboardReloadToolBar.h"
#import "LJKeyBroadRespoderNextSet.h"
#import "LJKeyBroadInterfaceOrientationManager.h"
@interface UIViewController () <LJKeyboardManagerDelegate>

@end

@interface LJKeyBroadManager ()

@property(nonatomic, weak) UIViewController *object_keyBroad;

@property(nonatomic, strong) LJKeyBroadMoveOffsetManager *moveOffsetManager;

@property(nonatomic, strong) LJKeyboardReloadToolBar *reloadTooBarUtil;

@property(nonatomic, strong) LJKeyBroadRespoderNextSet              *responderNextSet;
@property(nonatomic, strong) LJKeyBroadInterfaceOrientationManager  *orientationManager;

@end

@implementation LJKeyBroadManager

- (instancetype)initWithMaster_object_keyBroad:(UIViewController *)object
{
    self = [super init];

    if (self) {
        self.object_keyBroad = object;
        __weak LJKeyBroadManager *weakSelf = self;
        [self.orientationManager configWillOrientationBlock:^{
            if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadManager.class]) {
                [weakSelf WillOrientation];
            }
        } didOrientationBlock:^{
            if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadManager.class]) {
                [weakSelf didOrientation];
            }
        }];
    }

    return self;
}

- (void)WillOrientation {
    if ([self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [self.responderNextSet isValid] && ([[NSNumber numberWithFloat:self.moveOffsetManager.moveOffset] floatValue] > 0.0)) {
        [self.moveOffsetManager endEditResponderModel:self.responderNextSet.currentResponderModel];

        if ([[NSNumber numberWithFloat:self.moveOffsetManager.moveOffset] isEqualToNumber:[NSNumber numberWithFloat:0.0]]) {
            self.orientationManager.cacheKeyBroadHeight = self.moveOffsetManager.keyBroadHeight;
            [self.responderNextSet responderArrayRenewResponderLocation];
        }
    }
}

- (void)didOrientation {
    if ([self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [self.responderNextSet isValid] && (self.orientationManager.cacheKeyBroadHeight > 0.0)) {
        [self.moveOffsetManager moveOffsetKeyBroadHeight:self.orientationManager.cacheKeyBroadHeight ResponderModel:self.responderNextSet.currentResponderModel];
    }
}

- (BOOL)ShowKeyBroad:(UIView *)view {
    if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && (([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]]))) {
        if ([self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]) {
            if ([self.responderNextSet isCurrentView:view]) {
                [self configLJKeyboardToolBar:self.responderNextSet];

                [self.moveOffsetManager customerKeyBroadChange:self.responderNextSet];

                return YES;
            } else {
                if ([self.responderNextSet isValid] && [self.responderNextSet isContain:view]) {
                    if ([self.responderNextSet moveThisView:view]) {
                        [self configLJKeyboardToolBar:self.responderNextSet];

                        [self.moveOffsetManager customerKeyBroadChange:self.responderNextSet];

                        return YES;
                    } else {
                        return NO;
                    }
                } else {
                    return NO;
                }
            }
        } else {
            LJKeyBroadRespoderNextSet *NextSet = [[LJKeyBroadRespoderNextSet alloc]initWithViewController:self.object_keyBroad AndMustHaveView:view];

            if ([NextSet isValid] && [NextSet isContain:view] && [NextSet isCurrentView:view]) {
                self.responderNextSet = NextSet;
                [self configLJKeyboardToolBar:self.responderNextSet];
                [self.moveOffsetManager customerKeyBroadChange:self.responderNextSet];
                return YES;
            } else {
                return NO;
            }
        }
    } else {
        return NO;
    }
}

- (void)ShowkeyBroadResult:(UIView *)view AndResult:(BOOL)result {
    if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && (([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]])) && [self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [self.responderNextSet isCurrentView:view]) {
        if (result) {} else {
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.moveOffsetManager endEditResponderModel:self.responderNextSet.currentResponderModel];
                self.responderNextSet = nil;
            } completion:^(BOOL finished) {}];
        }
    }
}

- (void)ShowKeyBroadWillAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight {
    if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && (([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]]))) {
        if ([self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]) {
            if ([self.responderNextSet isCurrentView:view]) {
                if ([self.responderNextSet isCurrentBecomeFirstNecessaryMove]) {} else {
                    [self keyBroadFrameChange:view andkeyBroadHeight:keyBroadHeight];
                }
            }
        } else {
            [self keyBroadFrameChange:view andkeyBroadHeight:keyBroadHeight];
        }
    }
}

- (void)ShowKeyBroadDidAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight {
    [self keyBroadFrameChange:view andkeyBroadHeight:keyBroadHeight];
}

- (void)keyBroadFrameChange:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight {
    if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && (([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]]))) {
        if ([self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]) {
            if ([self.responderNextSet isValid] && [self.responderNextSet isCurrentView:view]) {
                if ([[NSNumber numberWithFloat:self.moveOffsetManager.moveOffset] isEqualToNumber:[NSNumber numberWithFloat:0.0]] && self.object_keyBroad.isViewLoaded) {
                    [self.responderNextSet responderArrayRenewResponderLocation];

                    [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderNextSet];
                }

                [self.moveOffsetManager moveOffsetKeyBroadHeight:keyBroadHeight ResponderModel:self.responderNextSet.currentResponderModel];
            }
        } else {
            BOOL result = [self ShowKeyBroad:view];

            if (result) {
                [self ShowKeyBroadWillAnimation:view andkeyBroadHeight:keyBroadHeight];
            }
        }
    }
}

- (void)HiddenKeyBroad:(UIView *)view {}

- (void)HiddenBroadWillAnimation:(UIView *)view {
    if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && (([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]])) && [self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [self.responderNextSet isValid] && [self.responderNextSet isCurrentView:view]) {
        LJKeyBroadRespoderModel *model = self.responderNextSet.currentResponderModel;
        self.responderNextSet = nil;

        [self.moveOffsetManager endEditResponderModel:model];
    }
}

- (void)HiddenBroadDidAnimation:(UIView *)view {
    if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && (([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]])) && [self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [self.responderNextSet isValid] && [self.responderNextSet isCurrentView:view]) {
        LJKeyBroadRespoderModel *model = self.responderNextSet.currentResponderModel;
        self.responderNextSet = nil;

        [self.moveOffsetManager endEditResponderModel:model];
    }
}

- (void)ShowkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view {
    if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && (([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]]))) {
        if ([self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]) {} else {
            [self ShowKeyBroad:view];
        }
    }
}

- (void)HiddenkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view {
    if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && (([view isKindOfClass:[UITextView class]] || [view isKindOfClass:[UITextField class]])) && [self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [self.responderNextSet isCurrentView:view] && ([[NSNumber numberWithFloat:self.moveOffsetManager.keyBroadHeight] floatValue] > 0.0)) {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.moveOffsetManager endEditResponderModel:self.responderNextSet.currentResponderModel];
            self.responderNextSet = nil;
        } completion:^(BOOL finished) {}];
    }
}

- (void)configLJKeyboardToolBar:(LJKeyBroadRespoderNextSet *)responderNextSet {
    [self.reloadTooBarUtil configLJKeyboardToolBar:responderNextSet andNewToolBar:[self MadeToolBar:CGRectMake(0, 0, responderNextSet.currentResponderModel.window.bounds.size.width, 40)]];

    __weak LJKeyBroadManager *weakself = self;
    [self.moveOffsetManager setMoveCallBlock:^(LJKeyBroadRespoderModel *model) {
        if (weakself && [model isKindOfClass:LJKeyBroadRespoderModel.class] && [weakself.responderNextSet isValid] && (weakself.responderNextSet.currentResponderModel == model)) {
            [weakself.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:weakself.responderNextSet];
        }
    }];

    [responderNextSet setReloadBarBlock:^{
        if ([weakself isKindOfClass:LJKeyBroadManager.class]) {
            if ([weakself.responderNextSet isValid]) {
                [weakself.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:weakself.responderNextSet];
            } else {
                LJKeyBroadRespoderModel *model = weakself.responderNextSet.currentResponderModel;

                weakself.responderNextSet = nil;

                if ([model.view isKindOfClass:UIView.class]) {
                    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                        [weakself.moveOffsetManager endEditResponderModel:model];
                    } completion:^(BOOL finished) {}];
                }
            }
        }
    }];
}

- (LJKeyboardToolBar *)MadeToolBar:(CGRect)frame {
    __weak LJKeyBroadManager *weakself = self;

    return [[LJKeyboardToolBar alloc]initWithFrame:frame leftBtnBlock:^(LJKeyboardToolBar *bar) {
               if (weakself) {
                   [weakself didClickedLeftArrowButton];
               }
           } rightBtnBlock:^(LJKeyboardToolBar *bar) {
               if (weakself) {
                   [weakself didClickedRightArrowButton];
               }
           } doneBtnBlock:^(LJKeyboardToolBar *bar) {
               if (weakself) {
                   [weakself didClickedDone];
               }
           }];
}

- (void)didClickedLeftArrowButton {
    if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && [self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [self.responderNextSet isValid]) {
        LJKeyBroadRespoderModel *model = [self.responderNextSet MoveLeftArrow];

        if ([model isKindOfClass:LJKeyBroadRespoderModel.class] && [model.view isKindOfClass:UIView.class]) {
            if ([self.responderNextSet moveThisView:model.view]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [model.view becomeFirstResponder];
                });
            } else {
                [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderNextSet];
            }
        } else {
            [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderNextSet];
        }
    }
}

- (void)didClickedRightArrowButton {
    if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && [self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [self.responderNextSet isValid]) {
        LJKeyBroadRespoderModel *model = [self.responderNextSet MoveRightArrow];

        if ([model isKindOfClass:LJKeyBroadRespoderModel.class] && [model.view isKindOfClass:UIView.class]) {
            if ([self.responderNextSet moveThisView:model.view]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [model.view becomeFirstResponder];
                });
            } else {
                [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderNextSet];
            }
        } else {
            [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderNextSet];
        }
    }
}

- (void)didClickedDone {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (LJKeyBroadMoveOffsetManager *)moveOffsetManager {
    if (_moveOffsetManager == nil) {
        _moveOffsetManager = [[LJKeyBroadMoveOffsetManager alloc]initWithMaster_object_keyBroad:self.object_keyBroad];
    }

    return _moveOffsetManager;
}

- (LJKeyboardReloadToolBar *)reloadTooBarUtil {
    if (_reloadTooBarUtil == nil) {
        _reloadTooBarUtil = [[LJKeyboardReloadToolBar alloc]initWithMaster_object_keyBroad:self.object_keyBroad];
    }

    return _reloadTooBarUtil;
}

- (LJKeyBroadInterfaceOrientationManager *)orientationManager {
    if (_orientationManager == nil) {
        _orientationManager = [[LJKeyBroadInterfaceOrientationManager alloc]initWithMaster_object_keyBroad:self.object_keyBroad];
    }

    return _orientationManager;
}

@end
