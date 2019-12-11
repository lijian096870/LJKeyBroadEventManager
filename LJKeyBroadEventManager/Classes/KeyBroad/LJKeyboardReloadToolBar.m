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
                inputAccessoryView = [self madeInputAccessoryView:model.window.bounds.size.width];

                textField.inputAccessoryView = inputAccessoryView;
            }
        }

        if ([view isKindOfClass:UITextView.class]) {
            UITextView *textField = (UITextView *)view;

            if ([textField.inputAccessoryView isKindOfClass:UIView.class]) {
                inputAccessoryView = textField.inputAccessoryView;
            } else {
                inputAccessoryView = [self madeInputAccessoryView:model.window.bounds.size.width];

                textField.inputAccessoryView = inputAccessoryView;
            }
        }

        if ([model.view isKindOfClass:UIView.class] && inputAccessoryView) {
            if ([inputAccessoryView isKindOfClass:LJKeyboardAccessViewRetainResponderView.class]) {
                [(LJKeyboardAccessViewRetainResponderView *)inputAccessoryView configResponderView:model.view];
            } else {
                [inputAccessoryView setKeyBroadInputAccessoryViewRelateResponderView_view:model.view];

                AddWindowWillAddKeyBlock(inputAccessoryView, @"_LJKeyboardReloadToolBar", ^(UIView *view) {
                    UIView *responderView = [view keyBroadInputAccessoryViewRelateResponderView_view];

                    if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
                        [view setKeyBroadInputAccessoryViewRelateResponderView_view:responderView];
                        [responderView.keyBroadInputResponderViewEventControl_view beginResponderAllEvent];
                        [view.KeyBroadInputAccessoryViewRelateResponderModel_view startLister];

                        [[LJKeyBroadRegisterManager sharedInstance] ShowkeyBroadInputAccessoryViewRelateCallBlock:responderView];
                    }
                });

                AddWindowDidMoveKeyBlock(inputAccessoryView, @"_LJKeyboardReloadToolBar", ^(UIView *view) {
                    UIView *responderView = [view keyBroadInputAccessoryViewRelateResponderView_view];
                    [responderView.keyBroadInputResponderViewEventControl_view endShowEvent];
                    [view.KeyBroadInputAccessoryViewRelateResponderModel_view lockCantShowStatue];

                    dispatch_async(dispatch_get_main_queue(), ^{
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            UIView *responderView = [view keyBroadInputAccessoryViewRelateResponderView_view];

                            if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
                                [[LJKeyBroadRegisterManager sharedInstance] HiddenkeyBroadInputAccessoryViewRelateCallBlock:responderView];
                            }

                            [responderView.keyBroadInputResponderViewEventControl_view endResponderAllEvent];
                            [view.KeyBroadInputAccessoryViewRelateResponderModel_view endLister];

                            [view setKeyBroadInputAccessoryViewRelateResponderView_view:nil];
                        });
                    });
                });
            }
        }
    }
}

- (UIView *)madeInputAccessoryView:(CGFloat)width {
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
