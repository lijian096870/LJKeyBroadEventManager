//
//  UITextView+AccessoryView.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/27.
//

#import "UITextView+AccessoryView.h"
#import <objc/runtime.h>
#import "LJKeyBroadAccessView.h"

@implementation UITextView (AccessoryView)

+ (void)InputAccessoryViewChangeCallBackMethodExchange {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL sel = sel_registerName("inputAccessoryView");
            SEL NewSel = sel_registerName("LJKeyBroad_inputAccessoryView");

            Method originalMethod = class_getInstanceMethod(UITextView.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UITextView.class, NewSel);

            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
}

- (UIView *)LJKeyBroad_inputAccessoryView {
    if ([self customer_Responder_reloadInputViews_value]) {
        return [self LJKeyBroad_input_AccessoryViewAdd:[self LJKeyBroad_inputAccessoryView]];
    } else {
        return [self LJKeyBroad_input_AccessoryViewMov:[self LJKeyBroad_inputAccessoryView]];
    }
}

- (UIView *)LJKeyBroad_input_AccessoryViewMov:(UIView *)AccessoryView {
    if ([AccessoryView isKindOfClass:LJKeyBroadAccessView.class]) {
        return [[self LJKeyBroad_textField_AccessoryViewSuperView] currentAccessView];
    } else {
        return AccessoryView;
    }
}

- (UIView *)LJKeyBroad_input_AccessoryViewAdd:(UIView *)AccessoryView {
    if ([AccessoryView isKindOfClass:LJKeyBroadAccessView.class]) {
        return AccessoryView;
    } else {
        LJKeyBroadAccessView *view = [self LJKeyBroad_textField_AccessoryViewSuperView];
        [view addAccessView:AccessoryView];
        return view;
    }
}

- (LJKeyBroadAccessView *)LJKeyBroad_textField_AccessoryViewSuperView {
    LJKeyBroadAccessView *view = objc_getAssociatedObject(self, @selector(LJKeyBroad_textField_AccessoryViewSuperView));

    if ([view isKindOfClass:LJKeyBroadAccessView.class]) {
        return view;
    } else {
        LJKeyBroadAccessView *view = [[LJKeyBroadAccessView alloc]initWithResponder:self];
        objc_setAssociatedObject(self, @selector(LJKeyBroad_textField_AccessoryViewSuperView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return view;
    }
}

@end
