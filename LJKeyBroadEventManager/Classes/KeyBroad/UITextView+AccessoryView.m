//
//  UITextView+AccessoryView.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/27.
//

#import "UITextView+AccessoryView.h"
#import <objc/runtime.h>
#import "LJKeyBroadInputAccessoryViewListerModel.h"
#import "UIResponder+AccessoryView.h"
#import "LJKeyBroadWeakAccessoryViewManager.h"
@implementation UITextView (AccessoryView)

+ (void)InputAccessoryViewChangeCallBackMethodExchange {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL sel = sel_registerName("setInputAccessoryView:");

            SEL NewSel = sel_registerName("LJKeyBroadsetInputAccessoryView:");

            Method originalMethod = class_getInstanceMethod(UITextView.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UITextView.class, NewSel);

            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
    [super InputAccessoryViewChangeCallBackMethodExchange_reloadInputViews];
}

- (BOOL)LJKeyBroad_reloadInputViews_beofore {
    [super LJKeyBroad_reloadInputViews_beofore];

    if ([[self keyBroadInputAccessoryViewListerModel_textField].oldInputAccessoryView isKindOfClass:UIView.class] && [[self keyBroadInputAccessoryViewListerModel_textField].neWInputAccessoryView isKindOfClass:UIView.class]) {
        if ([self keyBroadInputAccessoryViewListerModel_textField].oldInputAccessoryView == [self keyBroadInputAccessoryViewListerModel_textField].neWInputAccessoryView) {} else {
            if ([self keyBroadInputAccessoryViewListerModel_textField].Beforeblock) {
                return [self keyBroadInputAccessoryViewListerModel_textField].Beforeblock(self, [self keyBroadInputAccessoryViewListerModel_textField].oldInputAccessoryView, [self keyBroadInputAccessoryViewListerModel_textField].neWInputAccessoryView);
            }
        }
    }

    return NO;
}

- (void)LJKeyBroad_reloadInputViews_after {
    [super LJKeyBroad_reloadInputViews_after];

    if ([[self keyBroadInputAccessoryViewListerModel_textField].oldInputAccessoryView isKindOfClass:UIView.class] && [[self keyBroadInputAccessoryViewListerModel_textField].neWInputAccessoryView isKindOfClass:UIView.class]) {
        if ([self keyBroadInputAccessoryViewListerModel_textField].Afterblock) {
            [self keyBroadInputAccessoryViewListerModel_textField].Afterblock(self, [self keyBroadInputAccessoryViewListerModel_textField].oldInputAccessoryView, [self keyBroadInputAccessoryViewListerModel_textField].neWInputAccessoryView);
        }
    }

    [self keyBroadInputAccessoryViewListerModel_textField].oldInputAccessoryView = nil;
    [self keyBroadInputAccessoryViewListerModel_textField].neWInputAccessoryView = nil;
}

- (void)LJKeyBroadsetInputAccessoryView:(UIView *)inputAccessoryView {
    UIView  *oldInputAccessoryView = self.inputAccessoryView;
    UIView  *newInputAccessoryView = inputAccessoryView;

    if ((oldInputAccessoryView == newInputAccessoryView) && [newInputAccessoryView isKindOfClass:UIView.class]) {
        [self LJKeyBroadsetInputAccessoryView:[self configNewInputAccessoryView:newInputAccessoryView]];
    } else {
        if ([self keyBroadInputAccessoryViewListerModel_textField].madeBlock) {
            newInputAccessoryView = [self keyBroadInputAccessoryViewListerModel_textField].madeBlock(self, newInputAccessoryView);
        }

        if ((oldInputAccessoryView == newInputAccessoryView) && [newInputAccessoryView isKindOfClass:UIView.class]) {
            [self LJKeyBroadsetInputAccessoryView:[self configNewInputAccessoryView:newInputAccessoryView]];
        } else {
            [self LJKeyBroadsetInputAccessoryView:[self configNewInputAccessoryView:newInputAccessoryView]];

            if ([[self keyBroadInputAccessoryViewListerModel_textField].oldInputAccessoryView isKindOfClass:UIView.class]) {} else {
                [self keyBroadInputAccessoryViewListerModel_textField].oldInputAccessoryView = oldInputAccessoryView;
            }

            [self keyBroadInputAccessoryViewListerModel_textField].neWInputAccessoryView = newInputAccessoryView;
        }
    }
}

- (UIView *)configNewInputAccessoryView:(UIView *)newInputAccessoryView {
    [[LJKeyBroadWeakAccessoryViewManager sharedInstance] popView:newInputAccessoryView];

    return newInputAccessoryView;
}

- (void)configTextAccessoryViewListerBefore:(UITextViewAccessoryViewBlock)beforeBlock After:(UITextViewAccessoryViewBlock)afterBlock madeViewBlock:(UITextViewAccessoryNewViewBlock)madeViewBlock {
    [UITextView InputAccessoryViewChangeCallBackMethodExchange];

    [[self keyBroadInputAccessoryViewListerModel_textField] setBeforeblock:^BOOL (UIView *inputView, UIView *oldView, UIView *neweView) {
        UITextView *textView = (UITextView *)inputView;

        if ([textView isKindOfClass:UITextView.class]) {
            if (beforeBlock) {
                return beforeBlock(textView, oldView, neweView);
            }
        }

        return NO;
    }];

    [[self keyBroadInputAccessoryViewListerModel_textField] setAfterblock:^BOOL (UIView *inputView, UIView *oldView, UIView *neweView) {
        UITextView *textView = (UITextView *)inputView;

        if ([textView isKindOfClass:UITextView.class]) {
            if (afterBlock) {
                return afterBlock(textView, oldView, neweView);
            }
        }

        return NO;
    }];

    [[self keyBroadInputAccessoryViewListerModel_textField] setMadeBlock:^UIView *(UIView *inputView, UIView *view) {
        UITextView *textView = (UITextView *)inputView;

        if ([textView isKindOfClass:UITextView.class]) {
            if (madeViewBlock) {
                return madeViewBlock(textView, view);
            }
        }

        return view;
    }];
}

- (LJKeyBroadInputAccessoryViewListerModel *)keyBroadInputAccessoryViewListerModel_textField
{
    LJKeyBroadInputAccessoryViewListerModel *obj = objc_getAssociatedObject(self, @selector(keyBroadInputAccessoryViewListerModel_textField));

    if ([obj isKindOfClass:[LJKeyBroadInputAccessoryViewListerModel class]]) {
        return obj;
    } else {
        LJKeyBroadInputAccessoryViewListerModel *mess = [[LJKeyBroadInputAccessoryViewListerModel alloc]init];
        objc_setAssociatedObject(self, @selector(keyBroadInputAccessoryViewListerModel_textField), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return mess;
    }
}


@end
