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
#import <objc/runtime.h>
#import "LJViewControllerManager.h"

@implementation LJKeyBroadAnimationView

+ (void)findedView:(UIView *)view {
    viewAddFrameChangeBlock(view, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
        NSLog(@"%@,%@", NSStringFromCGRect(oldFrame), NSStringFromCGRect(newFrame));
    });
}

+ (void)AnimationView {
//    addViewControllerLoadViewBlock(^(UIViewController *viewController) {
//        
//        
//        NSLog(@"%@",viewController);
//        
//        if ([NSStringFromClass(viewController.class) isEqualToString:@"UIInputWindowController"]) {
//            AddWindowDidAddKeyBlock(viewController.view, @"UIInputWindowController.view", ^(UIView *view) {
//                               
//                NSLog(@"%@",view);
//                
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                    NSLog(@"%@",view);
//                });
//
//                viewAddFrameChangeBlock(view, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
//                   
//                    NSLog(@"%@,%@",NSStringFromCGRect(oldFrame),NSStringFromCGRect(newFrame));
//                    
//                });
////                [self haveMethod:view.class];
////                [self addSubViewChange:view];
////
////                AddViewAddSubViewBlock(view, ^(UIView *view, UIView *subView) {
////                    viewAddFrameChangeBlock(subView, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
////                        NSLog(@"%@,%@", NSStringFromCGRect(oldFrame), NSStringFromCGRect(newFrame));
////                    });
////                });
//            });
//        }
//    });
}
+ (BOOL)haveMethod:(Class)calss{
    unsigned int    count;
    
    
    Method          *methods = class_copyMethodList(calss, &count);
    
    for (int i = 0; i < count; i++) {
        Method      method = methods[i];
        SEL         selector = method_getName(method);
        NSString    *name = NSStringFromSelector(selector);
        
        NSLog(@"%@",name);
    }
    
    free(methods);
    return NO;
}
+ (void)addSubViewChange:(UIView *)view {
        
    if ([view isKindOfClass:UIView.class]) {
        viewAddFrameChangeBlock(view, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
            NSLog(@"%@,%@", NSStringFromCGRect(oldFrame), NSStringFromCGRect(newFrame));
        });
        NSArray *array = [NSArray arrayWithArray:view.subviews];

        for (UIView *subView in array) {
            [self addSubViewChange:subView];
        }
    }
}

+ (UIView *)lookForRootView:(UIView *)view and:(NSString *)Name {
    NSLog(@"%@", view);

    //    if([NSStringFromClass(view.class) isEqualToString:Name]){
    //
    //        return view;
    //
    //    }
    NSArray *array = [NSArray arrayWithArray:view.subviews];

    for (UIView *subView in array) {
        return [self lookForRootView:subView and:Name];
    }

    return nil;
}

@end
