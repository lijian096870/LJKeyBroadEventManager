//
//  LJKeyBroadEvent.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadEvent.h"
#import "LJKeyBroadEventManager.h"

#import "UIResponder+becomeFirstResponderCallBack.h"

@interface LJKeyBroadEvent ()

@property(nonatomic,strong)NSMutableSet *set;

@property(nonatomic,copy)canBecomeFirstResponderCallBackBlock canBecomeFirstResponder;

@end

@implementation LJKeyBroadEvent


-(void)configCanBecomeFirstResponderCallBackBlock:(canBecomeFirstResponderCallBackBlock)block{
    
    self.canBecomeFirstResponder = block;
    
}

-(void)registerKeyBroadEvent:(KeyBroadEventCallBlock)block{
    
    [self blingEvent];
    
    if(block){
        [self.set addObject:block];
    }
    
    
    
}

-(void)runBlock:(UIView *)view and:(KeyBroadEventStyle)style{
    

    for (KeyBroadEventCallBlock block in self.set) {
        block(view,style);
    }
    

}


-(void)blingEvent{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        [UIView configCanBecomeFirstResponderCallBackBlock:^BOOL(UIView * _Nonnull view) {
            if([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]){
                
                if(self.canBecomeFirstResponder){
                    return self.canBecomeFirstResponder(view);
                }else{
                    return true;
                }
                
            }else{
                return true;
            }
        }];
        
        
        [UIView configbecomeFirstResponderCallBackBlock:^(UIView * _Nonnull view) {
            
            if([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]){
                
                [self runBlock:view and:KeyBroadEventSelect];
                
            }
            
        }];
        [UIView configresignFirstResponderCallBackBlock:^(UIView * _Nonnull view) {
            if([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]){
                
                [self runBlock:view and:KeyBroadEventCancel];
                
            }
        }];
        
    
        
    });
    
    
    
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
