//
//  LJKeyboardReloadToolBar.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/3.
//

#import "LJKeyboardReloadToolBar.h"
#import "LJKeyBroadEventManager.h"
#import "LJkeyBroadConfig.h"
#import "UIViewController+KeyBoradManager.h"
#import "LJViewControllerManager.h"
#import "UIViewController+KeyBoradManager.h"
#import "LJKeyBroadRegisterManager.h"
#import "UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h"
#import "UIResponder+AccessoryView.h"

@interface UIViewController () <LJKeyboardManagerDelegate>

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
            UIView      *inputAccessoryView = [textView LJKeyBroad_customer_inputAccessoryView];

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
            UIView      *inputAccessoryView = [textView LJKeyBroad_customer_inputAccessoryView];

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

            if ([textView LJKeyBroad_customer_inputAccessoryView] == nil) {
                textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:responderNextSet];

                responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
            } else {
                if ([[textView LJKeyBroad_customer_inputAccessoryView] isKindOfClass:[LJKeyboardToolBar class]]) {
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:(LJKeyboardToolBar *)([textView LJKeyBroad_customer_inputAccessoryView]) and:responderNextSet];
                    responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
                } else {
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:responderNextSet];
                    responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
                }
            }
        }

        if ([responderNextSet.currentResponderModel.view isKindOfClass:[UITextView class]]) {
            UITextView *textView = ((UITextView *)responderNextSet.currentResponderModel.view);

            if ([textView LJKeyBroad_customer_inputAccessoryView] == nil) {
                textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:responderNextSet];

                responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
            } else {
                if ([[textView LJKeyBroad_customer_inputAccessoryView] isKindOfClass:[LJKeyboardToolBar class]]) {
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:(LJKeyboardToolBar *)([textView LJKeyBroad_customer_inputAccessoryView]) and:responderNextSet];
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

            if ([[textField LJKeyBroad_customer_inputAccessoryView] isKindOfClass:UIView.class]) {
                inputAccessoryView = [textField LJKeyBroad_customer_inputAccessoryView];
            } else {
                inputAccessoryView = [self madeInputAccessoryView:model.window.bounds.size.width];

                textField.inputAccessoryView = inputAccessoryView;
            }
        }

        if ([view isKindOfClass:UITextView.class]) {
            UITextView *textField = (UITextView *)view;

            if ([[textField LJKeyBroad_customer_inputAccessoryView] isKindOfClass:UIView.class]) {
                inputAccessoryView = [textField LJKeyBroad_customer_inputAccessoryView];
            } else {
                inputAccessoryView = [self madeInputAccessoryView:model.window.bounds.size.width];

                textField.inputAccessoryView = inputAccessoryView;
            }
        }

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            inputAccessoryView.frame = CGRectMake(0, 0, inputAccessoryView.bounds.size.width, 50);
        });
        
        [view setAccessoryViewinputAccessoryViewFundation:YES];
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
            bar = [textView LJKeyBroad_customer_inputAccessoryView];
        }

        if ([responderNextSet.currentResponderModel.view isKindOfClass:[UITextField class]]) {
            UITextField *textView = ((UITextField *)responderNextSet.currentResponderModel.view);
            bar = [textView LJKeyBroad_customer_inputAccessoryView];
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
