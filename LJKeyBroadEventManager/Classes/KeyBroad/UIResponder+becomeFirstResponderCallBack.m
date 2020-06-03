//
//  UIResponder+becomeFirstResponderCallBack.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/8/20.
//

#import "UIResponder+becomeFirstResponderCallBack.h"
#import <objc/runtime.h>
#import "FirstResponderModel.h"
#import "UIResponder+AccessoryView.h"

static NSMutableArray   *becomeFirstResponderCallBackBlockArray;
static NSMutableArray   *becomeFirstResponderResultCallBackBlockArray;
static NSMutableArray   *resignFirstResponderCallBackBlockArray;

@interface UIResponder ()

- (void)Customer_becomeFirstResponder_Before;
- (void)Customer_becomeFirstResponder_after;
- (void)Customer_resignFirstResponder_before;
- (void)Customer_resignFirstResponder_after;
@end

typedef BOOL (^ customer_responder_block)(UIResponder *responder);

BOOL customer_becomeFirstResponder_method(customer_responder_block block, UIResponder *responder)
{
    if ([responder respondsToSelector:@selector(Customer_becomeFirstResponder_Before)]) {
        [responder Customer_becomeFirstResponder_Before];
    }

    BOOL result = block(responder);

    if ([responder respondsToSelector:@selector(Customer_becomeFirstResponder_after)]) {
        [responder Customer_becomeFirstResponder_after];
    }

    return result;
}

BOOL customer_resignFirstResponder_method(customer_responder_block block, UIResponder *responder)
{
    if ([responder respondsToSelector:@selector(Customer_resignFirstResponder_before)]) {
        [responder Customer_resignFirstResponder_before];
    }

    BOOL result = block(responder);

    if ([responder respondsToSelector:@selector(Customer_resignFirstResponder_after)]) {
        [responder Customer_resignFirstResponder_after];
    }

    return result;
}

static canBecomeFirstResponderCallBackBlock canBecomeFirstResponder = nil;

static __weak UIResponder *lj_currentFirstResponder;

@implementation UIResponder (becomeFirstResponderCallBack)

+ (UIResponder *)lj_currentFirstResponder {
    lj_currentFirstResponder = nil;

    [[UIApplication sharedApplication] sendAction:@selector(LJ_findFirstResponder:)
    to      :nil
    from    :nil
    forEvent:nil];

    return lj_currentFirstResponder;
}

- (void)LJ_findFirstResponder:(id)sender {
    lj_currentFirstResponder = self;
}

+ (void)configCanBecomeFirstResponderCallBackBlock:(canBecomeFirstResponderCallBackBlock)block {
    [UIResponder becomeFirstResponderCallBackMethodExchange];

    canBecomeFirstResponder = block;
}

+ (void)configbecomeFirstResponderResultCallBackBlock:(becomeFirstResponderResultCallBackBlock)block {
    [UIResponder becomeFirstResponderCallBackMethodExchange];

    if (becomeFirstResponderResultCallBackBlockArray == nil) {
        becomeFirstResponderResultCallBackBlockArray = [NSMutableArray array];
    }

    if (block) {
        [becomeFirstResponderResultCallBackBlockArray addObject:block];
    }
}

+ (void)configbecomeFirstResponderCallBackBlock:(becomeFirstResponderCallBackBlock)block {
    [UIResponder becomeFirstResponderCallBackMethodExchange];

    if (becomeFirstResponderCallBackBlockArray == nil) {
        becomeFirstResponderCallBackBlockArray = [NSMutableArray array];
    }

    if (block) {
        [becomeFirstResponderCallBackBlockArray addObject:block];
    }
}

+ (void)configresignFirstResponderCallBackBlock:(resignFirstResponderCallBackBlock)block {
    [UIResponder becomeFirstResponderCallBackMethodExchange];

    if (resignFirstResponderCallBackBlockArray == nil) {
        resignFirstResponderCallBackBlockArray = [NSMutableArray array];
    }

    if (block) {
        [resignFirstResponderCallBackBlockArray addObject:block];
    }
}

+ (void)becomeFirstResponderCallBackMethodExchange {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL sel = sel_registerName("becomeFirstResponder");

            SEL NewSel = sel_registerName("Customer_becomeFirstResponder");

            Method originalMethod = class_getInstanceMethod(UIResponder.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UIResponder.class, NewSel);

            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL sel = sel_registerName("resignFirstResponder");

            SEL NewSel = sel_registerName("Customer_resignFirstResponder");

            Method originalMethod = class_getInstanceMethod(UIResponder.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UIResponder.class, NewSel);

            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [UIResponder InputAccessoryViewChangeCallBackMethodExchange_reloadInputViews];
        });
    }
}

- (BOOL)Customer_becomeFirstResponder {
    if ([self isKindOfClass:[UITextView class]] || [self isKindOfClass:[UITextField class]]) {
        if (canBecomeFirstResponder) {
            if (canBecomeFirstResponder((UIView *)self)) {
                if (self.keyBroad_FirstResponder_info.isFirstResponder) {
                    BOOL result = customer_becomeFirstResponder_method (^BOOL (UIResponder *responder) {
                        return [responder Customer_becomeFirstResponder];
                    }, self);
                    return result;
                } else {
                    BOOL canBeFirst = YES;

                    for (becomeFirstResponderCallBackBlock block in [NSArray arrayWithArray:becomeFirstResponderCallBackBlockArray]) {
                        canBeFirst = block((UIView *)self) && canBeFirst;
                    }

                    if (canBeFirst) {
                        self.keyBroad_FirstResponder_info.isFirstResponder = true;

                        BOOL result = customer_becomeFirstResponder_method (^BOOL (UIResponder *responder) {
                            return [responder Customer_becomeFirstResponder];
                        }, self);

                        self.keyBroad_FirstResponder_info.isFirstResponder = result;

                        for (becomeFirstResponderResultCallBackBlock block in [NSArray arrayWithArray:becomeFirstResponderResultCallBackBlockArray]) {
                            if (block) {
                                block((UIView *)self, result);
                            }
                        }

                        return result;
                    } else {
                        return false;
                    }
                }
            } else {
                return false;
            }
        } else {
            if (self.keyBroad_FirstResponder_info.isFirstResponder) {
                BOOL result = customer_becomeFirstResponder_method (^BOOL (UIResponder *responder) {
                    return [responder Customer_becomeFirstResponder];
                }, self);
                return result;
            } else {
                BOOL canBeFirst = YES;

                for (becomeFirstResponderCallBackBlock block in [NSArray arrayWithArray:becomeFirstResponderCallBackBlockArray]) {
                    canBeFirst = block((UIView *)self) && canBeFirst;
                }

                if (canBeFirst) {
                    self.keyBroad_FirstResponder_info.isFirstResponder = true;

                    BOOL result = customer_becomeFirstResponder_method (^BOOL (UIResponder *responder) {
                        return [responder Customer_becomeFirstResponder];
                    }, self);

                    return result;
                } else {
                    return false;
                }
            }
        }
    } else {
        return customer_becomeFirstResponder_method (^BOOL (UIResponder *responder) {
            return [responder Customer_becomeFirstResponder];
        }, self);
    }
}

- (BOOL)Customer_resignFirstResponder {
    if ([self isKindOfClass:[UITextView class]] || [self isKindOfClass:UITextField.class]) {
        if (self.keyBroad_FirstResponder_info.isFirstResponder) {
            self.keyBroad_FirstResponder_info.isFirstResponder = false;

            for (resignFirstResponderCallBackBlock block in [NSArray arrayWithArray:resignFirstResponderCallBackBlockArray]) {
                block((UIView *)self);
            }
        }
    }

    return customer_resignFirstResponder_method (^BOOL (UIResponder *responder) {
        return [responder Customer_resignFirstResponder];
    }, self);
}

- (FirstResponderModel *)keyBroad_FirstResponder_info
{
    FirstResponderModel *obj = objc_getAssociatedObject(self, @selector(keyBroad_FirstResponder_info));

    if ([obj isKindOfClass:[FirstResponderModel class]]) {
        return obj;
    } else {
        FirstResponderModel *mess = [[FirstResponderModel alloc]init];
        objc_setAssociatedObject(self, @selector(keyBroad_FirstResponder_info), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return mess;
    }
}

@end

