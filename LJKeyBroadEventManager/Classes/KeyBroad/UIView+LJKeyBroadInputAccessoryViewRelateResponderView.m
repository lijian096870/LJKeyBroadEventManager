//
//  UIView+LJKeyBroadInputAccessoryViewRelateResponderView.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/8.
//

#import "UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h"
#import <objc/runtime.h>
#import "LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.h"
@implementation UIView (LJKeyBroadInputAccessoryViewRelateResponderView)

- (LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *)KeyBroadInputAccessoryViewRelateResponderModel_view{
    
    return objc_getAssociatedObject(self, @selector(keyBroadInputAccessoryViewRelateResponderView_view));
    
}

- (UIView *)keyBroadInputAccessoryViewRelateResponderView_view {
    LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *obj = [self KeyBroadInputAccessoryViewRelateResponderModel_view];

   UIView *result = obj.responderView;

      if ([result isKindOfClass:UIView.class]) {
          return result;
      } else {
          return obj.weakResponderView;
      }
}

- (void)setKeyBroadInputAccessoryViewRelateResponderView_view:(UIView *)view {
    LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *obj = objc_getAssociatedObject(self, @selector(keyBroadInputAccessoryViewRelateResponderView_view));

    if ([obj isKindOfClass:[LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel class]]) {
        obj.responderView = view;
    } else {
        LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *mess = [[LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel alloc]initWithKeyeBroadInputViewController:self];
        objc_setAssociatedObject(self, @selector(keyBroadInputAccessoryViewRelateResponderView_view), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        mess.responderView = view;
    }
}

@end
