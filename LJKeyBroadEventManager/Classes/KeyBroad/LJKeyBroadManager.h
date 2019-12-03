//
//  LJKeyBroadManager.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJKeyBroadManager : NSObject


-(BOOL)ShowKeyBroad:(UIView*)view;

-(void)ShowKeyBroadAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight;

-(void)keyBroadFrameChange:(UIView*)view andkeyBroadHeight:(CGFloat)keyBroadHeight;

-(void)HiddenKeyBroad:(UIView*)view;

-(void)HiddenBroadAnimation:(UIView *)view;

-(void)configDestroyBlock:(dispatch_block_t)dellocBlock;

@end


