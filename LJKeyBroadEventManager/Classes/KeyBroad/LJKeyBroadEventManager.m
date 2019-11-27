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

void addbecomeFirstResponderCallBackBlock(becomeFirstResponderCallBackBlock block){
    [UIView configbecomeFirstResponderCallBackBlock:block];
}
void addresignResponderCallBackBlock(becomeFirstResponderCallBackBlock block){
    [UIView configresignFirstResponderCallBackBlock:block];
}

void registerKeyBroadResponder(UIViewController<LJKeyboardManagerDelegate> *keyBroadResponder){
    
    
    if([keyBroadResponder isKindOfClass:[UIViewController class]]){
        [[LJKeyBroadRegisterManager sharedInstance] registerKeyBroadResponder:keyBroadResponder];
    }
    
    
}


void removeKeyBroadResponder(UIViewController<LJKeyboardManagerDelegate> *keyBroadResponder){
    
    if([keyBroadResponder isKindOfClass:[UIViewController class]]){
        [[LJKeyBroadRegisterManager sharedInstance]removeKeyBroadResponder:keyBroadResponder];
    }
}



void configTopSpacingToFirstResponder(CGFloat Height){
    [LJkeyBroadConfig sharedInstance].topSpacingToFirstResponder = Height;
    
    
}


void configShowExtensionToolBar(BOOL show){
    [LJkeyBroadConfig sharedInstance].showExtensionToolBar = show;
}


