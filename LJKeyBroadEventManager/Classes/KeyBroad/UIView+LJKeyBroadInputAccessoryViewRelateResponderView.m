//
//  UIView+LJKeyBroadInputAccessoryViewRelateResponderView.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/8.
//

#import "UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h"
#import <objc/runtime.h>
@implementation UIView (LJKeyBroadInputAccessoryViewRelateResponderView)

- (LJKeyBroadInputResponderViewEventControl *)keyBroadInputResponderViewEventControl_view {
    LJKeyBroadInputResponderViewEventControl *obj = objc_getAssociatedObject(self, @selector(keyBroadInputResponderViewEventControl_view));

    if ([obj isKindOfClass:[LJKeyBroadInputResponderViewEventControl class]]) {
        return obj;
    } else {
        LJKeyBroadInputResponderViewEventControl *mess = [[LJKeyBroadInputResponderViewEventControl alloc]initWithmasterView:self];
        objc_setAssociatedObject(self, @selector(keyBroadInputResponderViewEventControl_view), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        return mess;
    }
}

- (LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *)KeyBroadInputAccessoryViewRelateResponderModel {
    LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *model = objc_getAssociatedObject(self, @selector(KeyBroadInputAccessoryViewRelateResponderModel));

    if ([model isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
        return model;
    } else {
        LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *model = [[LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel alloc]initWithKeyeBroadInputViewController:self];
        [model setResponderView:self];
        objc_setAssociatedObject(self, @selector(KeyBroadInputAccessoryViewRelateResponderModel), model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return model;
    }
}

@end
