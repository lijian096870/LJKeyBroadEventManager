//
//  LJKeyBroadPostRunBlockModel.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/9.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadPostRunBlockModel.h"
#import "UIViewController+KeyBroadPost.h"

@interface LJKeyBroadPostRunBlockModel ()

@property(nonatomic, strong) NSMutableDictionary *postBlockDictionary;

@end

@implementation LJKeyBroadPostRunBlockModel

- (void)addKeyBroadNotificationWillShowBlock:(KeyBroadNotificationBlock)block {
    if (block) {
        [UIViewController change_post_keyBroadMoveEvent];
        [self addKeyBroadNotificationBlock:block AndaName:UIKeyboardWillShowNotification];
    }
}

- (void)addKeyBroadNotificationDidShowBlock:(KeyBroadNotificationBlock)block {
    if (block) {
        [UIViewController change_post_keyBroadMoveEvent];
        [self addKeyBroadNotificationBlock:block AndaName:UIKeyboardDidShowNotification];
    }
}

- (void)addKeyBroadNotificationWillHidenBlock:(KeyBroadNotificationBlock)block {
    if (block) {
        [UIViewController change_post_keyBroadMoveEvent];
        [self addKeyBroadNotificationBlock:block AndaName:UIKeyboardWillHideNotification];
    }
}

- (void)addKeyBroadNotificationDidHidenBlock:(KeyBroadNotificationBlock)block {
    if (block) {
        [UIViewController change_post_keyBroadMoveEvent];
        [self addKeyBroadNotificationBlock:block AndaName:UIKeyboardDidHideNotification];
    }
}

- (void)addKeyBroadNotificationFrameChangeBlock:(KeyBroadNotificationBlock)block {
    if (block) {
        [UIViewController change_post_keyBroadMoveEvent];
        [self addKeyBroadNotificationBlock:block AndaName:UIKeyboardWillChangeFrameNotification];
    }
}

- (void)addKeyBroadNotificationBlock:(KeyBroadNotificationBlock)block AndaName:(NSString *)Name {
    if (block && (Name.length > 0)) {
        for (NSString *key in self.postBlockDictionary.allKeys) {
            if ([key isEqualToString:Name]) {
                NSMutableArray *array = [self.postBlockDictionary objectForKey:key];
                [array addObject:block];
                return;
            }
        }

        NSMutableArray *array = [NSMutableArray array];
        [array addObject:block];
        [self.postBlockDictionary setObject:array forKey:Name];
    }
}

- (void)receivePostBefore:(NSString *)aName aUserInfo:(NSDictionary *)dictionary AndResponderView:(UIView *)responder {
    if ([responder isKindOfClass:UIView.class]) {
        if ([aName isEqualToString:UIKeyboardWillHideNotification] || [aName isEqualToString:UIKeyboardDidHideNotification] || [aName isEqualToString:UIKeyboardWillChangeFrameNotification]) {
            for (NSString *key in self.postBlockDictionary.allKeys) {
                if ([key isEqualToString:aName]) {
                    NSArray *array = [self.postBlockDictionary objectForKey:key];

                    if (array.count > 0) {
                        for (NSString *NotKey in dictionary.allKeys) {
                            if ([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]) {
                                NSValue *aValue = [dictionary objectForKey:NotKey];
                                CGRect  keyboardRect = [aValue CGRectValue];
                                CGFloat height = keyboardRect.size.height;

                                for (KeyBroadNotificationBlock block in array) {
                                    if (block) {
                                        block(responder, height);
                                    }
                                }

                                break;
                            }
                        }
                    }
                }
            }
        }
    }
}

- (void)receivePostAfter:(NSString *)aName aUserInfo:(NSDictionary *)dictionary AndResponderView:(UIView *)responder {
    
    
    if ([responder isKindOfClass:UIView.class]) {
        if ([aName isEqualToString:UIKeyboardWillShowNotification] || [aName isEqualToString:UIKeyboardDidShowNotification]) {
        
            for (NSString *key in self.postBlockDictionary.allKeys) {
                if ([key isEqualToString:aName]) {
                    NSArray *array = [self.postBlockDictionary objectForKey:key];

                    if (array.count > 0) {
                        for (NSString *NotKey in dictionary.allKeys) {
                            if ([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]) {
                                NSValue *aValue = [dictionary objectForKey:NotKey];
                                CGRect  keyboardRect = [aValue CGRectValue];
                                CGFloat height = keyboardRect.size.height;

                                for (KeyBroadNotificationBlock block in array) {
                                    if (block) {
                                        block(responder, height);
                                    }
                                }
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
}

- (NSMutableDictionary *)postBlockDictionary {
    if (_postBlockDictionary == nil) {
        _postBlockDictionary = [NSMutableDictionary dictionary];
    }

    return _postBlockDictionary;
}

static id _instace;
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [super allocWithZone:zone];
    });
    return _instace;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

+ (instancetype)new
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instace;
}

@end
