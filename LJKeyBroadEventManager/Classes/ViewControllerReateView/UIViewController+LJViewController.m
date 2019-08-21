//
//  UIViewController+LJViewController.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "UIViewController+LJViewController.h"
#import <objc/runtime.h>

@interface UIView ()

-(void)setContentVC_reateViewController:(UIViewController*)VC;
-(void)setContentVC_reateViewControllerValue:(BOOL)bo;

@end


@implementation UIViewController (LJViewController)


+(void)configDidloadMethod_reateView{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL sel=sel_registerName("viewDidLoad");
        
        IMP getMethod= class_getMethodImplementation(self, sel);
        Method selM = class_getInstanceMethod(self, sel);
        
        id Block = ^void(id self){
            
            ((void(*)(id))getMethod)(self);
            UIViewController *vc=self;
            if([vc.view respondsToSelector:@selector(setContentVC_reateViewController:)]){
                
                [vc.view setContentVC_reateViewController:self];
                
            }
            if([vc.view respondsToSelector:@selector(setContentVC_reateViewControllerValue:)]){
                
                [vc.view setContentVC_reateViewControllerValue:YES];
                
            }
        };
        
        if(Block){
            IMP imp = imp_implementationWithBlock(Block);
            method_setImplementation(selM, imp);
        }
    });
    
    
}


@end
