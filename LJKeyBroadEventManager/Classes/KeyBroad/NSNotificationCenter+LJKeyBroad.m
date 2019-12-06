//
//  NSNotificationCenter+LJKeyBroad.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/3.
//

#import "NSNotificationCenter+LJKeyBroad.h"
#import <objc/runtime.h>

static NSMutableDictionary  *DictionaryBeforeBlock;
static NSMutableDictionary  *DictionaryAfterBlock;

@interface NSNotificationCenterAfterBeforeModel : NSObject

@property(nonatomic, copy) NotificationAfterBeforeBlock block;
@property(nonatomic, copy) NSString                     *deletkey;

@end

@implementation NSNotificationCenter (LJKeyBroad)

+ (void)registerNotificationBeforeBlock:(NotificationAfterBeforeBlock)block AndName:(NSString *)aName anyKey:(NSString *)deletkey {
    if (block && [aName isKindOfClass:NSString.class] && (aName.length > 0)) {
        [self exchange_notificationCenterPostMethod];

        if (DictionaryBeforeBlock == nil) {
            DictionaryBeforeBlock = [NSMutableDictionary dictionary];
        }

        for (NSString *key in DictionaryBeforeBlock.allKeys) {
            if ([key isEqualToString:aName]) {
                NSMutableArray                          *array = [DictionaryBeforeBlock objectForKey:key];
                NSNotificationCenterAfterBeforeModel    *model = [[NSNotificationCenterAfterBeforeModel alloc] init];
                model.block = block;
                model.deletkey = deletkey;
                [array addObject:model];
                return;
            }
        }

        NSMutableArray                          *array = [NSMutableArray array];
        NSNotificationCenterAfterBeforeModel    *model = [[NSNotificationCenterAfterBeforeModel alloc] init];
        model.block = block;
        model.deletkey = deletkey;
        [array addObject:model];
        [DictionaryBeforeBlock setObject:array forKey:aName];
    }
}

+ (void)registerNotificationAfterBlock:(NotificationAfterBeforeBlock)block AndName:(NSString *)aName anyKey:(NSString *)deletkey {
    if (block && [aName isKindOfClass:NSString.class] && (aName.length > 0)) {
        [self exchange_notificationCenterPostMethod];

        if (DictionaryAfterBlock == nil) {
            DictionaryAfterBlock = [NSMutableDictionary dictionary];
        }

        for (NSString *key in DictionaryAfterBlock.allKeys) {
            if ([key isEqualToString:aName]) {
                NSMutableArray                          *array = [DictionaryAfterBlock objectForKey:key];
                NSNotificationCenterAfterBeforeModel    *model = [[NSNotificationCenterAfterBeforeModel alloc] init];
                model.block = block;
                model.deletkey = deletkey;
                [array addObject:model];
                return;
            }
        }

        NSMutableArray                          *array = [NSMutableArray array];
        NSNotificationCenterAfterBeforeModel    *model = [[NSNotificationCenterAfterBeforeModel alloc] init];
        model.block = block;
        model.deletkey = deletkey;
        [array addObject:model];
        [DictionaryAfterBlock setObject:array forKey:aName];
    }
}

+ (void)removeNotificationBeforeName:(NSNotificationName)aName anyKey:(NSString *)deletkey {
    for (NSString *key in DictionaryBeforeBlock.allKeys) {
        if ([key isEqualToString:aName]) {
            NSMutableArray  *array = [DictionaryBeforeBlock objectForKey:key];
            NSArray         *temp = [NSArray arrayWithArray:array];

            for (NSNotificationCenterAfterBeforeModel *model in temp) {
                if ([model.deletkey isEqualToString:deletkey]) {
                    [array removeObject:model];
                }
            }
        }
    }
}

+ (void)removeNotificationAftereName:(NSNotificationName)aName anyKey:(NSString *)deletkey {
    for (NSString *key in DictionaryAfterBlock.allKeys) {
        if ([key isEqualToString:aName]) {
            NSMutableArray  *array = [DictionaryAfterBlock objectForKey:key];
            NSArray         *temp = [NSArray arrayWithArray:array];

            for (NSNotificationCenterAfterBeforeModel *model in temp) {
                if ([model.deletkey isEqualToString:deletkey]) {
                    [array removeObject:model];
                }
            }
        }
    }
}

+ (void)exchange_notificationCenterPostMethod {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        SEL sel = sel_registerName("postNotificationName:object:userInfo:");

        SEL NewSel = sel_registerName("customer_AfterAndBefore_postNotificationName:object:userInfo:");

        Method originalMethod = class_getInstanceMethod(NSNotificationCenter.class, sel);
        Method swizzlingMethod = class_getInstanceMethod(NSNotificationCenter.class, NewSel);

        method_exchangeImplementations(originalMethod, swizzlingMethod);
    });
}

- (void)customer_AfterAndBefore_postNotificationName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    for (NSString *key in DictionaryBeforeBlock.allKeys) {
        if ([key isEqualToString:aName]) {
            NSArray *array = [DictionaryBeforeBlock objectForKey:key];

            for (NSNotificationCenterAfterBeforeModel *model in array) {
                if (model.block) {
                    model.block(aName, anObject, aUserInfo);
                }
            }
        }
    }

    [self customer_AfterAndBefore_postNotificationName:aName object:anObject userInfo:aUserInfo];

    for (NSString *key in DictionaryAfterBlock.allKeys) {
        if ([key isEqualToString:aName]) {
            NSArray *array = [DictionaryAfterBlock objectForKey:key];

            for (NSNotificationCenterAfterBeforeModel *model in array) {
                if (model.block) {
                    model.block(aName, anObject, aUserInfo);
                }
            }
        }
    }
}

@end
@implementation NSNotificationCenterAfterBeforeModel

@end
