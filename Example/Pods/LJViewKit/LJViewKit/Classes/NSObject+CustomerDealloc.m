//
//  NSObject+CustomerDealloc.m
//  FBSnapshotTestCase
//
//  Created by temp on 2020/5/25.
//

#import "NSObject+CustomerDealloc.h"
#import <objc/runtime.h>

@implementation NSObject (CustomerDealloc)

+ (void)registerCustomerDeallocArrayObject:(NSObject *)object block:(customerDeallocBlock)block Key:(NSString *)key {
    if ([object isKindOfClass:NSObject.class] && block && (key.length > 0)) {
        [self methodCustomerDealloc_MethodExchang];
        NSMutableDictionary *dictionary = [object LJCustomerDeallocClass_blockOption];

        for (NSString *tempKey in dictionary) {
            if ([key isEqualToString:tempKey]) {
                NSMutableArray *array = [dictionary objectForKey:tempKey];
                [array addObject:block];
                return;
            }
        }

        NSMutableArray *array = [NSMutableArray array];
        [array addObject:block];
        [dictionary setObject:array forKey:key];
    }
}

+ (void)registerCustomerDeallocOnceObject:(NSObject *)object block:(customerDeallocBlock)block Key:(NSString *)key {
    if ([object isKindOfClass:NSObject.class] && block && (key.length > 0)) {
        [self methodCustomerDealloc_MethodExchang];
        NSMutableDictionary *dictionary = [object LJCustomerDeallocClass_blockOnce];

        for (NSString *tempKey in dictionary) {
            if ([key isEqualToString:tempKey]) {
                NSMutableArray *array = [dictionary objectForKey:tempKey];
                [array removeAllObjects];
                [array addObject:block];
                return;
            }
        }

        NSMutableArray *array = [NSMutableArray array];
        [array addObject:block];
        [dictionary setObject:array forKey:key];
    }
}

+ (void)methodCustomerDealloc_MethodExchang {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        if (objc_getClass("LJCustomerDeallocClass")) {} else {
            objc_allocateClassPair([NSObject class], "LJCustomerDeallocClass", 0);
            SEL sel = sel_registerName("dealloc_customerDealloc_LJView");
            SEL NewSel = sel_registerName("dealloc");

            Method originalMethod = class_getInstanceMethod(NSObject.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(NSObject.class, NewSel);
            method_exchangeImplementations(originalMethod, swizzlingMethod);
        }
    });
}

- (NSMutableDictionary *)LJCustomerDeallocClass_blockDictionary_OptionOnce {
    return objc_getAssociatedObject(self, @selector(LJCustomerDeallocClass_blockDictionary_OptionOnce));
}

- (NSMutableDictionary *)LJCustomerDeallocClass_blockOnce;
{
    NSMutableDictionary *obj = [self LJCustomerDeallocClass_blockDictionary_OptionOnce];

    if ([obj isKindOfClass:[NSMutableDictionary class]]) {
        return obj;
    } else {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(LJCustomerDeallocClass_blockDictionary_OptionOnce), dictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return dictionary;
    }
}

- (NSMutableDictionary *)LJCustomerDeallocClass_blockDictionary_OptionDictionary {
    return objc_getAssociatedObject(self, @selector(LJCustomerDeallocClass_blockDictionary_OptionDictionary));
}

- (NSMutableDictionary *)LJCustomerDeallocClass_blockOption;
{
    NSMutableDictionary *obj = [self LJCustomerDeallocClass_blockDictionary_OptionDictionary];

    if ([obj isKindOfClass:[NSMutableDictionary class]]) {
        return obj;
    } else {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(LJCustomerDeallocClass_blockDictionary_OptionDictionary), dictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return dictionary;
    }
}

- (void)dealloc_customerDealloc_LJView {
    {
        NSMutableDictionary *dictionary = [self LJCustomerDeallocClass_blockDictionary_OptionDictionary];

        if (dictionary) {
            for (NSString *key in dictionary.allKeys) {
                NSArray *array = [dictionary objectForKey:key];

                for (customerDeallocBlock blcok in array) {
                    if (blcok) {
                        blcok(self);
                    }
                }
            }

            [dictionary removeAllObjects];
        }
    }

    {
        NSMutableDictionary *dictionary = [self LJCustomerDeallocClass_blockDictionary_OptionOnce];

        if (dictionary) {
            for (NSString *key in dictionary.allKeys) {
                NSArray *array = [dictionary objectForKey:key];

                for (customerDeallocBlock blcok in array) {
                    if (blcok) {
                        blcok(self);
                    }
                }
            }

            [dictionary removeAllObjects];
        }
    }

    [self dealloc_customerDealloc_LJView];
}

@end
