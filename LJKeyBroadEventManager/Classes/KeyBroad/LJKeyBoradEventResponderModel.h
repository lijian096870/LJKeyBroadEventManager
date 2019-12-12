//
//  LJKeyBoradEventResponderModel.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/3.
//

#import <UIKit/UIKit.h>

@interface LJKeyBoradEventResponderModel : NSObject

- (instancetype)initWithMaster_object_keyBroad:(UIViewController *)object;

- (BOOL)ShowKeyBroad:(UIView *)view;

- (void)ShowkeyBroadResult:(UIView *)view AndResult:(BOOL)result;

- (void)ShowKeyBroadWillAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight;

- (void)ShowKeyBroadDidAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight;

- (void)keyBroadFrameChange:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight;

- (void)HiddenKeyBroad:(UIView *)view;

- (void)HiddenBroadWillAnimation:(UIView *)view;

- (void)HiddenBroadDidAnimation:(UIView *)view;

- (void)windowRotateTimeKeyBroadWillShow:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight;

- (void)windowRotateTimeKeyBroadDidShow:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight;

- (void)windowRotateTimeKeyBroadChangeFrameShow:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight;

- (void)windowRotateTimeKeyBroadHiden:(UIView *)view;

- (void)ShowkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view;

- (void)HiddenkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view;

- (void)configDestroyBlock:(dispatch_block_t)dellocBlock;

@end
