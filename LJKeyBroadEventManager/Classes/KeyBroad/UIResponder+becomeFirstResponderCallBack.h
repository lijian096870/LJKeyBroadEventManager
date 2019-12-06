//
//  UIResponder+becomeFirstResponderCallBack.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/8/20.
//

#import <UIKit/UIKit.h>

typedef BOOL (^ becomeFirstResponderCallBackBlock)(UIView *view);
typedef void (^ becomeFirstResponderResultCallBackBlock)(UIView *view, BOOL result);

typedef void (^ resignFirstResponderCallBackBlock)(UIView *view);
typedef BOOL (^ canBecomeFirstResponderCallBackBlock)(UIView *view);

@interface UIResponder (becomeFirstResponderCallBack)

+ (void)configCanBecomeFirstResponderCallBackBlock:(canBecomeFirstResponderCallBackBlock)block;

+ (void)configbecomeFirstResponderCallBackBlock:(becomeFirstResponderCallBackBlock)block;
+ (void)configbecomeFirstResponderResultCallBackBlock:(becomeFirstResponderResultCallBackBlock)block;

+ (void)configresignFirstResponderCallBackBlock:(resignFirstResponderCallBackBlock)block;

+ (UIResponder *)lj_currentFirstResponder;

@end
