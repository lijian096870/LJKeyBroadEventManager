//
//  UIView+LJKeyBroadInputAccessoryViewRelateResponderView.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/8.
//

#import "UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h"
#import <objc/runtime.h>
#import "LJKeyBroadInputAccessoryViewRelateResponderViewModel.h"
@implementation UIView (LJKeyBroadInputAccessoryViewRelateResponderView)



-(UIView*)keyBroadInputAccessoryViewRelateResponderView{
    
    LJKeyBroadInputAccessoryViewRelateResponderViewModel *obj = objc_getAssociatedObject(self, @selector(keyBroadInputAccessoryViewRelateResponderView));
    
    return obj.responderView;
    
}

-(void)setKeyBroadInputAccessoryViewRelateResponderView:(UIView*)view{
    
    LJKeyBroadInputAccessoryViewRelateResponderViewModel *obj = objc_getAssociatedObject(self, @selector(keyBroadInputAccessoryViewRelateResponderView));
    
    if ([obj isKindOfClass:[LJKeyBroadInputAccessoryViewRelateResponderViewModel class]]) {
        obj.responderView = view;
    } else {
        LJKeyBroadInputAccessoryViewRelateResponderViewModel *mess = [[LJKeyBroadInputAccessoryViewRelateResponderViewModel alloc]init];
        objc_setAssociatedObject(self, @selector(keyBroadInputAccessoryViewRelateResponderView), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        mess.responderView = view;
    }
}


@end
