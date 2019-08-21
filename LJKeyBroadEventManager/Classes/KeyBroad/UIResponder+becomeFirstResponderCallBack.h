//
//  UIResponder+becomeFirstResponderCallBack.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/8/20.
//

#import <UIKit/UIKit.h>


typedef void(^becomeFirstResponderCallBackBlock)(UIView *view);

typedef BOOL(^canBecomeFirstResponderCallBackBlock)(UIView *view);

@interface UIResponder (becomeFirstResponderCallBack)

+(void)configCanBecomeFirstResponderCallBackBlock:(canBecomeFirstResponderCallBackBlock)block;

+(void)configbecomeFirstResponderCallBackBlock:(becomeFirstResponderCallBackBlock)block;

+(void)configresignFirstResponderCallBackBlock:(becomeFirstResponderCallBackBlock)block;

+(void)becomeFirstResponderCallBackMethodExchange;


@end

