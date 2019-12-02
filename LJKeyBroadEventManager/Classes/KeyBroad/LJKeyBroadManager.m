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

@interface UIViewController ()<LJKeyboardManagerDelegate>

@end

@interface LJKeyBroadManager ()

@property(nonatomic,weak)UIViewController *object_keyBroad;

@property(nonatomic,copy)dispatch_block_t dellocBlock;

@property(nonatomic,strong)LJKeyBroadMoveOffsetManager *moveOffsetManager;

@property(nonatomic,strong)LJKeyBroadRespoderModel *responderModel;

@property(nonatomic,strong)LJKeyBroadRespoderModel *cancel_responderModel;

@property(nonatomic,strong)NSMutableArray *ResponderArray;

@property(nonatomic,assign)CGFloat KeyBroadHeight;

@end

@implementation LJKeyBroadManager


-(BOOL)ShowKeyBroad:(UIView*)view{
    
    return NO;
    
    NSLog(@"1111111,%@",view);
    
    if(self.responderModel.view == view){
        
    }else{
        if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[viewGetSuperController(view).keyBroad_mess_uniqueID isEqualToString:self.object_keyBroad.keyBroad_mess_uniqueID]){
            
            UIView *window = [self getSuperWindows:self.object_keyBroad.view];
            
            self.ResponderArray = [self ResponderArrayBy:self.object_keyBroad andWindow:window AndDontMove:view];
            
            LJKeyBroadRespoderModel *model = [self GetResponder:self.ResponderArray and:view];
            
            if([model isKindOfClass:LJKeyBroadRespoderModel.class]){
                
                if([self.object_keyBroad respondsToSelector:@selector(TopSpacingToFirstResponder:)]){
                    model.topSpacingToFirstResponder = [self.object_keyBroad TopSpacingToFirstResponder:view];
                }else{
                    model.topSpacingToFirstResponder = [LJkeyBroadConfig sharedInstance].topSpacingToFirstResponder;
                }
                if([self.object_keyBroad respondsToSelector:@selector(ShowExtensionToolBar:)]){
                    model.showExtensionToolBar = [self.object_keyBroad ShowExtensionToolBar:view];
                }else{
                    model.showExtensionToolBar = [LJkeyBroadConfig sharedInstance].showExtensionToolBar;
                }
                if(model.showExtensionToolBar){
                    
                    if([view isKindOfClass:[UITextField class]]){
                        UITextField *textView = ((UITextField*)view);
                        if(textView.inputAccessoryView == nil){
                            
                            textView.inputAccessoryView = [self reloadLJKeyboardToolBar:[self MadeToolBar:CGRectMake(0, 0, window.bounds.size.width, 40)] and:model and:window];
                            
                            model.ExtensionToolBarHeight = 40;
                        }else{
                            
                            if([textView.inputAccessoryView isKindOfClass:[LJKeyboardToolBar class]]){
                                
                                textView.inputAccessoryView = [self reloadLJKeyboardToolBar:[self MadeToolBar:CGRectMake(0, 0, window.bounds.size.width, 40)] and:model and:window];
                                model.ExtensionToolBarHeight = 40;
                                
                            }else{
                                model.ExtensionToolBarHeight = textView.inputAccessoryView.bounds.size.height;
                            }
                            
                        }
                    }
                    if([view isKindOfClass:[UITextView class]]){
                        UITextView *textView = ((UITextView*)view);
                        if(textView.inputAccessoryView == nil){
                            
                            textView.inputAccessoryView = [self reloadLJKeyboardToolBar:[self MadeToolBar:CGRectMake(0, 0, window.bounds.size.width, 40)] and:model and:window];
                            
                            model.ExtensionToolBarHeight = 40;
                        }else{
                            
                            if([textView.inputAccessoryView isKindOfClass:[LJKeyboardToolBar class]]){
                                
                                textView.inputAccessoryView = [self reloadLJKeyboardToolBar:[self MadeToolBar:CGRectMake(0, 0, window.bounds.size.width, 40)] and:model and:window];
                                model.ExtensionToolBarHeight = 40;
                                
                            }else{
                                model.ExtensionToolBarHeight = textView.inputAccessoryView.bounds.size.height;
                            }
                            
                        }
                    }
                }
                self.responderModel = model;
                [self customerKeyBroadChange];
            }
        }
    }
    
    
}
-(void)ShowKeyBroadAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight{
    
    
    NSLog(@"2222222,%@",view);
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]){
        
        self.KeyBroadHeight = keyBroadHeight;
        
        [self.moveOffsetManager moveOffset:[self.responderModel calculate:keyBroadHeight] Responder:self.responderModel.view];
    }
}

-(void)keyBroadFrameChange:(UIView*)view andkeyBroadHeight:(CGFloat)keyBroadHeight{
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]){
        
        self.KeyBroadHeight = keyBroadHeight;
        [self.moveOffsetManager moveOffset:[self.responderModel calculate:keyBroadHeight] Responder:self.responderModel.view];
    }
}
-(void)HiddenKeyBroad:(UIView*)view{
    
    NSLog(@"333333,%@",view);
    
    if(self.responderModel.view == view){
        self.cancel_responderModel = self.responderModel;
        [self.ResponderArray removeAllObjects];
        self.responderModel = nil;
        self.KeyBroadHeight = 0.0;
    }
    
}
-(void)HiddenBroadAnimation:(UIView *)view{
    
    NSLog(@"4444444,%@",view);
    
    
    if([self.cancel_responderModel isKindOfClass:LJKeyBroadRespoderModel.class]){
        [self.moveOffsetManager moveOffset:0.0 Responder:self.cancel_responderModel.view];
        self.cancel_responderModel = nil;
        
    }
}

-(void)configDestroyBlock:(dispatch_block_t)dellocBlock{
    self.dellocBlock = dellocBlock;
    
}

- (instancetype)initWithMaster_object_keyBroad:(UIViewController*)object
{
    self = [super init];
    if (self) {
        self.object_keyBroad = object;
        self.KeyBroadHeight = 0.0;
    }
    return self;
}

-(LJKeyboardToolBar*)reloadLJKeyboardToolBar:(LJKeyboardToolBar*)bar and:(LJKeyBroadRespoderModel*)model  and:(UIView*)window{
    
    if(self.object_keyBroad.isViewLoaded){
        
        LJKeyBroadRespoderModel *leftModel = [LJKeyBroadResponderArray CanLeftArrowButton:model and:window AndResponderArray:self.ResponderArray andRootView:self.object_keyBroad.view];
        
        if([leftModel isKindOfClass:LJKeyBroadRespoderModel.class]){
            
            bar.leftbtn.enabled = YES;
        }else{
            bar.leftbtn.enabled = NO;
        }
        
        LJKeyBroadRespoderModel *rightModel = [LJKeyBroadResponderArray CanRightArrowButton:model and:window AndResponderArray:self.ResponderArray andRootView:self.object_keyBroad.view];
        
        if([rightModel isKindOfClass:LJKeyBroadRespoderModel.class]){
            bar.rightbtn.enabled = YES;
        }else{
            bar.rightbtn.enabled = NO;
        }
        
    }else{
        
        bar.leftbtn.enabled = NO;
        bar.rightbtn.enabled = NO;
        
    }
    return bar;
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
        
        if(self.object_keyBroad.isViewLoaded){
            
            LJKeyBroadRespoderModel *model = [LJKeyBroadResponderArray CanLeftArrowButton:self.responderModel and:[self getSuperWindows:self.object_keyBroad.view] AndResponderArray:self.ResponderArray andRootView:self.object_keyBroad.view];
            
            if([model isKindOfClass:LJKeyBroadRespoderModel.class]&&[model.view isKindOfClass:UIView.class]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [model.view becomeFirstResponder];
                });
            }
        }
    }
}


- (void)didClickedRightArrowButton{
    
    if(self.responderModel&&[self.responderModel.view isKindOfClass:[UIView class]]){
        
        if(self.object_keyBroad.isViewLoaded){
            
            LJKeyBroadRespoderModel *model = [LJKeyBroadResponderArray CanRightArrowButton:self.responderModel and:[self getSuperWindows:self.object_keyBroad.view] AndResponderArray:self.ResponderArray andRootView:self.object_keyBroad.view];
            
            if([model isKindOfClass:LJKeyBroadRespoderModel.class]&&[model.view isKindOfClass:UIView.class]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [model.view becomeFirstResponder];
                    
                });
            }
        }
    }
}
- (void)didClickedDone{
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
}

-(void)customerKeyBroadChange{
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]&&self.KeyBroadHeight>0.0){
        
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            [self.moveOffsetManager moveOffset:[self.responderModel calculate:self.KeyBroadHeight] Responder:self.responderModel.view];
            
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

-(NSMutableArray*)ResponderArrayBy:(UIViewController*)viewController andWindow:(UIView*)window AndDontMove:(UIView*)DonMoveView{
    
    
    if(self.ResponderArray.count>0){
        return self.ResponderArray;
    }else{
        NSMutableArray *result= [NSMutableArray array];
        if(viewController.isViewLoaded){
            
            [LJKeyBroadResponderArray loopSubView:result and:viewController.view andWindow:window AndDontMove:DonMoveView];
            
        }
        return result;
    }
}

-(LJKeyBroadMoveOffsetManager*)moveOffsetManager{
    
    if(_moveOffsetManager==nil){
        _moveOffsetManager = [[LJKeyBroadMoveOffsetManager alloc]initWithMaster_object_keyBroad:self.object_keyBroad];
    }
    return _moveOffsetManager;
    
}

- (void)dealloc
{
    if(self.dellocBlock){
        self.dellocBlock();
    }
}
@end

