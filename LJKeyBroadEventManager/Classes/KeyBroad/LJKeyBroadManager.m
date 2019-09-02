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
#import "LJResponderArrayUtil.h"

static NSString * const kAlertSheetTextFieldClass = @"UIAlertSheetTextField";
static NSString * const kAlertControllerTextFieldClass = @"_UIAlertControllerTextField";
static NSString * const kSearchBarTextFieldClass = @"UISearchBarTextField";

@interface UIViewController ()


-(void)keyBroadOffset:(CGFloat)offset Responder:(UIView*)Responder;


-(void)keyBroadScrollOffset:(CGFloat)offset Responder:(UIView*)Responder;


-(void)keyBroadOffset:(CGFloat)offset;

-(CGFloat)TopSpacingToFirstResponder:(UIView*)Responder;

-(BOOL)ShowExtensionToolBar:(UIView*)Responder;

-(BOOL)canBecomeFirstResponder:(UIView*)Responder;
@end

typedef NS_ENUM(NSUInteger, KeyBroadstate) {
    keyBroadNone  = 0,
    keyBroadShow,
};

@interface LJKeyBroadManager ()

@property(nonatomic,weak)UIViewController *object_keyBroad;

@property(nonatomic,copy)dispatch_block_t dellocBlock;


@property(nonatomic,strong)NSNumber *currentNumber;

@property(nonatomic,strong)LJKeyBroadRespoderModel *responderModel;

@property(nonatomic,strong)LJKeyBroadRespoderModel *cancel_responderModel;

@property(nonatomic,strong)NSMutableArray *ResponderArray;

@property(nonatomic,assign)CGFloat KeyBroadHeight;



@end

@implementation LJKeyBroadManager

-(void)configDestroyBlock:(dispatch_block_t)dellocBlock{
    self.dellocBlock = dellocBlock;
    
}

- (instancetype)initWithMaster_object_keyBroad:(UIViewController*)object
{
    self = [super init];
    if (self) {
        self.object_keyBroad = object;
        self.KeyBroadHeight = 0.0;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillChange:)
                                                     name:UIKeyboardWillChangeFrameNotification
                                                   object:nil];
    }
    return self;
}


-(void)CancelEventAction:(UIView*)view{
    
    if(self.responderModel.view == view){
        self.cancel_responderModel = self.responderModel;
        [self.ResponderArray removeAllObjects];
        self.responderModel = nil;
        self.KeyBroadHeight = 0.0;
        
    }
}

-(void)EventAction:(UIView*)view{
    
    if(self.responderModel.view == view){
        
    }else{
        if([self.object_keyBroad isKindOfClass:[UIViewController class]]&&[viewGetSuperController(view).keyBroad_mess_uniqueID isEqualToString:self.object_keyBroad.keyBroad_mess_uniqueID]){
            
            UIView *window = [self getSuperWindows:self.object_keyBroad.view];
            
            self.ResponderArray = [self ResponderArrayBy:self.object_keyBroad andWindow:window];
            
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
-(LJKeyboardToolBar*)reloadLJKeyboardToolBar:(LJKeyboardToolBar*)bar and:(LJKeyBroadRespoderModel*)model  and:(UIView*)window{
    
    
    bar.leftbtn.enabled = [self CanLeftArrowButton:model and:window];
    bar.rightbtn.enabled = [self CanRightArrowButton:model and:window];
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
        [self _didClickedLeftArrowButton:self.responderModel and:self.responderModel.view.window];
    }
    
    
    
}
- (void)_didClickedLeftArrowButton:(LJKeyBroadRespoderModel *)currentModel and:(UIView*)window{
    
    NSUInteger index = [self.ResponderArray indexOfObject:currentModel] -1;
    if(index<self.ResponderArray.count&&index>=0){
        
        LJKeyBroadRespoderModel *model = [self.ResponderArray objectAtIndex:index];
        
        if([model.view isKindOfClass:[UIView class]]&&[self canBeFirstResponder:model.view]&&[LJResponderArrayUtil confimDisCorrect:model andNext:currentModel and:window]){
            
            UIViewController *viewController = viewGetSuperController(currentModel.view);
            
            if([viewController isKindOfClass:[UIViewController class]]&&[viewController respondsToSelector:@selector(canBecomeFirstResponder:)]){
                if([viewController canBecomeFirstResponder:model.view]){
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        [model.view becomeFirstResponder];
                        
                    });
                }
                
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [model.view becomeFirstResponder];
                    
                });
                
            }
            
            
          
        }
    }
}
- (BOOL)CanLeftArrowButton:(LJKeyBroadRespoderModel *)currentModel and:(UIView*)window{
    
    NSUInteger index = [self.ResponderArray indexOfObject:currentModel] -1;
    if(index<self.ResponderArray.count&&index>=0){
        
        LJKeyBroadRespoderModel *model = [self.ResponderArray objectAtIndex:index];

        if([model.view isKindOfClass:[UIView class]]&&[self canBeFirstResponder:model.view]){
            
            UIViewController *viewController = viewGetSuperController(currentModel.view);
            
            if([viewController isKindOfClass:[UIViewController class]]&&[viewController respondsToSelector:@selector(canBecomeFirstResponder:)]){
                if([viewController canBecomeFirstResponder:model.view]){
                    
                    if([LJResponderArrayUtil confimDisCorrect:model andNext:currentModel and:window]){
                        return true;
                    }
                }
                
            }else{
                if([LJResponderArrayUtil confimDisCorrect:model andNext:currentModel and:window]){
                    return true;
                }
            }
            
            
           
        }
    }
    return false;
}
- (void)didClickedRightArrowButton{
    if(self.responderModel&&[self.responderModel.view isKindOfClass:[UIView class]]){
        [self _didClickedRightArrowButton:self.responderModel and:self.responderModel.view.window];
    }
    
}
- (BOOL)CanRightArrowButton:(LJKeyBroadRespoderModel *)currentModel and:(UIView*)window{
    
    NSUInteger index = [self.ResponderArray indexOfObject:currentModel] +1;
    if(index<self.ResponderArray.count&&index>=0){
        
        LJKeyBroadRespoderModel *model = [self.ResponderArray objectAtIndex:index];
        
        if([model.view isKindOfClass:[UIView class]]&&[self canBeFirstResponder:model.view]){
            
              UIViewController *viewController = viewGetSuperController(currentModel.view);
            
            if([viewController isKindOfClass:[UIViewController class]]&&[viewController respondsToSelector:@selector(canBecomeFirstResponder:)]){
                if([viewController canBecomeFirstResponder:model.view]){
                    
                    if([LJResponderArrayUtil confimDisCorrect:currentModel andNext:model and:window]){
                        return true;
                    }
                }
                
            }else{
                if([LJResponderArrayUtil confimDisCorrect:currentModel andNext:model and:window]){
                    return true;
                }
            }
            
            
           
        }
        
    }
     return false;
}
- (void)_didClickedRightArrowButton:(LJKeyBroadRespoderModel *)currentModel and:(UIView*)window{
    
    NSUInteger index = [self.ResponderArray indexOfObject:currentModel] +1;
    if(index<self.ResponderArray.count&&index>=0){
        
        LJKeyBroadRespoderModel *model = [self.ResponderArray objectAtIndex:index];
        
        if([model.view isKindOfClass:[UIView class]]&&[self canBeFirstResponder:model.view]&&[LJResponderArrayUtil confimDisCorrect:currentModel andNext:model and:window]){
            
            UIViewController *viewController = viewGetSuperController(currentModel.view);
            
            
            if([viewController isKindOfClass:[UIViewController class]]&&[viewController respondsToSelector:@selector(canBecomeFirstResponder:)]){
                if([viewController canBecomeFirstResponder:model.view]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        [model.view becomeFirstResponder];
                        
                        
                    });
                }
            }else{
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
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]){
        //获取键盘的高度
        
        NSDictionary *userInfo = [aNotification userInfo];
        NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
        CGRect keyboardRect = [aValue CGRectValue];
        CGFloat height = keyboardRect.size.height;
        self.KeyBroadHeight = height;
        
        
        [self moveOffset:[self.responderModel calculate:height] Responder:self.responderModel.view];
        
        
    }
}
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    if([self.cancel_responderModel isKindOfClass:LJKeyBroadRespoderModel.class]){
        [self moveOffset:0.0 Responder:self.cancel_responderModel.view];
        self.cancel_responderModel = nil;
        
    }
    
}



-(void)customerKeyBroadChange{
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]&&self.KeyBroadHeight>0.0){
        
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            [self moveOffset:[self.responderModel calculate:self.KeyBroadHeight] Responder:self.responderModel.view];
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
    
    
}

- (void)keyboardWillChange:(NSNotification *)aNotification
{
    
    if([self.responderModel isKindOfClass:LJKeyBroadRespoderModel.class]){
        //获取键盘的高度
        NSDictionary *userInfo = [aNotification userInfo];
        NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
        CGRect keyboardRect = [aValue CGRectValue];
        CGFloat height = keyboardRect.size.height;
        self.KeyBroadHeight = height;
        [self moveOffset:[self.responderModel calculate:height] Responder:self.responderModel.view];
    }
    
    
    
    
    
}
-(void)moveOffset:(CGFloat)offset Responder:(UIView*)Responder{
    
    
    if([self.currentNumber isKindOfClass:[NSNumber class]]){
        
        if([self.currentNumber floatValue] == offset){
            
        }else{
            self.currentNumber = [NSNumber numberWithFloat:offset];
            
            if([self.object_keyBroad isKindOfClass:[UIViewController class]]){
                
                
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:)]){
                    
                    [self.object_keyBroad keyBroadOffset:-offset];
                    
                }
                
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:Responder:)]){
                    
                    [self.object_keyBroad keyBroadOffset:-offset Responder:Responder];
                }
                CGFloat scrollOffsect = [self.object_keyBroad claculateScrollerViewOffset:-offset];
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadScrollOffset:Responder:)]){
                    [self.object_keyBroad keyBroadScrollOffset:-scrollOffsect Responder:Responder];
                }
                
                
            }
            
            
        }
        
    }else{
        
        if(offset == 0.0){
            
            
        }else{
            self.currentNumber = [NSNumber numberWithFloat:offset];
            if([self.object_keyBroad isKindOfClass:[UIViewController class]]){
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:)]){
                    
                    [self.object_keyBroad keyBroadOffset:-offset];
                    
                }
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:Responder:)]){
                    
                    [self.object_keyBroad keyBroadOffset:-offset Responder:Responder];
                }
                
                CGFloat scrollOffsect = [self.object_keyBroad claculateScrollerViewOffset:-offset];
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadScrollOffset:Responder:)]){
                    [self.object_keyBroad keyBroadScrollOffset:-scrollOffsect Responder:Responder];
                }
                
                
            }
        }
        
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

-(NSMutableArray*)ResponderArrayBy:(UIViewController*)viewController andWindow:(UIView*)window{
    
    
    if(self.ResponderArray.count>0){
        return self.ResponderArray;
    }else{
        NSMutableArray *result= [NSMutableArray array];
        if(viewController.isViewLoaded){
            
            [self loopSubView:result and:viewController.view andWindow:window];
            
        }
        
        [LJResponderArrayUtil sortArray:result];
        
        [LJResponderArrayUtil confidDistanceInfo:result andWindow:window];
        return result;
    }
}




-(void)loopSubView:(NSMutableArray*)array and:(UIView*)view andWindow:(UIView*)window{
    
    if([self canBeFirstResponder:view]){
        
        LJKeyBroadRespoderModel *model = [[LJKeyBroadRespoderModel alloc]init];
        CGRect loaction = [view convertRect:view.bounds toView:window];
        
        if(CGRectContainsPoint(window.bounds, loaction.origin)||CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y+loaction.size.height))||CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y))||CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x, loaction.origin.y+loaction.size.height))||CGRectContainsRect(window.bounds, loaction)){
            model.responderLocation = loaction;
            model.windowBounds = window.bounds;
            model.view = view;
            [array addObject:model];
        }
        
        
    }else{
        
        for (UIView *subView in view.subviews) {
            
            [self loopSubView:array and:subView andWindow:window];
            
        }
    }
    
}



- (BOOL)canBeFirstResponder:(UIView *)view {
    
    BOOL enable = ([view canBecomeFirstResponder]&& view.userInteractionEnabled && !view.isHidden && view.alpha > 0.01 && [self EffectiveFirstResponderClass:view]);
    if (enable) {
        if ([self isKindOfClass:[UITextView class]]) {
            enable = [(UITextView *)view isEditable];
        } else if ([self isKindOfClass:[UITextField class]]) {
            enable = [(UITextField *)view isEnabled];
        }
    }
    return enable;
}
- (BOOL)EffectiveFirstResponderClass:(UIView *)view {
    return !([view isKindOfClass:NSClassFromString(kSearchBarTextFieldClass)] || [view isKindOfClass:[UISearchBar class]] || [view isKindOfClass:NSClassFromString(kAlertControllerTextFieldClass)] || [view isKindOfClass:NSClassFromString(kAlertSheetTextFieldClass)]);
}

- (void)dealloc
{
    if(self.dellocBlock){
        self.dellocBlock();
    }
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end

