//
//  UIView+ReateViewController.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "UIView+ReateViewController.h"
#import "LJView_info_ViewController_ViewModel.h"
#import <objc/runtime.h>

@implementation UIView (ReateViewController)


-(UIViewController*)ViewController_viewController_info{
    
    if([[self LJViewModel_info_ViewController_info].reateViewController isKindOfClass:[UIViewController class]]){
        return [self LJViewModel_info_ViewController_info].reateViewController;
    }else{
        UIView *view=[self superview];
        if(view){
            return [view ViewController_viewController_info];
        }else{
            return nil;
        }
    }
    
}


-(UIViewController*)ViewController_viewGetCurrentController{
    
    if([self  LJViewModel_info_ViewController_info].reateViewController){
        return [self LJViewModel_info_ViewController_info].reateViewController;
    }else{
        return nil;
    }
    
}


-(UIViewController*)viewGetCurrentController_viewController_info{
    
    for (int i=0; i<self.subviews.count;i++) {
        UIView *view=[self.subviews objectAtIndex:i];
        if(view.isControllerView_viewController_info){
            UIViewController *vc=[view viewGetCurrentController_viewController_info];
            if([vc isKindOfClass:[UIViewController class]]){
                return vc;
            }
        }
    }
    for (int i=0; i<self.subviews.count;i++) {
        UIView *view=[self.subviews objectAtIndex:i];
        UIViewController *vc=[view viewGetCurrentController_viewController_info];
        if([vc isKindOfClass:[UIViewController class]]){
            return vc;
        }
    }
    return [self ViewController_viewGetCurrentController];
    
    
}
-(BOOL)isControllerView_viewController_info{
    return [self LJViewModel_info_ViewController_info].isViewControllerView;
    
}
- (LJView_info_ViewController_ViewModel *)LJViewModel_info_ViewController_info
{
    id obj=objc_getAssociatedObject(self, @selector(LJViewModel_info_ViewController_info));
    if([obj isKindOfClass:[LJView_info_ViewController_ViewModel class]]){
        return obj;
    }else{
        LJView_info_ViewController_ViewModel *mess=[[LJView_info_ViewController_ViewModel alloc] init];
        objc_setAssociatedObject(self, @selector(LJViewModel_info_ViewController_info), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return mess;
    }
}
-(void)setContentVC_reateViewController:(UIViewController*)VC{
    
    [[self LJViewModel_info_ViewController_info] setReateViewController:VC];
    
}
-(void)setContentVC_reateViewControllerValue:(BOOL)bo{
    
    [[self LJViewModel_info_ViewController_info] setIsViewControllerView:bo];
    
}
@end
