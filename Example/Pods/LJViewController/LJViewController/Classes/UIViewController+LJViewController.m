//
//  UIViewController+LJViewController.m
//  LJViewController
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

static NSMutableArray *viewControllerLoadViewBlockArray = nil;

@implementation UIViewController (LJViewController)

+(void)addViewControllerLoadViewBlock:(LJViewControllerLoadViewBlock)block{
    
    if(block){
        if(viewControllerLoadViewBlockArray == nil){
            viewControllerLoadViewBlockArray = [NSMutableArray array];
        }
        [viewControllerLoadViewBlockArray addObject:block];
    }
    
}

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
            
            if(viewControllerLoadViewBlockArray){
                for (LJViewControllerLoadViewBlock block in viewControllerLoadViewBlockArray) {
                    if(block){
                        block(vc);
                    }
                }
            }
            
        };
        
        if(Block){
            IMP imp = imp_implementationWithBlock(Block);
            method_setImplementation(selM, imp);
        }
    });
    
    
}


@end
