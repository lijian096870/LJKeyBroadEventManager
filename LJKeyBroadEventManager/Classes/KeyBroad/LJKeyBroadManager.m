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
#import "LJKeyBroadResponderArray.h"
#import "LJKeyBroadMoveOffsetManager.h"
#import "LJKeyboardReloadToolBar.h"
@interface UIViewController ()<LJKeyboardManagerDelegate>

@end

@interface LJKeyBroadManager ()

@property(nonatomic,weak)UIViewController *object_keyBroad;



@property(nonatomic,strong)LJKeyBroadMoveOffsetManager *moveOffsetManager;

@property(nonatomic,strong)LJKeyBroadRespoderModel *responderModel;

@property(nonatomic,strong)LJKeyboardReloadToolBar *reloadTooBarUtil;

@property(nonatomic,strong)NSMutableArray *ResponderArray;


@end

@implementation LJKeyBroadManager


-(BOOL)ShowKeyBroad:(UIView*)view{
    
    if(self.responderModel.view == view){
        
        return YES;
        
    }else{
        if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[self.object_keyBroad isViewLoaded]){
            
            UIView *window = [self getSuperWindows:self.object_keyBroad.view];

            if(self.ResponderArray.count>0){
                
                LJKeyBroadRespoderModel *model = [self GetResponder:self.ResponderArray and:view];
                
                if([model isKindOfClass:LJKeyBroadRespoderModel.class]){
                    
                    [self configLJKeyboardToolBar:model AndResponderArray:self.ResponderArray];
                    
                    self.responderModel = model;
                    
                    [self customerKeyBroadChange];
                    
                    return YES;
                    
                }else{
                    
                    return NO;
                    
                }
                
            }else{
                
                NSMutableArray *result= [NSMutableArray array];
                
                [LJKeyBroadResponderArray loopSubView:result and:self.object_keyBroad.view andWindow:window AndDontMove:view];
                self.ResponderArray = result;
                
                LJKeyBroadRespoderModel *model = [self GetResponder:self.ResponderArray and:view];
                
                if([model isKindOfClass:LJKeyBroadRespoderModel.class]){
                    
                    [self configLJKeyboardToolBar:model AndResponderArray:self.ResponderArray];
                    
                    self.responderModel = model;
                    
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
}
-(void)ShowKeyBroadAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight{
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]&&[self.responderModel.view isKindOfClass:view.class] && (self.responderModel.view == view)){
        
        if([[NSNumber numberWithFloat:self.moveOffsetManager.moveOffset] isEqualToNumber:[NSNumber numberWithFloat:0.0]]&&self.object_keyBroad.isViewLoaded){
            
            [LJKeyBroadResponderArray responderArrayRenewResponderLocation:self.ResponderArray AndDontMove:self.responderModel andRootView:self.object_keyBroad.view];
            
            [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderModel AndResponderArray:self.ResponderArray];
        }

        [self.moveOffsetManager moveOffsetKeyBroadHeight:keyBroadHeight ResponderModel:self.responderModel];
        
    }
}

-(void)keyBroadFrameChange:(UIView*)view andkeyBroadHeight:(CGFloat)keyBroadHeight{
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]&&self.responderModel.view == view){
        
        [self.moveOffsetManager moveOffsetKeyBroadHeight:keyBroadHeight ResponderModel:self.responderModel];
        
    }
}
-(void)HiddenKeyBroad:(UIView*)view{
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]&&self.responderModel.view == view){
        [self.ResponderArray removeAllObjects];
    }
}
-(void)HiddenBroadAnimation:(UIView *)view{
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]&&self.responderModel.view == view){
        
        LJKeyBroadRespoderModel *model = self.responderModel;
        
        self.responderModel = nil;
        
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

-(void)configLJKeyboardToolBar:(LJKeyBroadRespoderModel*)model AndResponderArray:(NSArray*)responderArray{
    
    [self.reloadTooBarUtil configLJKeyboardToolBar:model andNewToolBar:[self MadeToolBar:CGRectMake(0, 0, model.window.bounds.size.width, 40)] AndResponderArray:responderArray];
    
    __weak LJKeyBroadManager *weakself = self;
    [self.moveOffsetManager setMoveCallBlock:^(LJKeyBroadRespoderModel *model) {
        
        if(weakself&&[model isKindOfClass:LJKeyBroadRespoderModel.class]&&[weakself ResponderArray].count>0){
            
            [weakself.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:model AndResponderArray:[weakself ResponderArray]];
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
    
    if(self.responderModel&&[self.responderModel.view isKindOfClass:[UIView class]]){
        
        if([self.object_keyBroad isKindOfClass:UIViewController.class] && self.object_keyBroad.isViewLoaded && self.ResponderArray.count>0){
            
            LJKeyBroadRespoderModel *model = [LJKeyBroadResponderArray CanLeftArrowButton:self.responderModel AndResponderArray:self.ResponderArray andRootView:self.object_keyBroad.view AndViewController:self.object_keyBroad];
            
            if([model isKindOfClass:LJKeyBroadRespoderModel.class]&&[model.view isKindOfClass:UIView.class]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [model.view becomeFirstResponder];
                });
            }else{
                  [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderModel AndResponderArray:self.ResponderArray];
            }
        }
    }
}


- (void)didClickedRightArrowButton{
    
    if(self.responderModel&&[self.responderModel.view isKindOfClass:[UIView class]]&&self.ResponderArray.count>0){
        
        if([self.object_keyBroad isKindOfClass:UIViewController.class] && self.object_keyBroad.isViewLoaded){
            
            LJKeyBroadRespoderModel *model = [LJKeyBroadResponderArray CanRightArrowButton:self.responderModel AndResponderArray:self.ResponderArray andRootView:self.object_keyBroad.view AndViewController:self.object_keyBroad];
            
            if([model isKindOfClass:LJKeyBroadRespoderModel.class]&&[model.view isKindOfClass:UIView.class]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [model.view becomeFirstResponder];
                    
                });
            }else{
                
                 [self.reloadTooBarUtil reloadLJKeyboardToolBarAndResponderModel:self.responderModel AndResponderArray:self.ResponderArray];
            }
        }
    }
}
- (void)didClickedDone{
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
}

-(void)customerKeyBroadChange{
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]&&self.moveOffsetManager.keyBroadHeight>0){
        
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            [self.moveOffsetManager moveOffsetKeyBroadHeight:self.moveOffsetManager.keyBroadHeight ResponderModel:self.responderModel];
            
        } completion:^(BOOL finished) {
            
        }];
    }
}

-(UIView*)getSuperWindows:(UIView*)view{
    
    if([view.superview isKindOfClass:[UIView class]]){
        
        return [self getSuperWindows:view.superview];
        
    }else{
        return view;
    }
}


-(LJKeyBroadRespoderModel*)GetResponder:(NSMutableArray*)array and:(UIView*)view{
    
    for (LJKeyBroadRespoderModel *temp in array) {
        if(temp.view == view){
            return temp;
        }
    }
    return nil;
    
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

