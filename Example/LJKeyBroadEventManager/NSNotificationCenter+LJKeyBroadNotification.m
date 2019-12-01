//
//  NSNotificationCenter+LJKeyBroadNotification.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import "NSNotificationCenter+LJKeyBroadNotification.h"
#import <objc/runtime.h>

static NSMutableDictionary *LJKeyBroadNotificationBlockDictionary = nil;

@implementation NSNotificationCenter (LJKeyBroadNotification)

+(void)addKeyBroadNotificationShowBlock:(KeyBroadNotificationBlock)block{
    
    if(block){
        
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardWillShowNotification];
    }
    
}

+(void)addKeyBroadNotificationFrameChangeBlock:(KeyBroadNotificationBlock)block{
    
    if(block){
        
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardWillChangeFrameNotification];
        
    }
    
}

+(void)addKeyBroadNotificationHideBlock:(dispatch_block_t)block{
    
    if(block){
        
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardWillHideNotification];
        
    }
}

+(void)addKeyBroadNotificationBlock:(id)block AndNotName:(NSString*)Name{
    
    if(block){
        [self exchange_LJKeyBroadNotification];
        
        if(LJKeyBroadNotificationBlockDictionary == nil){
            LJKeyBroadNotificationBlockDictionary = [NSMutableDictionary dictionary];
        }
        
        for (NSString *key in LJKeyBroadNotificationBlockDictionary.allKeys) {
            if([key isEqualToString:Name]){
                NSMutableArray *array = [LJKeyBroadNotificationBlockDictionary objectForKey:key];
                [array addObject:block];
                return;
            }
        }
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:block];
        [LJKeyBroadNotificationBlockDictionary setObject:array forKey:Name];
    }
    
    
}
+(void)exchange_LJKeyBroadNotification{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL sel=sel_registerName("postNotificationName:object:userInfo:");
        
        SEL NewSel=sel_registerName("LJKeyBroadNotification_postNotificationName:object:userInfo:");
        
        Method originalMethod = class_getInstanceMethod(NSNotificationCenter.class, sel);
        Method swizzlingMethod = class_getInstanceMethod(NSNotificationCenter.class, NewSel);
        
        method_exchangeImplementations(originalMethod, swizzlingMethod);
        
    });
    
}
-(void)LJKeyBroadNotification_postNotificationName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo{
    
    
    if([aName isEqualToString:UIKeyboardWillShowNotification]){
        
        
        for (NSString *Key in LJKeyBroadNotificationBlockDictionary.allKeys) {
            if([Key isEqualToString:aName]){
                
                NSArray *array = [LJKeyBroadNotificationBlockDictionary objectForKey:Key];
                
                for (NSString *NotKey in aUserInfo.allKeys) {
                    if([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]){
                        
                        NSValue *aValue = [aUserInfo objectForKey:NotKey];
                        CGRect keyboardRect = [aValue CGRectValue];
                        CGFloat height = keyboardRect.size.height;
                        
                        for (KeyBroadNotificationBlock block in array) {
                            if(block){
                                block(height);
                            }
                        }
                        break;
                    }
                    
                }
                
            }
        }
        
        
        
        
        
    }
    if([aName isEqualToString:UIKeyboardWillChangeFrameNotification]){
        
        
        for (NSString *Key in LJKeyBroadNotificationBlockDictionary.allKeys) {
            if([Key isEqualToString:aName]){
                
                NSArray *array = [LJKeyBroadNotificationBlockDictionary objectForKey:Key];
                
                for (NSString *NotKey in aUserInfo.allKeys) {
                    if([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]){
                        
                        NSValue *aValue = [aUserInfo objectForKey:NotKey];
                        CGRect keyboardRect = [aValue CGRectValue];
                        CGFloat height = keyboardRect.size.height;
                        
                        for (KeyBroadNotificationBlock block in array) {
                            if(block){
                                block(height);
                            }
                        }
                        break;
                    }
                }
                
            }
        }  
    }
    if([aName isEqualToString:UIKeyboardWillHideNotification]){
        
        for (NSString *Key in LJKeyBroadNotificationBlockDictionary.allKeys) {
            if([Key isEqualToString:aName]){
                
                NSArray *array = [LJKeyBroadNotificationBlockDictionary objectForKey:Key];
                
                for (dispatch_block_t block in array) {
                    if(block){
                        block();
                    }
                }
                
            }
        }
    }
    [self LJKeyBroadNotification_postNotificationName:aName object:anObject userInfo:aUserInfo];
}

@end
