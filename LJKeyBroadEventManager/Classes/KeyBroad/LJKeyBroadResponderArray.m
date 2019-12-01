//
//  LJKeyBroadResponderArray.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/1.
//

#import "LJKeyBroadResponderArray.h"
#import "LJKeyBroadRespoderModel.h"

static NSString * const kAlertSheetTextFieldClass = @"UIAlertSheetTextField";
static NSString * const kAlertControllerTextFieldClass = @"_UIAlertControllerTextField";
static NSString * const kSearchBarTextFieldClass = @"UISearchBarTextField";


@implementation LJKeyBroadResponderArray


+(void)loopSubView:(NSMutableArray*)array and:(UIView*)view andWindow:(UIView*)window AndDontMove:(UIView*)DonMoveView{
    
    @autoreleasepool {
        [self NotLocationloopSubView:array and:view andWindow:window];
        
        NSLog(@"======%ld",array.count);
        
        [self removeOutLocation:array and:window AndDontMove:DonMoveView];
        
        [self removeRepeatLocation:array AndWindow:window AndDontMove:DonMoveView];
        
        NSLog(@"======%ld",array.count);
    }
 
}

+(void)removeRepeatLocation:(NSMutableArray*)array AndWindow:(UIView*)window AndDontMove:(UIView*)DonMoveView{
    
    NSArray *TepmArray = [NSArray arrayWithArray:array];
    
    for (int i=0; i<TepmArray.count; i++) {
        
        LJKeyBroadRespoderModel *temp = [TepmArray objectAtIndex:i];
        
        [self removeRepeatLocation:array AndWindow:window Model:temp AndDontMove:DonMoveView];
    }
}

+(void)removeRepeatLocation:(NSMutableArray*)array AndWindow:(UIView*)window Model:(LJKeyBroadRespoderModel*)temp AndDontMove:(UIView*)DonMoveView{
    
    for (int i = 0; i<array.count; i++) {
        LJKeyBroadRespoderModel *model = [array objectAtIndex:i];
        
        if(model == temp){
            
        }else{
            CGRect tempViewframe = [temp.view convertRect:temp.view.bounds toView:window];
            CGRect ModelViewframe = [model.view convertRect:model.view.bounds toView:window];
            
            if(CGRectContainsPoint(tempViewframe, ModelViewframe.origin)||CGRectContainsPoint(tempViewframe, CGPointMake(ModelViewframe.origin.x+ModelViewframe.size.width, ModelViewframe.origin.y+ModelViewframe.size.height))||CGRectContainsPoint(tempViewframe, CGPointMake(ModelViewframe.origin.x+ModelViewframe.size.width, ModelViewframe.origin.y))||CGRectContainsPoint(tempViewframe, CGPointMake(ModelViewframe.origin.x, ModelViewframe.origin.y+ModelViewframe.size.height))||CGRectContainsRect(tempViewframe, ModelViewframe)){
                
                if([DonMoveView isKindOfClass:UIView.class]){
                    
                    if(model.view == DonMoveView){
                        [array removeObject:temp];
                    }else if(temp.view == DonMoveView) {
                        [array removeObject:model];
                    }else{
                        [array removeObject:temp];
                        [array removeObject:model];
                    }
                    
                }else{
                    [array removeObjectAtIndex:i];
                }

                [self removeRepeatLocation:array AndWindow:window Model:temp AndDontMove:DonMoveView];
                
                return;
                
                
            }
            
            
        }
    }
    
}

+(void)removeOutLocation:(NSMutableArray*)array and:(UIView*)window AndDontMove:(UIView*)DonMoveView{
    
    for (int i=0; i<array.count; i++) {
        
        LJKeyBroadRespoderModel *model = [array objectAtIndex:i];
        
        if([DonMoveView isKindOfClass:UIView.class]&&model.view == DonMoveView){
            
            
        }else{
            if([self isOutLocation:model.view and:window AndinputView:model.view]||[self isCover:model.view and:window AndinputView:model.view]){
                
                [array removeObjectAtIndex:i];
                
                [self removeOutLocation:array and:window AndDontMove:DonMoveView];
                
                return;
                
            }
        }
        
        
        
    }
}
+(BOOL)isCover:(UIView*)view and:(UIView*)window AndinputView:(UIView*)inputView{
    
    if([view isKindOfClass:UIView.class]){
        UIView *superView = view.superview;
        
        if([superView isKindOfClass:UIView.class]){
            
            NSArray *subViewArray = [NSArray arrayWithArray:superView.subviews];
            
            BOOL lookfor = NO;
            
            CGRect loaction = [inputView convertRect:inputView.bounds toView:window];
            
            for (int i = 0; i<subViewArray.count; i++) {
                
                UIView *temp = [subViewArray objectAtIndex:i];
                
                if(lookfor){
                    
                    CGRect tempViewframe = [temp convertRect:temp.bounds toView:window];
                    
                    if(CGRectContainsPoint(tempViewframe, loaction.origin)||CGRectContainsPoint(tempViewframe, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y+loaction.size.height))||CGRectContainsPoint(tempViewframe, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y))||CGRectContainsPoint(tempViewframe, CGPointMake(loaction.origin.x, loaction.origin.y+loaction.size.height))||CGRectContainsRect(tempViewframe, loaction)){
                        
                        return YES;
                        
                    }else{
                        
                        return [self isCover:superView and:window AndinputView:inputView];
                    }
                }else{
                    if(temp == view){
                        lookfor = YES;
                    }
                    
                }
            }
            if(lookfor){
                
                return [self isCover:superView and:window AndinputView:inputView];
                
            }else{
                return YES;
            }
            
            
        }else{
            return NO;
        }
    }
    return YES;
}

+(BOOL)isOutLocation:(UIView*)view and:(UIView*)window AndinputView:(UIView*)inputView{
    if([view isKindOfClass:UIView.class]){
        UIView *superView = view.superview;
        if([superView isKindOfClass:UIView.class]){
            
            CGRect loaction = [inputView convertRect:inputView.bounds toView:window];
            
            CGRect superViewframe = [superView convertRect:superView.bounds toView:window];
            
            if(CGRectContainsPoint(superViewframe, loaction.origin)||CGRectContainsPoint(superViewframe, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y+loaction.size.height))||CGRectContainsPoint(superViewframe, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y))||CGRectContainsPoint(superViewframe, CGPointMake(loaction.origin.x, loaction.origin.y+loaction.size.height))||CGRectContainsRect(superViewframe, loaction)){
                
                return [self isOutLocation:superView and:window AndinputView:inputView];
                
                
            }else{
                
                return YES;
            }
            
            
        }else{
            return NO;
        }
        
    }else{
        
        return YES;
        
    }
}


+(void)NotLocationloopSubView:(NSMutableArray*)array and:(UIView*)view andWindow:(UIView*)window{
    
    if([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]){
        
        if([self canBeFirstResponder:view]){
            
            LJKeyBroadRespoderModel *model = [[LJKeyBroadRespoderModel alloc]init];
            CGRect loaction = [view convertRect:view.bounds toView:window];
            
            if(CGRectContainsPoint(window.bounds, loaction.origin)||CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y+loaction.size.height))||CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y))||CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x, loaction.origin.y+loaction.size.height))||CGRectContainsRect(window.bounds, loaction)){
                
                model.responderLocation = loaction;
                model.windowBounds = window.bounds;
                model.view = view;
                [array addObject:model];
            }
        }
    }else{
        for (UIView *subView in view.subviews) {
            
            [self NotLocationloopSubView:array and:subView andWindow:window];
            
        }
    }
}

+ (BOOL)canBeFirstResponder:(UIView *)view {
    
    BOOL enable = ([view canBecomeFirstResponder]&& view.userInteractionEnabled && !view.isHidden && view.alpha > 0.01 && [self EffectiveFirstResponderClass:view]);
    if (enable) {
        if ([view isKindOfClass:[UITextView class]]) {
            enable = [(UITextView *)view isEditable];
        } else if ([view isKindOfClass:[UITextField class]]) {
            enable = [(UITextField *)view isEnabled];
        }
    }
    return enable;
}
+ (BOOL)EffectiveFirstResponderClass:(UIView *)view {
    return !([view isKindOfClass:NSClassFromString(kSearchBarTextFieldClass)] || [view isKindOfClass:[UISearchBar class]] || [view isKindOfClass:NSClassFromString(kAlertControllerTextFieldClass)] || [view isKindOfClass:NSClassFromString(kAlertSheetTextFieldClass)]);
}

@end
