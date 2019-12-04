//
//  LJKeyBroadManager.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadManager.h"
#import "LJKeyBroadRespoderModel.h"
#import "LJkeyBroadConfig.h"
#import "LJKeyboardToolBar.h"
#import "LJKeyBroadEventManager.h"
#import "UIViewController+KeyBoradManager.h"
#import "LJViewControllerManager.h"
#import "LJKeyBroadMoveOffsetManager.h"
#import "LJKeyboardReloadToolBar.h"
#import "LJKeyBroadRespoderNextSet.h"
@interface UIViewController ()<LJKeyboardManagerDelegate>

@end

@interface LJKeyBroadManager ()

@property(nonatomic,weak)UIViewController *object_keyBroad;


@property(nonatomic,strong)LJKeyBroadMoveOffsetManager *moveOffsetManager;


@property(nonatomic,strong)LJKeyboardReloadToolBar *reloadTooBarUtil;


@property(nonatomic,strong)LJKeyBroadRespoderNextSet *responderNextSet;


@end

@implementation LJKeyBroadManager


-(BOOL)ShowKeyBroad:(UIView*)view{
    
    if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[self.object_keyBroad isViewLoaded]&&(([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]))){
        
        if([self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]){
            
            if([self.responderNextSet isCurrentView:view]){
                
                [self configLJKeyboardToolBar:self.responderNextSet];
                
                [self customerKeyBroadChange];
                
                return YES;
                
            }else{
                if([self.responderNextSet isValidContain:view]){
                    
                    if([self.responderNextSet moveThisView:view]){
                        
                        [self configLJKeyboardToolBar:self.responderNextSet];
                        
                        [self customerKeyBroadChange];
                        
                        return YES;
                        
                    }else{
                        return NO;
                    }
                    
                }else{
                    
                    return NO;
                }
            }
            
        }else{
            
            LJKeyBroadRespoderNextSet *NextSet = [[LJKeyBroadRespoderNextSet alloc]initWithViewController:self.object_keyBroad AndMustHaveView:view];
            if([NextSet isValidContain:view]&&[NextSet isCurrentView:view]){
                
                self.responderNextSet = NextSet;
                [self configLJKeyboardToolBar:self.responderNextSet];
                [self customerKeyBroadChange];
                return YES;
                
            }else{
                return NO;
            }
            
        }
        
    }else{
        return NO;
    }
}

-(void)ShowkeyBroadResult:(UIView*)view AndResult:(BOOL)result{
    
    
    if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[self.object_keyBroad isViewLoaded]&&(([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]))&&[self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]&&[self.responderNextSet isCurrentView:view]){
        
        if(result){
            
        }else{
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [self.moveOffsetManager endEditResponderModel:self.responderNextSet.currentResponderModel];
                self.responderNextSet = nil;
            } completion:^(BOOL finished) {
                
            }];
        }
    }
}

-(void)ShowKeyBroadAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight{
    
    if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[self.object_keyBroad isViewLoaded]&&(([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]))&&[self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]&&[self.responderNextSet isValid]&&[self.responderNextSet isCurrentView:view]){
        
        if([[NSNumber numberWithFloat:self.moveOffsetManager.moveOffset] isEqualToNumber:[NSNumber numberWithFloat:0.0]]&&self.object_keyBroad.isViewLoaded){
            
            [self.responderNextSet responderArrayRenewResponderLocation];
            
            [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderNextSet];
            
        }
        
        [self.moveOffsetManager moveOffsetKeyBroadHeight:keyBroadHeight ResponderModel:self.responderNextSet.currentResponderModel];
        
    }
    
}

-(void)keyBroadFrameChange:(UIView*)view andkeyBroadHeight:(CGFloat)keyBroadHeight{
    
    if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[self.object_keyBroad isViewLoaded]&&(([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]))&&[self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]&&[self.responderNextSet isValid]&&[self.responderNextSet isCurrentView:view]){
        
        [self.moveOffsetManager moveOffsetKeyBroadHeight:keyBroadHeight ResponderModel:self.responderNextSet.currentResponderModel];
        
    }
}
-(void)HiddenKeyBroad:(UIView*)view{
    
    
    
    
}
-(void)HiddenBroadAnimation:(UIView *)view{
    
    if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[self.object_keyBroad isViewLoaded]&&(([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]))&&[self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]&&[self.responderNextSet isValid]&&[self.responderNextSet isCurrentView:view]){
        
        LJKeyBroadRespoderModel *model = self.responderNextSet.currentResponderModel;
        self.responderNextSet = nil;
        
        [self.moveOffsetManager endEditResponderModel:model];
    }
}


- (instancetype)initWithMaster_object_keyBroad:(UIViewController*)object
{
    self = [super init];
    if (self) {
        self.object_keyBroad = object;
    }
    return self;
}

-(void)configLJKeyboardToolBar:(LJKeyBroadRespoderNextSet *)responderNextSet{
    
    [self.reloadTooBarUtil configLJKeyboardToolBar:responderNextSet andNewToolBar:[self MadeToolBar:CGRectMake(0, 0, responderNextSet.currentResponderModel.window.bounds.size.width, 40)]];
    
    __weak LJKeyBroadManager *weakself = self;
    [self.moveOffsetManager setMoveCallBlock:^(LJKeyBroadRespoderModel *model) {
        
        
        if(weakself&&[model isKindOfClass:LJKeyBroadRespoderModel.class]&&[weakself.responderNextSet isValid]&&weakself.responderNextSet.currentResponderModel == model){
            
            [weakself.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:weakself.responderNextSet];
        }
    }];
}

- (LJKeyboardToolBar *)MadeToolBar:(CGRect)frame{
    
    __weak LJKeyBroadManager *weakself = self;
    return [[LJKeyboardToolBar alloc]initWithFrame:frame leftBtnBlock:^(LJKeyboardToolBar *bar) {
        
        if(weakself){
            [weakself didClickedLeftArrowButton];
        }
        
    } rightBtnBlock:^(LJKeyboardToolBar *bar) {
        if(weakself){
            [weakself didClickedRightArrowButton];
        }
    } doneBtnBlock:^(LJKeyboardToolBar *bar) {
        if(weakself){
            [weakself didClickedDone];
        }
    }];
}

- (void)didClickedLeftArrowButton{
    
    
    if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[self.object_keyBroad isViewLoaded]&&[self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]&&[self.responderNextSet isValid]){
        
        LJKeyBroadRespoderModel * model = [self.responderNextSet MoveLeftArrow];
        
        if([model isKindOfClass:LJKeyBroadRespoderModel.class]&&[model.view isKindOfClass:UIView.class]){
            
            if([self.responderNextSet moveThisView:model.view]){
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [model.view becomeFirstResponder];
                });
                
                
            }else{
                [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderNextSet];
            }
        }else{
            [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderNextSet];
        }
    }
    
}
- (void)didClickedRightArrowButton{
    
    if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[self.object_keyBroad isViewLoaded]&&[self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]&&[self.responderNextSet isValid]){
        
        LJKeyBroadRespoderModel * model = [self.responderNextSet MoveRightArrow];
        
        if([model isKindOfClass:LJKeyBroadRespoderModel.class]&&[model.view isKindOfClass:UIView.class]){
            
            if([self.responderNextSet moveThisView:model.view]){
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [model.view becomeFirstResponder];
                });
            }else{
                [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderNextSet];
            }
        }else{
            [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderNextSet];
        }
    }
    
}
- (void)didClickedDone{
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
}

-(void)customerKeyBroadChange{
    
    if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[self.object_keyBroad isViewLoaded]&&[self.responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class]&&[self.responderNextSet isValid]){
        
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            [self.moveOffsetManager moveOffsetKeyBroadHeight:self.moveOffsetManager.keyBroadHeight ResponderModel:self.responderNextSet.currentResponderModel];
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
}
-(LJKeyBroadMoveOffsetManager*)moveOffsetManager{
    
    if(_moveOffsetManager==nil){
        _moveOffsetManager = [[LJKeyBroadMoveOffsetManager alloc]initWithMaster_object_keyBroad:self.object_keyBroad];
    }
    return _moveOffsetManager;
    
}
-(LJKeyboardReloadToolBar*)reloadTooBarUtil{
    
    if(_reloadTooBarUtil==nil){
        _reloadTooBarUtil = [[LJKeyboardReloadToolBar alloc]initWithMaster_object_keyBroad:self.object_keyBroad];
    }
    return _reloadTooBarUtil;
    
}

@end

