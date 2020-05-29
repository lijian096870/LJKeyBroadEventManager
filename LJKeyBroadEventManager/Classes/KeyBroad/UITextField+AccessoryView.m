//
//  UITextField+AccessoryView.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/27.
//

#import "UITextField+AccessoryView.h"
#import <objc/runtime.h>
#import "LJKeyBroadInputAccessoryViewListerModel.h"
#import "UIResponder+AccessoryView.h"
#import "LJKeyBroadWeakAccessoryViewManager.h"

@implementation UITextField (AccessoryView)

+ (void)InputAccessoryViewChangeCallBackMethodExchange {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL sel = sel_registerName("setInputAccessoryView:");

            SEL NewSel = sel_registerName("LJKeyBroadsetInputAccessoryView:");

            Method originalMethod = class_getInstanceMethod(UITextField.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UITextField.class, NewSel);

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

- (void)configTextAccessoryViewListerBefore:(UITextFieldAccessoryViewBlock)beforeBlock After:(UITextFieldAccessoryViewBlock)afterBlock viewMadeBlock:(UITextFieldNewAccessoryViewBlock)madeViewBlock {
    [UITextField InputAccessoryViewChangeCallBackMethodExchange];
    [[self keyBroadInputAccessoryViewListerModel_textField] setBeforeblock:^BOOL (UIView *inputView, UIView *oldView, UIView *neweView) {
        UITextField *textField = (UITextField *)inputView;

        if ([textField isKindOfClass:UITextField.class]) {
            if (beforeBlock) {
                return beforeBlock(textField, oldView, neweView);
            }
        }

        return NO;
    }];

    [[self keyBroadInputAccessoryViewListerModel_textField] setAfterblock:^BOOL (UIView *inputView, UIView *oldView, UIView *neweView) {
        UITextField *textField = (UITextField *)inputView;

        if ([textField isKindOfClass:UITextField.class]) {
            if (afterBlock) {
                return afterBlock(textField, oldView, neweView);
            }
        }

        return NO;
    }];
    [[self keyBroadInputAccessoryViewListerModel_textField] setMadeBlock:^UIView *(UIView *inputView, UIView *view) {
        UITextField *textField = (UITextField *)inputView;

        if ([textField isKindOfClass:UITextField.class]) {
            if (madeViewBlock) {
                return madeViewBlock(textField, view);
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
