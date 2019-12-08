//
//  LJKeyBroadAnimationView.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/8.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadAnimationView.h"
#import "LJViewControllerManager.h"
#import "LJViewKit.h"
#import "LJViewControllerManager.h"


@implementation LJKeyBroadAnimationView


+(void)findedView:(UIView*)view{
    
   
    
    viewAddFrameChangeBlock(view, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
        
        NSLog(@"%@,%@",NSStringFromCGRect(oldFrame),NSStringFromCGRect(newFrame));
        
    });
    
}

+(void)AnimationView{
    
    addViewControllerLoadViewBlock(^(UIViewController *viewController) {
        
        if([viewController isKindOfClass:UIInputViewController.class]){
            
            AddWindowDidAddKeyBlock(viewController.view, @"UIInputViewController.view", ^(UIView *view) {
                
                UIView *inputView = [self lookForRootView:view.window and:@"UIKBInputBackdropView"];
              
                if([inputView isKindOfClass:UIView.class]){
                    
                    [self findedView:inputView];
                    
                }else{
                    AddViewAddSubViewKeyBlock(view.window, @"UIKBInputBackdropView", ^(UIView *view, UIView *subView) {
                        
                        if([NSStringFromClass(subView.class) isEqualToString:@"UIKBInputBackdropView"]){
                            
                           [self findedView:inputView];
                            
                        }
                    });
                }
                
              
            });
        }
        
    });
    
}
+(UIView*)lookForRootView:(UIView*)view and:(NSString*)Name{
    
//    NSLog(@"%@",view);
    
    if([NSStringFromClass(view.class) isEqualToString:Name]){

        return view;

    }
    NSArray *array = [NSArray arrayWithArray:view.subviews];
    for (UIView *subView in array) {
        return [self lookForRootView:subView and:Name];
    }
    return nil;
    
}

@end
