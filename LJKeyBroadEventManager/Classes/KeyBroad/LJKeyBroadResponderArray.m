//
//  LJKeyBroadResponderArray.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/1.
//

#import "LJKeyBroadResponderArray.h"
#import "LJViewControllerManager.h"
#import "LJKeyBroadEventManager.h"

@interface UIViewController ()<LJKeyboardManagerDelegate>

@end


@implementation LJKeyBroadResponderArray


+(void)loopSubView:(NSMutableArray*)array and:(UIView*)view andWindow:(UIView*)window AndDontMove:(UIView*)DonMoveView{
    
    @autoreleasepool {
        [self LocationloopSubView:array and:view andWindow:window andRootView:view AndisStrict:false];
        
        [self removeRepeatLocation:array AndWindow:window AndDontMove:DonMoveView];
        
        [self responderArray:array MustHaveView:DonMoveView andWindow:window];
        
        [self sortArray:array];
        
        [self confidDistanceInfo:array andWindow:window];
        
    }
}

+(void)responderArray:(NSMutableArray*)array MustHaveView:(UIView*)view andWindow:(UIView*)window{
    
    if([self responderArrayContainView:array and:view]){
        
    }else{
        [array removeAllObjects];
        LJKeyBroadRespoderModel *model = [[LJKeyBroadRespoderModel alloc]init];
        CGRect loaction = [view convertRect:view.bounds toView:window];
        
        model.responderLocation = loaction;
        model.view = view;
        model.window = window;
        [array addObject:model];
        
    }
}

+(BOOL)responderArrayContainView:(NSArray*)array and:(UIView*)view{
    
    if ([view isKindOfClass:UIView.class]) {
        
        for (int i = 0; i < array.count; i++) {
            LJKeyBroadRespoderModel *model = [array objectAtIndex:i];
            if(model.view == view){
                return YES;
            }
        }
        return NO;
        
    }else{
        
        return YES;
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
    
    NSArray *tempArray = [NSArray arrayWithArray:array];
    
    for (int i = 0; i<tempArray.count; i++) {
        LJKeyBroadRespoderModel *model = [tempArray objectAtIndex:i];
        
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
                    [array removeObject:model];
                }
                
            }
        }
    }
}

+(void)LocationloopSubView:(NSMutableArray*)array and:(UIView*)view andWindow:(UIView*)window andRootView:(UIView*)rootView AndisStrict:(BOOL)strict{
    
    if([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]){
        
        if([self canBeEditResponder:view andWindow:window andRootView:rootView AndisStrict:strict]){
            
            LJKeyBroadRespoderModel *model = [[LJKeyBroadRespoderModel alloc]init];
            
            CGRect loaction = [view convertRect:view.bounds toView:window];
            
            if(CGRectContainsPoint(window.bounds, loaction.origin)||CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y+loaction.size.height))||CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y))||CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x, loaction.origin.y+loaction.size.height))||CGRectContainsRect(window.bounds, loaction)){
                
                model.responderLocation = loaction;
                model.view = view;
                model.window = window;
                [array addObject:model];
            }
        }
        
    }else{
        
        for (UIView *subView in view.subviews) {
            
            [self LocationloopSubView:array and:subView andWindow:window andRootView:rootView AndisStrict:strict];
            
        }
    }
}

+(BOOL)canBeEditResponder:(UIView*)view andWindow:(UIView*)window andRootView:(UIView*)rootView AndisStrict:(BOOL)strict{
    if([view isKindOfClass:[UITextView class]]||[view isKindOfClass:[UITextField class]]){
        if([self canBeFirstResponder:view]){
            
            if([self isOutLocation:view AndWindow:window andRootView:rootView AndisStrict:strict]||[self isCoverInputView:view AndWindow:window andRootView:rootView AndisStrict:strict]){
                return NO;
            }else{
                return YES;
            }
            
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}

+ (BOOL)canBeFirstResponder:(UIView *)view {
    
    if(CGSizeEqualToSize(view.bounds.size, CGSizeZero)){
        
        return NO;
        
    }else{
        BOOL enable = ([view canBecomeFirstResponder]&& view.userInteractionEnabled && ![self isHiddenLoop:view]);
        if (enable) {
            if ([view isKindOfClass:[UITextView class]]) {
                enable = [(UITextView *)view isEditable];
            } else if ([view isKindOfClass:[UITextField class]]) {
                enable = [(UITextField *)view isEnabled];
            }
        }
        return enable;
    }
}

+(BOOL)isHiddenLoop:(UIView*)view{
    
    if([view isKindOfClass:UIView.class]){
        
        if(view.hidden || view.alpha <= 0.01){
            return YES;
        }else{
            return [self isHiddenLoop:view.superview];
        }
    }else{
        return NO;
    }
    
}

+(BOOL)isCoverInputView:(UIView*)inputView AndWindow:(UIView*)window andRootView:(UIView*)rootView AndisStrict:(BOOL)strict{
    
    return [self isCoverLoop:inputView and:window AndinputView:inputView andRootView:rootView AndisStrict:YES];
    
}

+(BOOL)isCoverLoop:(UIView*)view and:(UIView*)window AndinputView:(UIView*)inputView andRootView:(UIView*)rootView AndisStrict:(BOOL)strict{
    
    if([view isKindOfClass:UIView.class]){
        UIView *superView = view.superview;
        
        if(rootView == view){
            return NO;
        }else{
            if([superView isKindOfClass:UIView.class]){
                
                NSArray *subViewArray = [NSArray arrayWithArray:superView.subviews];
                
                BOOL lookfor = NO;
                
                CGRect loaction = [inputView convertRect:inputView.bounds toView:window];
                
                for (int i = 0; i<subViewArray.count; i++) {
                    
                    UIView *temp = [subViewArray objectAtIndex:i];
                    
                    if(lookfor){
                        
                        CGRect tempViewframe = [temp convertRect:temp.bounds toView:window];
                        
                        if(CGRectContainsPoint(tempViewframe, loaction.origin)&&CGRectContainsPoint(tempViewframe, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y+loaction.size.height))&&CGRectContainsPoint(tempViewframe, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y))&&CGRectContainsPoint(tempViewframe, CGPointMake(loaction.origin.x, loaction.origin.y+loaction.size.height))&&CGRectContainsRect(tempViewframe, loaction)){
                            
                            return YES;
                            
                        }else{
                            
                            return [self isCoverLoop:superView and:window AndinputView:inputView andRootView:rootView AndisStrict:strict];
                        }
                    }else{
                        if(temp == view){
                            lookfor = YES;
                        }
                        
                    }
                }
                if(lookfor){
                    
                    return [self isCoverLoop:superView and:window AndinputView:inputView andRootView:rootView AndisStrict:strict];
                    
                }else{
                    return YES;
                }
                
                
            }else{
                return NO;
            }
        }
        
        
    }
    return YES;
}

+(BOOL)isOutLocation:(UIView*)inputView AndWindow:(UIView*)window andRootView:(UIView*)rootView AndisStrict:(BOOL)strict{
    
    return [self isOutLocationLoop:inputView and:window AndinputView:inputView andRootView:rootView AndisStrict:strict];
    
}

+(BOOL)isOutLocationLoop:(UIView*)view and:(UIView*)window AndinputView:(UIView*)inputView andRootView:(UIView*)rootView AndisStrict:(BOOL)strict{
    if([view isKindOfClass:UIView.class]){
        UIView *superView = view.superview;
        
        if(rootView == view){
            
            return NO;
            
        }else{
            if([superView isKindOfClass:UIView.class]){
                
                CGRect loaction = [inputView convertRect:inputView.bounds toView:window];
                
                CGRect superViewframe = [superView convertRect:superView.bounds toView:window];
                
                if(strict){
                    
                    if(CGRectContainsPoint(superViewframe, loaction.origin)&&CGRectContainsPoint(superViewframe, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y+loaction.size.height))&&CGRectContainsPoint(superViewframe, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y))&&CGRectContainsPoint(superViewframe, CGPointMake(loaction.origin.x, loaction.origin.y+loaction.size.height))&&CGRectContainsRect(superViewframe, loaction)){
                        
                        return [self isOutLocationLoop:superView and:window AndinputView:inputView andRootView:rootView AndisStrict:strict];
                        
                    }else{
                        
                        return YES;
                    }
                    
                }else{
                    
                    if(CGRectContainsPoint(superViewframe, loaction.origin)||CGRectContainsPoint(superViewframe, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y+loaction.size.height))||CGRectContainsPoint(superViewframe, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y))||CGRectContainsPoint(superViewframe, CGPointMake(loaction.origin.x, loaction.origin.y+loaction.size.height))||CGRectContainsRect(superViewframe, loaction)){
                        
                        return [self isOutLocationLoop:superView and:window AndinputView:inputView andRootView:rootView AndisStrict:strict];
                        
                    }else{
                        
                        return YES;
                    }
                    
                }
                
                
                
            }else{
                return NO;
            }
        }
    }else{
        
        return YES;
        
    }
}

+(void)sortArray:(NSMutableArray*)array{
    
    if(array.count>1){
        [array sortUsingComparator:^NSComparisonResult(LJKeyBroadRespoderModel  *obj1, LJKeyBroadRespoderModel  *obj2) {
            
            if(obj1.responderLocation.origin.y>obj2.responderLocation.origin.y){
                
                return NSOrderedDescending;
                
            }else if(obj1.responderLocation.origin.y<obj2.responderLocation.origin.y){
                
                return NSOrderedAscending;
                
                
            }else if(obj1.responderLocation.origin.x>obj2.responderLocation.origin.x){
                
                return NSOrderedDescending;
                
            }else if(obj1.responderLocation.origin.y<obj2.responderLocation.origin.y){
                return NSOrderedAscending;
            }else{
                return NSOrderedSame;
            }
            
        }];
    }
}
+(void)confidDistanceInfo:(NSArray*)array andWindow:(UIView*)window{
    
    LJKeyBroadRespoderModel *model = nil;
    
    for (int i = 0; i<array.count; i++) {
        
        LJKeyBroadRespoderModel *current = [array objectAtIndex:i];
        
        if([model isKindOfClass:LJKeyBroadRespoderModel.class]){
            
            CGFloat dis = [self dis:current.view and:model.view and:window];
            model.nextDis = dis;
            model.nextView = current.view;
            current.aheadDis = dis;
            current.aheadView = model.view;
            
        }
        model = current;
    }
    
}
+(BOOL)confimDisCorrect:(LJKeyBroadRespoderModel*)ahead andNext:(LJKeyBroadRespoderModel*)Next andRootView:(UIView*)rootView{
    
    if([ahead.nextView isKindOfClass:UIView.class]&&[Next.aheadView isKindOfClass:UIView.class]&&[Next.view isKindOfClass:UIView.class]&&[ahead.view isKindOfClass:UIView.class]&&[Next.window isKindOfClass:UIView.class]){
        
        if(ahead.nextView == Next.view && Next.aheadView == ahead.view){
            
            if([self canBeEditResponder:Next.view andWindow:Next.window andRootView:rootView AndisStrict:YES]){
                
                CGFloat dis = [self dis:ahead.view and:Next.view and:Next.window];
                
                NSNumber *disNumber = [NSNumber numberWithFloat:dis];
                
                if([[NSNumber numberWithFloat:ahead.nextDis] isEqualToNumber:disNumber] && [[NSNumber numberWithFloat:Next.aheadDis] isEqualToNumber:disNumber]){
                    
                    CGRect loaction = [Next.view convertRect:Next.view.bounds toView:Next.window];
                    
                    UIView *window = Next.window;
                    
                    if(CGRectContainsPoint(window.bounds, loaction.origin)&&CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y+loaction.size.height))&&CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x+loaction.size.width, loaction.origin.y))&&CGRectContainsPoint(window.bounds, CGPointMake(loaction.origin.x, loaction.origin.y+loaction.size.height))&&CGRectContainsRect(window.bounds, loaction)){
                        
                        return YES;
                        
                    }else{
                        
                        return NO;
                    }
                }else{
                    
                    return NO;
                    
                }
                
            }else{
                return NO;
            }
            
        }else{
            return NO;
        }
    }else{
        
        return NO;
    }
}

+ (LJKeyBroadRespoderModel*)CanLeftArrowButton:(LJKeyBroadRespoderModel *)currentModel AndResponderArray:(NSArray*)array andRootView:(UIView*)rootView{
    
    NSUInteger index = [array indexOfObject:currentModel] -1;
    if(index<array.count&&index>=0){
        
        LJKeyBroadRespoderModel *model = [array objectAtIndex:index];
        
        if([model.view isKindOfClass:[UIView class]]&&[LJKeyBroadResponderArray confimDisCorrect:model andNext:currentModel andRootView:rootView]){
            
            UIViewController *viewController = viewGetSuperController(currentModel.view);
            
            if([viewController isKindOfClass:[UIViewController class]]&&[viewController respondsToSelector:@selector(canBecomeFirstResponder:)]){
                if([viewController canBecomeFirstResponder:model.view]){
                    
                    if([LJKeyBroadResponderArray confimDisCorrect:model andNext:currentModel andRootView:rootView]){
                        return model;
                    }
                }
                
            }else{
                if([LJKeyBroadResponderArray confimDisCorrect:model andNext:currentModel andRootView:rootView]){
                    return model;
                }
            }
            
        }
    }
    return nil;
}
+ (LJKeyBroadRespoderModel*)CanRightArrowButton:(LJKeyBroadRespoderModel *)currentModel AndResponderArray:(NSArray*)array andRootView:(UIView*)rootView{
    
    NSUInteger index = [array indexOfObject:currentModel] +1;
    if(index<array.count&&index>=0){
        
        LJKeyBroadRespoderModel *model = [array objectAtIndex:index];
        
        if([model.view isKindOfClass:[UIView class]]&&[LJKeyBroadResponderArray confimDisCorrect:currentModel andNext:model andRootView:rootView]){
            
            UIViewController *viewController = viewGetSuperController(currentModel.view);
            
            if([viewController isKindOfClass:[UIViewController class]]&&[viewController respondsToSelector:@selector(canBecomeFirstResponder:)]){
                if([viewController canBecomeFirstResponder:model.view]){
                    
                    if([LJKeyBroadResponderArray confimDisCorrect:currentModel andNext:model andRootView:rootView]){
                        return model;
                    }
                }
            }else{
                if([LJKeyBroadResponderArray confimDisCorrect:currentModel andNext:model andRootView:rootView]){
                    return model;
                }
            }
        }
    }
    return nil;
}

+(CGFloat)dis:(UIView*)view1 and:(UIView*)view2 and:(UIView*)window{
    
    CGRect loaction1 = [view1 convertRect:view1.bounds toView:window];
    CGRect loaction2 = [view2 convertRect:view2.bounds toView:window];
    
    return fabs(loaction1.origin.y-loaction2.origin.y);
    
}
@end