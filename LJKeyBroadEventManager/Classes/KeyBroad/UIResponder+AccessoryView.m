//
//  UIResponder+AccessoryView.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/28.
//

#import "UIResponder+AccessoryView.h"
#import <objc/runtime.h>

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
}

- (BOOL)LJKeyBroad_reloadInputViews_beofore {
    return NO;
}

- (void)LJKeyBroad_reloadInputViews_after {}

- (void)LJKeyBroad_reloadInputViews_UIResponder {
    if ([self isKindOfClass:UITextView.class] || [self isKindOfClass:UITextField.class]) {
        BOOL result = [self LJKeyBroad_reloadInputViews_beofore];
        [self LJKeyBroad_reloadInputViews_UIResponder];

        if (result) {
            [self LJKeyBroad_reloadInputViews_after];
        }
    } else {
        [self LJKeyBroad_reloadInputViews_UIResponder];
    }
}

@end
