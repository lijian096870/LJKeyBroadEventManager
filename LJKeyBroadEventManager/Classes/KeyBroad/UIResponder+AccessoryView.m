//
//  UIResponder+AccessoryView.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/28.
//

#import "UIResponder+AccessoryView.h"
#import <objc/runtime.h>
#import "LJViewKit.h"
#import "UITextView+AccessoryView.h"
#import "UITextField+AccessoryView.h"

@interface UITextField ()

- (UIView *)LJKeyBroad_input_AccessoryViewMov:(UIView *)AccessoryView;

@end

@interface UITextView ()

- (UIView *)LJKeyBroad_input_AccessoryViewMov:(UIView *)AccessoryView;

@end

@implementation UIResponder (AccessoryView)

+ (void)InputAccessoryViewChangeCallBackMethodExchange_reloadInputViews {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL sel = sel_registerName("reloadInputViews");
            SEL NewSel = sel_registerName("LJKeyBroad_reloadInputViews_UIResponder");
            Method originalMethod = class_getInstanceMethod(UIResponder.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UIResponder.class, NewSel);
            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
    {
        [UITextField InputAccessoryViewChangeCallBackMethodExchange];
        [UITextView InputAccessoryViewChangeCallBackMethodExchange];
    }
}

- (UIView *)LJKeyBroad_customer_inputAccessoryView {
    if ([self isKindOfClass:UITextField.class]) {
        UITextField *textField = (UITextField *)self;

        return [textField LJKeyBroad_input_AccessoryViewMov:self.inputAccessoryView];
    }

    if ([self isKindOfClass:UITextView.class]) {
        UITextView *textView = (UITextView *)self;

        return [textView LJKeyBroad_input_AccessoryViewMov:self.inputAccessoryView];
    }

    return nil;
}

- (void)setAccessoryViewinputAccessoryViewFundation:(BOOL)state {
    [self customer_Responder_AccessoryViewFundation_value:state];
}

- (void)LJKeyBroad_reloadInputViews_UIResponder {
    if ([self customer_Responder_AccessoryViewFundation_value]) {
        [self customer_Responder_reloadInputViews_value:YES];
        [self LJKeyBroad_reloadInputViews_UIResponder];
        [self customer_Responder_reloadInputViews_value:NO];
    } else {
        [self LJKeyBroad_reloadInputViews_UIResponder];
    }
}

- (void)customer_Responder_AccessoryViewFundation_value:(BOOL)value {
    objc_setAssociatedObject(self, @selector(customer_Responder_AccessoryViewFundation_value), [NSNumber numberWithBool:value], OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    if (value) {
        if ([self isKindOfClass:UIView.class]) {
            AddViewDidRemoveKeyBlock((UIView *)self, @"0_LJKeyBroad_input_AccessoryView_value", ^(UIView *view, UIView *superView) {
                [view customer_Responder_AccessoryViewFundation_value:NO];
            });
        }
    }
}

- (BOOL)customer_Responder_AccessoryViewFundation_value {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(customer_Responder_AccessoryViewFundation_value));

    if ([obj isKindOfClass:[NSNumber class]]) {
        return [obj boolValue];
    } else {
        NSNumber *mess = [NSNumber numberWithBool:NO];
        objc_setAssociatedObject(self, @selector(customer_Responder_AccessoryViewFundation_value), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return [mess boolValue];
    }
}

- (void)customer_Responder_reloadInputViews_value:(BOOL)value {
    objc_setAssociatedObject(self, @selector(customer_Responder_reloadInputViews_value), [NSNumber numberWithBool:value], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)customer_Responder_reloadInputViews_value {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(customer_Responder_reloadInputViews_value));

    if ([obj isKindOfClass:[NSNumber class]]) {
        return [obj boolValue];
    } else {
        NSNumber *mess = [NSNumber numberWithBool:NO];
        objc_setAssociatedObject(self, @selector(customer_Responder_reloadInputViews_value), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return [mess boolValue];
    }
}

@end
