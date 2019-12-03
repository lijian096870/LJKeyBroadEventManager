//
//  LJKeyBoradEventResponderModel.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/3.
//

#import <UIKit/UIKit.h>

@interface LJKeyBoradEventResponderModel : NSObject


- (instancetype)initWithMaster_object_keyBroad:(UIViewController*)object;


-(BOOL)ShowKeyBroad:(UIView*)view;

-(void)ShowKeyBroadAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight;

-(void)keyBroadFrameChange:(UIView*)view andkeyBroadHeight:(CGFloat)keyBroadHeight;

-(void)HiddenKeyBroad:(UIView*)view;

-(void)HiddenBroadAnimation:(UIView *)view;


-(void)configDestroyBlock:(dispatch_block_t)dellocBlock;

@end


