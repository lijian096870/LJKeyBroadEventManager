//
//  LJKeyboardReloadToolBar.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/3.
//

#import "LJKeyboardReloadToolBar.h"
#import "LJKeyBroadEventManager.h"
#import "LJkeyBroadConfig.h"
#import "LJViewKit.h"
#import "UIViewController+KeyBoradManager.h"
#import "LJViewControllerManager.h"
#import "UIViewController+KeyBoradManager.h"
#import "LJKeyBroadRegisterManager.h"
#import "UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h"
#import "UITextField+AccessoryView.h"
#import "UITextView+AccessoryView.h"
#import "LJKeyBroadWeakAccessoryViewManager.h"

typedef void (^ AccessoryViewAddBlock)(UIView *view);
typedef void (^ AccessoryViewMoveBlock)(UIView *view);

@interface UIViewController () <LJKeyboardManagerDelegate>

@end

@interface LJKeyBroadRegisterManager ()

- (void)ShowkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view;

- (void)HiddenkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view;

@end

@interface LJKeyboardReloadToolBar ()

@property(nonatomic, weak) UIViewController *object_keyBroad;

@end

@implementation LJKeyboardReloadToolBar

- (instancetype)initWithMaster_object_keyBroad:(UIViewController *)object
{
    self = [super init];

    if (self) {
        self.object_keyBroad = object;
    }

    return self;
}

+ (BOOL)keybroadheightEqueThenAccessViewHeight:(UIView *)responderView andKeybroad:(CGFloat)keyBroadHeight {
    if (keyBroadHeight > 0.0) {
        if ([responderView isKindOfClass:UITextView.class]) {
            UITextView  *textView = (UITextView *)responderView;
            UIView      *inputAccessoryView = textView.inputAccessoryView;

            if ([inputAccessoryView isKindOfClass:UIView.class]) {
                CGFloat inputAccessoryViewHeight = inputAccessoryView.bounds.size.height;

                if (inputAccessoryViewHeight < keyBroadHeight) {
                    return YES;
                } else {
                    return NO;
                }
            } else {
                return YES;
            }
        } else if ([responderView isKindOfClass:UITextField.class]) {
            UITextField *textView = (UITextField *)responderView;
            UIView      *inputAccessoryView = textView.inputAccessoryView;

            if ([inputAccessoryView isKindOfClass:UIView.class]) {
                CGFloat inputAccessoryViewHeight = inputAccessoryView.bounds.size.height;

                if (inputAccessoryViewHeight < keyBroadHeight) {
                    return YES;
                } else {
                    return NO;
                }
            } else {
                return YES;
            }
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

- (void)configLJKeyboardToolBar:(LJKeyBroadRespoderNextSet *)responderNextSet andNewToolBar:(LJKeyboardToolBar *)bar {
    if ([self.object_keyBroad respondsToSelector:@selector(TopSpacingToFirstResponder:)]) {
        responderNextSet.currentResponderModel.topSpacingToFirstResponder = [self.object_keyBroad TopSpacingToFirstResponder:responderNextSet.currentResponderModel.view];
    } else {
        responderNextSet.currentResponderModel.topSpacingToFirstResponder = [LJkeyBroadConfig sharedInstance].topSpacingToFirstResponder;
    }

    if ([self.object_keyBroad respondsToSelector:@selector(ShowExtensionToolBar:)]) {
        responderNextSet.currentResponderModel.showExtensionToolBar = [self.object_keyBroad ShowExtensionToolBar:responderNextSet.currentResponderModel.view];
    } else {
        responderNextSet.currentResponderModel.showExtensionToolBar = [LJkeyBroadConfig sharedInstance].showExtensionToolBar;
    }

    if (responderNextSet.currentResponderModel.showExtensionToolBar) {
        if ([responderNextSet.currentResponderModel.view isKindOfClass:[UITextField class]]) {
            UITextField *textView = ((UITextField *)responderNextSet.currentResponderModel.view);

            if (textView.inputAccessoryView == nil) {
                textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:responderNextSet];

                responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
            } else {
                if ([textView.inputAccessoryView isKindOfClass:[LJKeyboardToolBar class]]) {
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:(LJKeyboardToolBar *)(textView.inputAccessoryView) and:responderNextSet];
                    responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
                } else {
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:responderNextSet];
                    responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
                }
            }
        }

        if ([responderNextSet.currentResponderModel.view isKindOfClass:[UITextView class]]) {
            UITextView *textView = ((UITextView *)responderNextSet.currentResponderModel.view);

            if (textView.inputAccessoryView == nil) {
                textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:responderNextSet];

                responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
            } else {
                if ([textView.inputAccessoryView isKindOfClass:[LJKeyboardToolBar class]]) {
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:(LJKeyboardToolBar *)(textView.inputAccessoryView) and:responderNextSet];
                    responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
                } else {
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:responderNextSet];
                    responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
                }
            }
        }
    }

    [self KeyboardToolBarLister:responderNextSet.currentResponderModel];
}

- (void)KeyboardToolBarLister:(LJKeyBroadRespoderModel *)model {
    UIView *view = model.view;

    if ([view isKindOfClass:UIView.class]) {
        UIView *inputAccessoryView = nil;

        if ([view isKindOfClass:UITextField.class]) {
            UITextField *textField = (UITextField *)view;

            if ([textField.inputAccessoryView isKindOfClass:UIView.class]) {
                inputAccessoryView = textField.inputAccessoryView;
            } else {
                inputAccessoryView = [self.class madeInputAccessoryView];

                textField.inputAccessoryView = inputAccessoryView;
            }
        }

        if ([view isKindOfClass:UITextView.class]) {
            UITextView *textField = (UITextView *)view;

            if ([textField.inputAccessoryView isKindOfClass:UIView.class]) {
                inputAccessoryView = textField.inputAccessoryView;
            } else {
                inputAccessoryView = [self.class madeInputAccessoryView];

                textField.inputAccessoryView = inputAccessoryView;
            }
        }

        [self.class configChangeAccessoryViewBlock:view clear:YES];
        [self.class accessoryViewCheck:view AccessoryView:inputAccessoryView model:nil];
    }
}

+ (void)accessoryViewCheck:(UIView *)view AccessoryView:(UIView *)inputAccessoryView model:(LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *)model {
    UIView *currentKeyBroadAccessoryView = [[LJKeyBroadWeakAccessoryViewManager sharedInstance] currentKeyBroadAccessoryView];

    NSLog(@"%@,%@,%d", currentKeyBroadAccessoryView, inputAccessoryView,currentKeyBroadAccessoryView== inputAccessoryView);

    if ([currentKeyBroadAccessoryView isKindOfClass:UIView.class]) {
        if (currentKeyBroadAccessoryView == inputAccessoryView) {
            AccessoryViewMoveBlock moveKeyBlock = [self getAccessoryViewMoveBlockDelay:NO hiddenkeyBroadInputAccessoryView:NO];

            if (moveKeyBlock) {
                moveKeyBlock(inputAccessoryView);
            }

            [inputAccessoryView setKeyBroadInputAccessoryViewRelateResponderView_view_model:model];
            [inputAccessoryView setKeyBroadInputAccessoryViewRelateResponderView_view:view];
            AccessoryViewAddBlock addKeyBlock = [self getAccessoryViewAddBlock];

            if (addKeyBlock) {
                addKeyBlock(inputAccessoryView);
            }

            [self.class configAccessorySuperViewChange:view inputAccessoryView:inputAccessoryView delay:YES hiddenkeyBroadInputAccessoryView:YES];
        } else {
            [self.class configAccessorySuperViewChange:view inputAccessoryView:currentKeyBroadAccessoryView delay:NO hiddenkeyBroadInputAccessoryView:NO];

            [inputAccessoryView setKeyBroadInputAccessoryViewRelateResponderView_view_model:model];
            [inputAccessoryView setKeyBroadInputAccessoryViewRelateResponderView_view:view];
            [self.class configAccessorySuperViewChange:view inputAccessoryView:inputAccessoryView delay:YES hiddenkeyBroadInputAccessoryView:YES];
        }
    } else {
        [inputAccessoryView setKeyBroadInputAccessoryViewRelateResponderView_view_model:model];
        [inputAccessoryView setKeyBroadInputAccessoryViewRelateResponderView_view:view];
        [self.class configAccessorySuperViewChange:view inputAccessoryView:inputAccessoryView delay:YES hiddenkeyBroadInputAccessoryView:YES];
    }
}

+ (void)configAccessorySuperViewChange:(UIView *)view inputAccessoryView:(UIView *)inputAccessoryView delay:(BOOL)delay hiddenkeyBroadInputAccessoryView:(BOOL)hiddenkeyBroadInputAccessoryView {
    if (([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) && inputAccessoryView) {
        AccessoryViewAddBlock   addKeyBlock = [self getAccessoryViewAddBlock];
        AccessoryViewMoveBlock  moveKeyBlock = [self getAccessoryViewMoveBlockDelay:delay hiddenkeyBroadInputAccessoryView:hiddenkeyBroadInputAccessoryView];

        AddWindowWillAddKeyBlock(inputAccessoryView, @"_LJKeyboardReloadToolBar", ^(UIView *view) {
            AddWindowWillAddKeyBlock(view, @"_LJKeyboardReloadToolBar", ^(UIView *view) {});
            addKeyBlock(view);
        });

        AddWindowDidMoveKeyBlock(inputAccessoryView, @"_LJKeyboardReloadToolBar", ^(UIView *view) {
            AddWindowDidMoveKeyBlock(view, @"_LJKeyboardReloadToolBar", ^(UIView *view) {});
            moveKeyBlock(view);
        });
    }
}

+ (void)configChangeAccessoryViewBlock:(UIView *)view clear:(BOOL)clear {
    if ([view isKindOfClass:UITextField.class]) {
        UITextField *textField = (UITextField *)view;

        if (clear) {
            [textField configTextAccessoryViewListerBefore:nil After:nil viewMadeBlock:^UIView *(UITextField *textField, UIView *view) {
                if ([view isKindOfClass:UIView.class]) {
                    [LJKeyboardReloadToolBar clearViewListerBlock:view];
                    return view;
                } else {
                    return [LJKeyboardReloadToolBar madeInputAccessoryView];
                }
            }];
        } else {
            [textField configTextAccessoryViewListerBefore:^BOOL (UITextField *textField, UIView *oldView, UIView *neweView) {
                UIView *currentKeyBroadAccessoryView = [[LJKeyBroadWeakAccessoryViewManager sharedInstance] currentKeyBroadAccessoryView];

                if ([currentKeyBroadAccessoryView isKindOfClass:UIView.class] && (oldView == currentKeyBroadAccessoryView)) {
                    if ([oldView KeyBroadInputAccessoryViewRelateResponderModel_view].state == LJKeyBroadInputAccessoryViewAdd) {
                        LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *model = [oldView KeyBroadInputAccessoryViewRelateResponderModel_view];

                        if ([model isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
                            [LJKeyboardReloadToolBar configAccessorySuperViewChange:textField inputAccessoryView:oldView delay:NO hiddenkeyBroadInputAccessoryView:NO];

                            [neweView setKeyBroadInputAccessoryViewRelateResponderView_view_model:model];
                            [neweView setKeyBroadInputAccessoryViewRelateResponderView_view:view];

                            [LJKeyboardReloadToolBar configAccessorySuperViewChange:textField inputAccessoryView:neweView delay:YES hiddenkeyBroadInputAccessoryView:YES];

                            return YES;
                        }
                    }
                }

                return NO;
            } After:^BOOL (UITextField *textField, UIView *oldView, UIView *neweView) {
                return NO;
            } viewMadeBlock:^UIView *(UITextField *textField, UIView *view) {
                if ([view isKindOfClass:UIView.class]) {
                    [LJKeyboardReloadToolBar clearViewListerBlock:view];
                    return view;
                } else {
                    return [LJKeyboardReloadToolBar madeInputAccessoryView];
                }
            }];
        }
    }

    if ([view isKindOfClass:UITextView.class]) {
        UITextView *textField = (UITextView *)view;

        if (clear) {
            [textField configTextAccessoryViewListerBefore:nil After:nil madeViewBlock:nil];
        } else {
            [textField configTextAccessoryViewListerBefore:^BOOL (UITextView *textView, UIView *oldView, UIView *neweView) {
                UIView *currentKeyBroadAccessoryView = [[LJKeyBroadWeakAccessoryViewManager sharedInstance] currentKeyBroadAccessoryView];

                if ([currentKeyBroadAccessoryView isKindOfClass:UIView.class] && (oldView == currentKeyBroadAccessoryView)) {
                    if ([oldView KeyBroadInputAccessoryViewRelateResponderModel_view].state == LJKeyBroadInputAccessoryViewAdd) {
                        LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *model = [oldView KeyBroadInputAccessoryViewRelateResponderModel_view];

                        if ([model isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
                            [LJKeyboardReloadToolBar configAccessorySuperViewChange:textView inputAccessoryView:oldView delay:NO hiddenkeyBroadInputAccessoryView:NO];

                            [neweView setKeyBroadInputAccessoryViewRelateResponderView_view_model:model];
                            [neweView setKeyBroadInputAccessoryViewRelateResponderView_view:view];

                            [LJKeyboardReloadToolBar configAccessorySuperViewChange:textView inputAccessoryView:neweView delay:YES hiddenkeyBroadInputAccessoryView:YES];

                            return YES;
                        }
                    }
                }

                return NO;
            } After:^BOOL (UITextView *textView, UIView *oldView, UIView *neweView) {
                return NO;
            } madeViewBlock:^UIView *(UITextView *textView, UIView *view) {
                if ([view isKindOfClass:UIView.class]) {
                    [LJKeyboardReloadToolBar clearViewListerBlock:view];
                    return view;
                } else {
                    return [LJKeyboardReloadToolBar madeInputAccessoryView];
                }
            }];
        }
    }
}

+ (AccessoryViewAddBlock)getAccessoryViewAddBlock {
    AccessoryViewAddBlock addKeyBlock = ^(UIView *view) {
        if ([view KeyBroadInputAccessoryViewRelateResponderModel_view].state == LJKeyBroadInputAccessoryViewMove) {
            [[view KeyBroadInputAccessoryViewRelateResponderModel_view] didAdd];
            UIView *responderView = [view keyBroadInputAccessoryViewRelateResponderView_view];

            if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
                [view setKeyBroadInputAccessoryViewRelateResponderView_view:responderView];
                [[view KeyBroadInputAccessoryViewRelateResponderModel_view] lockCanRunHidenBlock:NO];
                [responderView.keyBroadInputResponderViewEventControl_view beginResponderAllEvent];
                [view.KeyBroadInputAccessoryViewRelateResponderModel_view startLister];
                [[LJKeyBroadRegisterManager sharedInstance] ShowkeyBroadInputAccessoryViewRelateCallBlock:responderView];
                [LJKeyboardReloadToolBar configChangeAccessoryViewBlock:responderView clear:NO];
            }
        }
    };

    return addKeyBlock;
}

+ (AccessoryViewMoveBlock)getAccessoryViewMoveBlockDelay:(BOOL)delay hiddenkeyBroadInputAccessoryView:(BOOL)hiddenkeyBroadInputAccessoryView {
    if (delay) {
        AccessoryViewMoveBlock moveKeyBlock = ^(UIView *view) {
            if ([view KeyBroadInputAccessoryViewRelateResponderModel_view].state == LJKeyBroadInputAccessoryViewAdd) {
                [[view KeyBroadInputAccessoryViewRelateResponderModel_view] didMove];

                UIView *responderView = [view keyBroadInputAccessoryViewRelateResponderView_view];
                [responderView.keyBroadInputResponderViewEventControl_view endShowEvent];
                [[view KeyBroadInputAccessoryViewRelateResponderModel_view] lockCantShowStatue];
                [[view KeyBroadInputAccessoryViewRelateResponderModel_view] lockCanRunHidenBlock:YES];
                [LJKeyboardReloadToolBar configChangeAccessoryViewBlock:responderView clear:YES];
                dispatch_async(dispatch_get_main_queue(), ^{
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        if ([[view KeyBroadInputAccessoryViewRelateResponderModel_view] canRunHidenBlockQuery]) {
                            [[view KeyBroadInputAccessoryViewRelateResponderModel_view] lockCanRunHidenBlock:NO];
                            UIView *responderView = [view keyBroadInputAccessoryViewRelateResponderView_view];

                            if (hiddenkeyBroadInputAccessoryView) {
                                if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
                                    [[LJKeyBroadRegisterManager sharedInstance] HiddenkeyBroadInputAccessoryViewRelateCallBlock:responderView];
                                }
                            }

                            [responderView.keyBroadInputResponderViewEventControl_view endResponderAllEvent];
                            [view.KeyBroadInputAccessoryViewRelateResponderModel_view endLister];
                            [view setKeyBroadInputAccessoryViewRelateResponderView_view_model:nil];
                        }
                    });
                });
            }
        };

        return moveKeyBlock;
    } else {
        AccessoryViewMoveBlock moveKeyBlock = ^(UIView *view) {
            if ([view KeyBroadInputAccessoryViewRelateResponderModel_view].state == LJKeyBroadInputAccessoryViewAdd) {
                [[view KeyBroadInputAccessoryViewRelateResponderModel_view] didMove];

                UIView *responderView = [view keyBroadInputAccessoryViewRelateResponderView_view];
                [responderView.keyBroadInputResponderViewEventControl_view endShowEvent];
                [[view KeyBroadInputAccessoryViewRelateResponderModel_view] lockCantShowStatue];
                [[view KeyBroadInputAccessoryViewRelateResponderModel_view] lockCanRunHidenBlock:YES];
                [LJKeyboardReloadToolBar configChangeAccessoryViewBlock:responderView clear:YES];

                if ([[view KeyBroadInputAccessoryViewRelateResponderModel_view] canRunHidenBlockQuery]) {
                    [[view KeyBroadInputAccessoryViewRelateResponderModel_view] lockCanRunHidenBlock:NO];
                    UIView *responderView = [view keyBroadInputAccessoryViewRelateResponderView_view];

                    if (hiddenkeyBroadInputAccessoryView) {
                        if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
                            [[LJKeyBroadRegisterManager sharedInstance] HiddenkeyBroadInputAccessoryViewRelateCallBlock:responderView];
                        }
                    }

                    [responderView.keyBroadInputResponderViewEventControl_view endResponderAllEvent];
                    [view.KeyBroadInputAccessoryViewRelateResponderModel_view endLister];
                    [view setKeyBroadInputAccessoryViewRelateResponderView_view_model:nil];
                }
            }
        };
        return moveKeyBlock;
    }
}

+ (void)clearViewListerBlock:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        AddWindowWillAddKeyBlock(view, @"_LJKeyboardReloadToolBar", ^(UIView *view) {});
        AddWindowDidMoveKeyBlock(view, @"_LJKeyboardReloadToolBar", ^(UIView *view) {});
    }
}

+ (UIView *)madeInputAccessoryView {
    UIView *view = [[LJKeyboardAccessViewRetainResponderView alloc]init];

    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void)reloadLJKeyboardToolBarAndResponderModel:(LJKeyBroadRespoderNextSet *)responderNextSet {
    if ([responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [responderNextSet isValid]) {
        UIView *bar = nil;

        if ([responderNextSet.currentResponderModel.view isKindOfClass:[UITextView class]]) {
            UITextView *textView = ((UITextView *)responderNextSet.currentResponderModel.view);
            bar = textView.inputAccessoryView;
        }

        if ([responderNextSet.currentResponderModel.view isKindOfClass:[UITextField class]]) {
            UITextField *textView = ((UITextField *)responderNextSet.currentResponderModel.view);
            bar = textView.inputAccessoryView;
        }

        if ([bar isKindOfClass:LJKeyboardToolBar.class]) {
            LJKeyboardToolBar *keyBroadBar = (LJKeyboardToolBar *)bar;

            [self reloadLJKeyboardToolBar:keyBroadBar and:responderNextSet];
        }
    }
}

- (LJKeyboardToolBar *)reloadLJKeyboardToolBar:(LJKeyboardToolBar *)bar and:(LJKeyBroadRespoderNextSet *)responderNextSet {
    if (self.object_keyBroad.isViewLoaded && [responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [responderNextSet isValid]) {
        bar.leftbtn.enabled = [responderNextSet CanLeftArrow];

        bar.rightbtn.enabled = [responderNextSet CanRightArrow];
    } else {
        bar.leftbtn.enabled = NO;
        bar.rightbtn.enabled = NO;
    }

    return bar;
}

@end
