//
//  LJKeyboardReloadToolBar.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/3.
//

#import "LJKeyboardReloadToolBar.h"
#import "LJKeyBroadEventManager.h"
#import "LJkeyBroadConfig.h"

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
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:responderNextSet];
                    responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
                } else {
                    responderNextSet.currentResponderModel.ExtensionToolBarHeight = textView.inputAccessoryView.bounds.size.height;
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
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:responderNextSet];
                    responderNextSet.currentResponderModel.ExtensionToolBarHeight = 40;
                } else {
                    responderNextSet.currentResponderModel.ExtensionToolBarHeight = textView.inputAccessoryView.bounds.size.height;
                }
            }
        }
    }
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
