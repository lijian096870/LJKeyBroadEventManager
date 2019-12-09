//
//  LJKeyBroadMoveEventPostFindInputAccessViewUtil.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/9.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadMoveEventPostFindInputAccessViewUtil.h"
#import "UIViewController+KeyBoradManager.h"
#import "UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h"
@implementation LJKeyBroadMoveEventPostFindInputAccessViewUtil

+(UIView*)findInputAccessViewController:(UIViewController*)viewController{
    
    
    UIView *responderView = [viewController keyBroadInputAccessoryViewRelateResponderView];
    if([responderView isKindOfClass:UIView.class]){
        return responderView;
    }else{
        return [self findInputAccessView:viewController.view];
    }
    
    
}

+(UIView*)findInputAccessView:(UIView*)view{
    
    
    if([view isKindOfClass:UIView.class]){
        
        UIView *responderView = [view keyBroadInputAccessoryViewRelateResponderView];
        
        if([responderView isKindOfClass:UIView.class]){
            
            return responderView;
        }
        
        
        NSArray *array  = [NSArray arrayWithArray:view.subviews];
        
        for (UIView *subView in array) {
            return [self findInputAccessView:subView];
        }
    }
    return nil;
    
}

@end
