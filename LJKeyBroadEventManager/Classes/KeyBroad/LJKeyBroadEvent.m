//
//  LJKeyBroadEvent.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadEvent.h"
#import "LJKeyBroadEventManager.h"
#import "LJKeyBroadNotificationManager.h"
#import "UIResponder+becomeFirstResponderCallBack.h"
#import "LJKeyBraodResponderCallBlockModel.h"

@interface LJKeyBroadEvent ()

@property(nonatomic,strong)NSMutableSet *set;

@property(nonatomic,copy)canBecomeFirstResponderCallBackBlock canBecomeFirstResponder;


@property(nonatomic,strong)NSMutableSet *responderSet;

@property(nonatomic,strong)LJKeyBroadNotificationManager *keyBroadNotManager;

@end

@implementation LJKeyBroadEvent


-(void)registerKeyBroadEventShowEvent:(KeyBroadEventResponderCallBack)Showblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationShowBlock AndFrameChangeBlock:(KeyBroadEventNotificationViewAnimationBlock)frameChangeBlock HidenEvent:(KeyBroadEventResponderCallBack)Hidenblock AndViewAnimationBlock:(KeyBroadEventNotificationViewAnimationBlock)animationHidenBlock{
    
    [self blingNotEvent];
    
    
    LJKeyBraodResponderCallBlockModel *model = [[LJKeyBraodResponderCallBlockModel alloc]initWithBroadEventShowEvent:Showblock AndViewAnimationBlock:animationShowBlock AndFrameChangeBlock:frameChangeBlock HidenEvent:Hidenblock AndViewAnimationBlock:animationHidenBlock];
    
    [self.responderSet addObject:model];
    
    [self registerKeyBroadEvent:^(UIView *view, KeyBroadEventStyle style) {
        
        if([view isKindOfClass:UIView.class]){
            switch (style) {
                case KeyBroadEventSelect:{
                    
                    for (LJKeyBraodResponderCallBlockModel *model in self.responderSet) {
                        
                        if(model.Showblock){
                            model.Showblock(view);
                        }

                    }
                }break;
                case KeyBroadEventCancel:{
                    
                    for (LJKeyBraodResponderCallBlockModel *model in self.responderSet) {
                        if(model.Hidenblock){
                            model.Hidenblock(view);
                        }
                    }
                    
                }break;
            }
            
        }
    }];
    
}

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
-(void)blingNotEvent{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self.keyBroadNotManager addKeyBroadNotificationFrameChangeBlock:^(UIView *view, CGFloat keyBroadHeight) {
           
            for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
                
                if(model.frameChangeBlock){
                    
                    model.frameChangeBlock(view, keyBroadHeight);
                }
                
            }

        }];
        
        [self.keyBroadNotManager addKeyBroadNotificationShowBlock:^(UIView *view, CGFloat keyBroadHeight) {
            
            for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
                
                if(model.animationShowBlock){
                    
                    model.animationShowBlock(view,keyBroadHeight);
                }
                
            }
            
            
        }];
    
        
        [self.keyBroadNotManager addKeyBroadNotificationHideBlock:^(UIView *view, CGFloat keyBroadHeight) {
           
            for (LJKeyBraodResponderCallBlockModel *model in [LJKeyBroadEvent sharedInstance].responderSet) {
                
                if(model.animationHidenBlock){
                    
                    model.animationHidenBlock(view,keyBroadHeight);
                }
                
            }

        }];
    });
    
}


-(void)blingEvent{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        [UIResponder configCanBecomeFirstResponderCallBackBlock:^BOOL(UIView * _Nonnull view) {
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
        
        
        [UIResponder configbecomeFirstResponderCallBackBlock:^(UIView * _Nonnull view) {
            
            if([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]){
                
                [self runBlock:view and:KeyBroadEventSelect];
                
            }
            
        }];
        [UIResponder configresignFirstResponderCallBackBlock:^(UIView * _Nonnull view) {
            if([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]){
                
                [self runBlock:view and:KeyBroadEventCancel];
                
            }
        }];
        
        
        
    });
    
}

-(LJKeyBroadNotificationManager*)keyBroadNotManager{
    
    if(_keyBroadNotManager==nil){
        _keyBroadNotManager = [[LJKeyBroadNotificationManager alloc]init];
    }
    return _keyBroadNotManager;
    
}

-(NSMutableSet*)responderSet{
    if(_responderSet==nil){
        _responderSet = [NSMutableSet set];
    }
    return _responderSet;
    
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
