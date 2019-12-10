//
//  LJKeyBroadNotificationManager.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import "LJKeyBroadNotificationManager.h"
#import "UIResponder+becomeFirstResponderCallBack.h"
#import "NSNotificationCenter+LJKeyBroad.h"
#import "KeyBroadRandString.h"
@interface LJKeyBroadNotificationManager ()

@property(nonatomic, strong) NSMutableDictionary *keyBroadNotificationBlockDictionary;

@property(nonatomic, strong) NSString *randStringID;

@end

@implementation LJKeyBroadNotificationManager

- (instancetype)init
{
    self = [super init];

    if (self) {
        [self addlister];
    }

    return self;
}

- (void)addlister {
    __weak LJKeyBroadNotificationManager *weakself = self;

    [NSNotificationCenter registerNotificationAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if ([weakself isKindOfClass:LJKeyBroadNotificationManager.class]) {
            [weakself keyboardWillShow:aUserInfo];
        }
    } AndName:UIKeyboardWillShowNotification anyKey:self.randStringID];

    [NSNotificationCenter registerNotificationAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if ([weakself isKindOfClass:LJKeyBroadNotificationManager.class]) {
            [weakself keyboardDidShow:aUserInfo];
        }
    } AndName:UIKeyboardDidShowNotification anyKey:self.randStringID];

    
    
    [NSNotificationCenter registerNotificationBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if ([weakself isKindOfClass:LJKeyBroadNotificationManager.class]) {
            [weakself keyboardWillHide:aUserInfo];
        }
    } AndName:UIKeyboardWillHideNotification anyKey:self.randStringID];

    [NSNotificationCenter registerNotificationBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if ([weakself isKindOfClass:LJKeyBroadNotificationManager.class]) {
            [weakself keyboardDidHide:aUserInfo];
        }
    } AndName:UIKeyboardDidHideNotification anyKey:self.randStringID];
    
    
    
    
    [NSNotificationCenter registerNotificationBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if ([weakself isKindOfClass:LJKeyBroadNotificationManager.class]) {
            [weakself keyboardWillChange:aUserInfo];
        }
    } AndName:UIKeyboardWillChangeFrameNotification anyKey:self.randStringID];
    [NSNotificationCenter registerNotificationBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if ([weakself isKindOfClass:LJKeyBroadNotificationManager.class]) {
            [weakself keyboardDidChange:aUserInfo];
        }
    } AndName:UIKeyboardDidChangeFrameNotification anyKey:self.randStringID];
}

- (void)keyboardWillShow:(NSDictionary *)aUserInfo {
    if ([aUserInfo isKindOfClass:NSDictionary.class]) {
        UIView *view = (UIView *)[UIResponder lj_currentFirstResponder];

        if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
            for (NSString *Key in self.keyBroadNotificationBlockDictionary.allKeys) {
                if ([Key isEqualToString:UIKeyboardWillShowNotification]) {
                    NSArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:Key];

                    for (NSString *NotKey in aUserInfo.allKeys) {
                        if ([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]) {
                            NSValue *aValue = [aUserInfo objectForKey:NotKey];
                            CGRect  keyboardRect = [aValue CGRectValue];
                            CGFloat height = keyboardRect.size.height;

                            for (KeyBroadNotificationBlock block in array) {
                                if (block) {
                                    block(view, height);
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

- (void)keyboardDidShow:(NSDictionary *)aUserInfo {
    if ([aUserInfo isKindOfClass:NSDictionary.class]) {
        UIView *view = (UIView *)[UIResponder lj_currentFirstResponder];

        if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
            for (NSString *Key in self.keyBroadNotificationBlockDictionary.allKeys) {
                if ([Key isEqualToString:UIKeyboardDidShowNotification]) {
                    NSArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:Key];

                    for (NSString *NotKey in aUserInfo.allKeys) {
                        if ([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]) {
                            NSValue *aValue = [aUserInfo objectForKey:NotKey];
                            CGRect  keyboardRect = [aValue CGRectValue];
                            CGFloat height = keyboardRect.size.height;

                            for (KeyBroadNotificationBlock block in array) {
                                if (block) {
                                    block(view, height);
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

- (void)keyboardWillChange:(NSDictionary *)aUserInfo {
    if ([aUserInfo isKindOfClass:NSDictionary.class]) {
        UIView *view = (UIView *)[UIResponder lj_currentFirstResponder];

        if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
            for (NSString *Key in self.keyBroadNotificationBlockDictionary.allKeys) {
                if ([Key isEqualToString:UIKeyboardWillChangeFrameNotification]) {
                    NSArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:Key];

                    for (NSString *NotKey in aUserInfo.allKeys) {
                        if ([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]) {
                            NSValue *aValue = [aUserInfo objectForKey:NotKey];
                            CGRect  keyboardRect = [aValue CGRectValue];
                            CGFloat height = keyboardRect.size.height;

                            for (KeyBroadNotificationBlock block in array) {
                                if (block) {
                                    block(view, height);
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

- (void)keyboardDidChange:(NSDictionary *)aUserInfo {
    if ([aUserInfo isKindOfClass:NSDictionary.class]) {
        UIView *view = (UIView *)[UIResponder lj_currentFirstResponder];

        if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
            for (NSString *Key in self.keyBroadNotificationBlockDictionary.allKeys) {
                if ([Key isEqualToString:UIKeyboardDidChangeFrameNotification]) {
                    NSArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:Key];

                    for (NSString *NotKey in aUserInfo.allKeys) {
                        if ([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]) {
                            NSValue *aValue = [aUserInfo objectForKey:NotKey];
                            CGRect  keyboardRect = [aValue CGRectValue];
                            CGFloat height = keyboardRect.size.height;

                            for (KeyBroadNotificationBlock block in array) {
                                if (block) {
                                    block(view, height);
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

- (void)keyboardDidHide:(NSDictionary *)aUserInfo {
    UIView *view = (UIView *)[UIResponder lj_currentFirstResponder];

    if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
        for (NSString *Key in self.keyBroadNotificationBlockDictionary.allKeys) {
            if ([Key isEqualToString:UIKeyboardDidHideNotification]) {
                NSArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:Key];

                for (KeyBroadNotificationBlock block in array) {
                    if (block) {
                        block(view, 0.0);
                    }
                }
            }
        }
    }
}

- (void)keyboardWillHide:(NSDictionary *)aUserInfo {
    UIView *view = (UIView *)[UIResponder lj_currentFirstResponder];

    if ([view isKindOfClass:UITextField.class] || [view isKindOfClass:UITextView.class]) {
        for (NSString *Key in self.keyBroadNotificationBlockDictionary.allKeys) {
            if ([Key isEqualToString:UIKeyboardWillHideNotification]) {
                NSArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:Key];

                for (KeyBroadNotificationBlock block in array) {
                    if (block) {
                        block(view, 0.0);
                    }
                }
            }
        }
    }
}

- (void)addKeyBroadNotificationWillShowBlock:(KeyBroadNotificationBlock)block {
    if (block) {
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardWillShowNotification];
    }
}

- (void)addKeyBroadNotificationDidShowBlock:(KeyBroadNotificationBlock)block {
    if (block) {
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardDidShowNotification];
    }
}

- (void)addKeyBroadNotificationFrameChangeBlock:(KeyBroadNotificationBlock)block {
    if (block) {
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardWillChangeFrameNotification];
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardDidChangeFrameNotification];
    }
}

- (void)addKeyBroadNotificationWillHideBlock:(KeyBroadNotificationBlock)block {
    if (block) {
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardWillHideNotification];
    }
}

- (void)addKeyBroadNotificationDidHideBlock:(KeyBroadNotificationBlock)block {
    if (block) {
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardDidHideNotification];
    }
}

- (void)addKeyBroadNotificationBlock:(id)block AndNotName:(NSString *)Name {
    if (block) {
        for (NSString *key in self.keyBroadNotificationBlockDictionary.allKeys) {
            if ([key isEqualToString:Name]) {
                NSMutableArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:key];
                [array addObject:block];
                return;
            }
        }

        NSMutableArray *array = [NSMutableArray array];
        [array addObject:block];
        [self.keyBroadNotificationBlockDictionary setObject:array forKey:Name];
    }
}

- (NSMutableDictionary *)keyBroadNotificationBlockDictionary {
    if (_keyBroadNotificationBlockDictionary == nil) {
        _keyBroadNotificationBlockDictionary = [NSMutableDictionary dictionary];
    }

    return _keyBroadNotificationBlockDictionary;
}

- (NSString *)randStringID {
    if (_randStringID == nil) {
        _randStringID = [KeyBroadRandString randomStringNameWithLength:32];
    }

    return _randStringID;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [NSNotificationCenter removeNotificationAftereName:UIKeyboardDidShowNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationAftereName:UIKeyboardWillShowNotification anyKey:self.randStringID];
    
    [NSNotificationCenter removeNotificationBeforeName:UIKeyboardDidHideNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationBeforeName:UIKeyboardWillHideNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationBeforeName:UIKeyboardWillChangeFrameNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationBeforeName:UIKeyboardDidChangeFrameNotification anyKey:self.randStringID];
}

@end
