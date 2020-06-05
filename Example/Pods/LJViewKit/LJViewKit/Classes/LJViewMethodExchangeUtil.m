//
//  LJViewMethodExchangeUtil.m
//  FBSnapshotTestCase
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJViewMethodExchangeUtil.h"
#import <objc/runtime.h>
#import "LJViewModel.h"
#import "UIView+LJView.h"

@interface UIView ()

- (void)LJView_customer_addSubview:(UIView *)view;

- (void)LJView_customer_removeFromSuperview;

- (void)LJView_ViewFrameChange_layoutSubviews;

@end

@implementation LJViewMethodExchangeUtil

+ (void)methodAddsubViewBlock_MethodExchang {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        SEL sel = sel_registerName("addSubview:");

        SEL NewSel = sel_registerName("LJView_customer_addSubview:");

        Method originalMethod = class_getInstanceMethod(UIView.class, sel);
        Method swizzlingMethod = class_getInstanceMethod(UIView.class, NewSel);

        method_exchangeImplementations(originalMethod, swizzlingMethod);
    });
}

+ (void)methodFrameChangeBlock_MethodExchang {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        SEL sel = sel_registerName("setFrame:");

        SEL NewSel = sel_registerName("LJView_customer_setFrame:");

        Method originalMethod = class_getInstanceMethod(UIView.class, sel);
        Method swizzlingMethod = class_getInstanceMethod(UIView.class, NewSel);

        method_exchangeImplementations(originalMethod, swizzlingMethod);
    });
    
    [self methodlayoutSubviewsChangeBlock_MethodExchange];
    
}

+ (void)methodlayoutSubviewsChangeBlock_MethodExchange {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        SEL sel = sel_registerName("layoutSubviews");

        SEL NewSel = sel_registerName("LJView_ViewFrameChange_layoutSubviews");

        Method originalMethod = class_getInstanceMethod(UIView.class, sel);
        Method swizzlingMethod = class_getInstanceMethod(UIView.class, NewSel);

        method_exchangeImplementations(originalMethod, swizzlingMethod);
    });
}

+ (void)methodMoveChangeBlock_MethodExchange:(Class)calss {
    [self methodAddsubViewBlock_MethodExchang];

    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        SEL sel = sel_registerName("removeFromSuperview");

        SEL NewSel = sel_registerName("LJView_customer_removeFromSuperview");

        Method originalMethod = class_getInstanceMethod(UIView.class, sel);
        Method swizzlingMethod = class_getInstanceMethod(UIView.class, NewSel);

        method_exchangeImplementations(originalMethod, swizzlingMethod);
    });
}

@end
