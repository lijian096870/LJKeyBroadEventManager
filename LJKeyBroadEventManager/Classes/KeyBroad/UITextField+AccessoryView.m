//
//  UITextField+AccessoryView.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/27.
//

#import "UITextField+AccessoryView.h"
#import <objc/runtime.h>
#import "LJKeyBroadAccessView.h"
@implementation UITextField (AccessoryView)

+ (void)InputAccessoryViewChangeCallBackMethodExchange {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL sel = sel_registerName("inputAccessoryView");
            SEL NewSel = sel_registerName("LJKeyBroad_inputAccessoryView");

            Method originalMethod = class_getInstanceMethod(UITextField.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UITextField.class, NewSel);

            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL sel = sel_registerName("setInputAccessoryView:");
            SEL NewSel = sel_registerName("LJKeyBroad_setInputAccessoryView:");

            Method originalMethod = class_getInstanceMethod(UITextField.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UITextField.class, NewSel);

            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
}

- (void)LJKeyBroad_setInputAccessoryView:(UIView *)inputAccessoryView {
    if ([inputAccessoryView isKindOfClass:UIView.class]) {
        UIView *currentAccessView = [self LJKeyBroad_input_AccessoryViewMov:[self LJKeyBroad_inputAccessoryView]];
        [self LJKeyBroad_setInputAccessoryView:[self LJKeyBroad_input_AccessoryViewMov:inputAccessoryView]];

        if (currentAccessView == inputAccessoryView) {} else {
            objc_setAssociatedObject(self, @selector(LJKeyBroad_textField_AccessoryViewSuperView), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    } else {
        [self LJKeyBroad_setInputAccessoryView:nil];
        objc_setAssociatedObject(self, @selector(LJKeyBroad_textField_AccessoryViewSuperView), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (UIView *)LJKeyBroad_inputAccessoryView {
    if ([self customer_Responder_AccessoryViewFundation_value]) {
        return [self LJKeyBroad_input_AccessoryViewAdd:[self LJKeyBroad_inputAccessoryView]];
    } else {
        return [self LJKeyBroad_input_AccessoryViewMov:[self LJKeyBroad_inputAccessoryView]];
    }
}

- (UIView *)LJKeyBroad_input_AccessoryViewMov:(UIView *)AccessoryView {
    if ([AccessoryView isKindOfClass:LJKeyBroadAccessView.class]) {
        return [self LJKeyBroad_input_AccessoryViewMov:[(LJKeyBroadAccessView *)AccessoryView  currentAccessView]];
    } else {
        return AccessoryView;
    }
}

- (UIView *)LJKeyBroad_input_AccessoryViewAdd:(UIView *)AccessoryView {
    if ([AccessoryView isKindOfClass:LJKeyBroadAccessView.class]) {
        return [self LJKeyBroad_input_AccessoryViewAdd:[self LJKeyBroad_input_AccessoryViewMov:AccessoryView]];
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
