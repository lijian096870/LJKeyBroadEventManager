//
//  LJKeyBroadEventManager.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2018年 李健. All rights reserved.
//

#import "LJKeyBroadEventManager.h"

#import "UIResponder+becomeFirstResponderCallBack.h"
#import "LJKeyBroadRegisterManager.h"
#import "LJkeyBroadConfig.h"
#import "UIView+ReateViewController.h"

void addbecomeFirstResponderCallBackBlock(becomeFirstResponderCallBackBlock block)
{
    [UIResponder configbecomeFirstResponderCallBackBlock:^BOOL (UIView *view) {
        if (block) {
            block(view);
        }

        return YES;
    }];
}

void addresignResponderCallBackBlock(resignFirstResponderCallBackBlock block)
{
    [UIResponder configresignFirstResponderCallBackBlock:block];
}

void registerKeyBroadResponder(UIViewController <LJKeyboardManagerDelegate> *keyBroadResponder)
{
    if ([keyBroadResponder isKindOfClass:[UIViewController class]]) {
        [[LJKeyBroadRegisterManager sharedInstance] registerKeyBroadResponder:keyBroadResponder];
    }
}

void removeKeyBroadResponder(UIViewController <LJKeyboardManagerDelegate> *keyBroadResponder)
{
    if ([keyBroadResponder isKindOfClass:[UIViewController class]]) {
        [[LJKeyBroadRegisterManager sharedInstance]removeKeyBroadResponder:keyBroadResponder];
    }
}

void configTopSpacingToFirstResponder(CGFloat Height)
{
    [LJkeyBroadConfig sharedInstance].topSpacingToFirstResponder = Height;
}

void configShowExtensionToolBar(BOOL show)
{
    [LJkeyBroadConfig sharedInstance].showExtensionToolBar = show;
}

@interface LJKeyBroadEventManager : NSObject

@end

@implementation LJKeyBroadEventManager

+(void)registerKeyBroadResponder:(UIViewController <LJKeyboardManagerDelegate> *)viewController{
    
    registerKeyBroadResponder(viewController);
    
}

+(void)removeKeyBroadResponder:(UIViewController <LJKeyboardManagerDelegate> *)viewController{
    
    registerKeyBroadResponder(viewController);
}

@end
