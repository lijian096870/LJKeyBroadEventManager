//
//  LJKeyBroadRegisterManager.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadRegisterManager.h"
#import "UIViewController+KeyBoradManager.h"
#import "LJKeyBroadEvent.h"
#import "LJKeyBroadEventManager.h"
#import "LJkeyBroadConfig.h"
#import "UIResponder+becomeFirstResponderCallBack.h"
#import "LJViewControllerManager.h"
@interface LJKeyBroadRegisterManager ()

@property(nonatomic,strong)NSMutableSet *set;


@end

@interface UIViewController ()

-(BOOL)canBecomeFirstResponder:(UIView*)Responder;

@end

@implementation LJKeyBroadRegisterManager

-(void)removeKeyBroadResponder:(UIViewController<LJKeyboardManagerDelegate> *)keyBroadResponder{
    if([keyBroadResponder isKindOfClass:[UIViewController class]]){
        [self.set removeObject:keyBroadResponder.keyBroad_mess_uniqueID];
    }
    
}

-(void)registerKeyBroadResponder:(UIViewController<LJKeyboardManagerDelegate> *)keyBroadResponder{
    
    [UIView becomeFirstResponderCallBackMethodExchange];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [[LJKeyBroadEvent sharedInstance] configCanBecomeFirstResponderCallBackBlock:^BOOL(UIView *view) {
            UIViewController *viewController = viewGetSuperController(view);
            if([viewController isKindOfClass:[UIViewController class]]){
                
                if([viewController respondsToSelector:@selector(canBecomeFirstResponder:)]){
                    return [viewController canBecomeFirstResponder:view];
                }else{
                    return true;
                }
                
            }else{
                return true;
            }
        }];
        
        [[LJKeyBroadEvent sharedInstance] registerKeyBroadEvent:^(UIView *view, KeyBroadEventStyle style) {
            UIViewController *viewController = viewGetSuperController(view);
            if([viewController isKindOfClass:[UIViewController class]]){
                if([self isRegister:viewController.keyBroad_mess_uniqueID]){
                    
                    switch (style) {
                        case KeyBroadEventSelect:
                            [viewController.NSObject_KeyBoradManager_info EventAction:view];
                            break;
                        case KeyBroadEventCancel:
                            [viewController.NSObject_KeyBoradManager_info CancelEventAction:view];
                            break;
                    }
                    
                    
                }
                
                
            }
        }];
        
        
        
    });
    if([keyBroadResponder isKindOfClass:[UIViewController class]]){
        
        NSString *ID = keyBroadResponder.keyBroad_mess_uniqueID;
        [self.set addObject:ID];
        
        
        [keyBroadResponder.NSObject_KeyBoradManager_info configDestroyBlock:^{
            [self.set removeObject:ID];
        }];
        
    }
}




-(BOOL)isRegister:(NSString*)key{
    for (NSString *object in self.set) {
        if([key isEqualToString:object]){
            return YES;
        }
        
        
    }
    return false;
    
    
}

-(NSMutableSet*)set{
    
    if(_set==nil){
        _set = [NSMutableSet set];
    }
    return _set;
    
    
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
