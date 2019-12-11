//
//  LJViewMethodExchangeUtil.m
//  FBSnapshotTestCase
//
//  Created by temp on 2019/12/6.
//

#import "LJViewMethodExchangeUtil.h"
#import <objc/runtime.h>
#import "LJViewModel.h"
#import "UIView+LJView.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

static NSMutableArray *methodMoveChangeBlock_MethodExchangeArray = nil;

static NSMutableArray *methodMoveChangeBlock_MethodExchangeArray2 = nil;

static BOOL run1 = YES;
static BOOL run2 = YES;

@interface UIView ()

- (void)LJView_customer_addSubview:(UIView *)view;

- (void)dealloc_content;

@end

@implementation LJViewMethodExchangeUtil

+ (void)methodViewDelloc_MethodExchang {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        SEL sel = sel_registerName("dealloc_content");

        SEL NewSel = sel_registerName("dealloc");

        Method originalMethod = class_getInstanceMethod(UIView.class, sel);
        Method swizzlingMethod = class_getInstanceMethod(UIView.class, NewSel);

        method_exchangeImplementations(originalMethod, swizzlingMethod);
    });
}

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
}

+ (void)methodMoveChangeBlock_MethodExchange:(Class)calss {
    [self methodMoveChangeBlock_MethodExchange_willMoveToWindow:calss];

    [self methodMoveChangeBlock_MethodExchange_didMoveToWindow:calss];
}

+ (void)methodMoveChangeBlock_MethodExchange_willMoveToWindow:(Class)calss {
    NSString *Name = NSStringFromClass(calss);

    if (Name.length > 0) {
        if (methodMoveChangeBlock_MethodExchangeArray2 == nil) {
            methodMoveChangeBlock_MethodExchangeArray2 = [NSMutableArray array];
        }

        for (NSString *key in methodMoveChangeBlock_MethodExchangeArray2) {
            if ([key isEqualToString:Name]) {
                return;
            }
        }

        NSMutableArray *array = [NSMutableArray array];

        Class ExClass = [self CanExChange:calss andSel:@selector(willMoveToWindow:) array:array];

        NSString *ExName = NSStringFromClass(ExClass);

        if (ExName.length > 0) {
            for (NSString *key in methodMoveChangeBlock_MethodExchangeArray2) {
                if ([key isEqualToString:ExName]) {
                    return;
                }
            }

            [methodMoveChangeBlock_MethodExchangeArray2 addObjectsFromArray:array];

            [self methodMoveChangeBlock_MethodExchange1:ExClass];
        }
    }
}

+ (void)methodMoveChangeBlock_MethodExchange_didMoveToWindow:(Class)calss {
    NSString *Name = NSStringFromClass(calss);

    if (Name.length > 0) {
        if (methodMoveChangeBlock_MethodExchangeArray == nil) {
            methodMoveChangeBlock_MethodExchangeArray = [NSMutableArray array];
        }

        for (NSString *key in methodMoveChangeBlock_MethodExchangeArray) {
            if ([key isEqualToString:Name]) {
                return;
            }
        }

        NSMutableArray *array = [NSMutableArray array];

        Class ExClass = [self CanExChange:calss andSel:@selector(didMoveToWindow) array:array];

        NSString *ExName = NSStringFromClass(ExClass);

        if (ExName.length > 0) {
            for (NSString *key in methodMoveChangeBlock_MethodExchangeArray) {
                if ([key isEqualToString:ExName]) {
                    return;
                }
            }

            [methodMoveChangeBlock_MethodExchangeArray addObjectsFromArray:array];

            [self methodMoveChangeBlock_MethodExchange2:ExClass];
        }
    }
}

+ (Class)CanExChange:(Class)calss andSel:(SEL)sel array:(NSMutableArray *)array {
    NSString *Name = NSStringFromClass(calss);

    if (Name.length > 0) {
        [array addObject:Name];
    }

    if ([self haveMethod:calss andSel:sel]) {
        return calss;
    } else {
        Class superClass = class_getSuperclass(calss);

        if (superClass && (NSStringFromClass(superClass).length > 0)) {
            return [self CanExChange:superClass andSel:sel array:array];
        } else {
            return nil;
        }
    }
}

+ (BOOL)haveMethod:(Class)calss andSel:(SEL)sel {
    unsigned int    count;
    Method          *methods = class_copyMethodList(calss, &count);

    for (int i = 0; i < count; i++) {
        Method      method = methods[i];
        SEL         selector = method_getName(method);
        NSString    *name = NSStringFromSelector(selector);

        if ([name isEqualToString:NSStringFromSelector(sel)]) {
            return YES;
        }
    }

    free(methods);
    return NO;
}

+ (void)methodMoveChangeBlock_MethodExchange2:(Class)calss {
    NSString *Name = NSStringFromClass(calss);

    if (Name.length > 0) {
        SEL NewSel = sel_registerName([[NSString stringWithFormat:@"custmoer_%@_methodMoveChangeBlock_didMoveToWindow", Name] UTF8String]);

        id Block = ^void (UIView *self) {
            if (run1) {
                run1 = NO;

                [self performSelector:NewSel];

                LJViewModel *model = [self viewFrameChangeMoveWindowChangeModelMayBenil];

                if ([model isKindOfClass:LJViewModel.class]) {
                    switch (model.style) {
                        case LJViewModelAdd:

                            if (model.didAddBlock) {
                                model.didAddBlock(self);
                            }

                            for (viewWindowChangeBlock block in model._didAddArray) {
                                if (block) {
                                    block(self);
                                }
                            }

                            break;

                        case LJViewModelMove:

                            if (model.didMoveBlock) {
                                model.didMoveBlock(self);
                            }

                            for (viewWindowChangeBlock block in model._didMoveArray) {
                                if (block) {
                                    block(self);
                                }
                            }

                            break;

                        default:
                            break;
                    }
                }

                run1 = YES;
            } else {
                [self performSelector:NewSel];
            }
        };

        if (Block) {
            IMP imp = imp_implementationWithBlock(Block);

            Method selM = class_getInstanceMethod(UIView.class, @selector(didMoveToWindow));

            if (class_addMethod(calss, NewSel, imp, method_getTypeEncoding(selM))) {
                SEL sel = sel_registerName("didMoveToWindow");

                if ([calss instanceMethodForSelector:NewSel]) {
                    Method  originalMethod = class_getInstanceMethod(calss.class, sel);
                    Method  swizzlingMethod = class_getInstanceMethod(calss.class, NewSel);

                    method_exchangeImplementations(originalMethod, swizzlingMethod);
                }
            }
        }
    }
}

+ (void)methodMoveChangeBlock_MethodExchange1:(Class)calss {
    NSString *Name = NSStringFromClass(calss);

    if (Name.length > 0) {
        SEL NewSel = sel_registerName([[NSString stringWithFormat:@"custmoer_%@_methodMoveChangeBlock_willMoveToWindow:", Name] UTF8String]);

        id Block = ^void (UIView *self, UIWindow *newWindow) {
            if (run2) {
                run2 = NO;

                LJViewModel *model = [self viewFrameChangeMoveWindowChangeModelMayBenil];

                if ([model isKindOfClass:LJViewModel.class]) {
                    if ([newWindow isKindOfClass:UIWindow.class]) {
                        model.style = LJViewModelAdd;

                        if (model.willAddBlock) {
                            model.willAddBlock(self);
                        }

                        for (viewWindowChangeBlock block in model._willAddArray) {
                            if (block) {
                                block(self);
                            }
                        }
                    } else {
                        model.style = LJViewModelMove;

                        if (model.willMoveBlock) {
                            model.willMoveBlock(self);
                        }

                        for (viewWindowChangeBlock block in model._willMoveArray) {
                            if (block) {
                                block(self);
                            }
                        }
                    }
                }

                [self performSelector:NewSel withObject:newWindow];

                run2 = YES;
            } else {
                [self performSelector:NewSel withObject:newWindow];
            }
        };

        if (Block) {
            IMP imp = imp_implementationWithBlock(Block);

            Method selM = class_getInstanceMethod(UIView.class, @selector(willMoveToWindow:));

            if (class_addMethod(calss, NewSel, imp, method_getTypeEncoding(selM))) {
                SEL sel = sel_registerName("willMoveToWindow:");

                if ([calss instanceMethodForSelector:NewSel]) {
                    Method  originalMethod = class_getInstanceMethod(calss.class, sel);
                    Method  swizzlingMethod = class_getInstanceMethod(calss.class, NewSel);

                    method_exchangeImplementations(originalMethod, swizzlingMethod);
                }
            }
        }
    }
}

@end
#pragma clang diagnostic pop
