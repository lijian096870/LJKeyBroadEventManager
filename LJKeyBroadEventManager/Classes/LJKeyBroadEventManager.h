//
//  LJKeyBroadEventManager.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2018年 李健. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LJKeyboardManagerDelegate <NSObject>

@required


/**
 键盘弹出视图位移距离回调

 @param offset 需要位移的距离
 */
-(void)keyBroadOffset:(CGFloat)offset;

@optional


/**
 键盘弹出视图位移距离回调

 @param offset 需要位移的距离
 @param Responder 输入框对象
 */
-(void)keyBroadOffset:(CGFloat)offset Responder:(UIView*)Responder;


/**
 键盘弹出视图位移距离回调,根据上一次的位移计算出ScrollView需要调整的offset

 @param offset 需要调整的距离
 @param Responder 输入框对象
 */
-(void)keyBroadScrollOffset:(CGFloat)offset Responder:(UIView*)Responder;


/**
 输入框与键盘的距离

 @param Responder 输入框对象
 @return 输入框与键盘的距离
 */
-(CGFloat)TopSpacingToFirstResponder:(UIView*)Responder;


/**
 是否显示ToolBar

 @param Responder 输入框对象
 @return  是否显示ToolBar
 */
-(BOOL)ShowExtensionToolBar:(UIView*)Responder;


/**
 是否能够成为第一响应

 @param Responder 输入框对象
 @return 是否能够成为第一响应
 */
-(BOOL)canBecomeFirstResponder:(UIView*)Responder;

@end

/**
 注册控制器

 @param keyBroadResponder 控制器对象
 */
FOUNDATION_EXTERN void registerKeyBroadResponder(UIViewController<LJKeyboardManagerDelegate> *keyBroadResponder);


/**
 移出注册控制器对象

 @param keyBroadResponder 控制器对象
 */
FOUNDATION_EXTERN void removeKeyBroadResponder(UIViewController<LJKeyboardManagerDelegate> *keyBroadResponder);


/**
 设置默认输入框与键盘的距离

 @param Height 输入框与键盘的距离
 */
FOUNDATION_EXTERN void configTopSpacingToFirstResponder(CGFloat Height);


/**
 设置默认是否显示ToolBar

 @param show 是否显示ToolBar
 */
FOUNDATION_EXTERN void configShowExtensionToolBar(BOOL show);



typedef void(^becomeFirstResponderCallBackBlock)(UIView *view);


/**
 配置成为第一响应回调Block

 @param block 回调Block
 */
FOUNDATION_EXTERN void addbecomeFirstResponderCallBackBlock(becomeFirstResponderCallBackBlock block);


/**
 配置取消第一响应回调Block

 @param block 回调Block
 */
FOUNDATION_EXTERN void addresignResponderCallBackBlock(becomeFirstResponderCallBackBlock block);




//控制器
FOUNDATION_EXTERN BOOL viewIsControllerView(UIView *view);

FOUNDATION_EXTERN UIViewController* viewGetSuperController(UIView *view);

FOUNDATION_EXTERN UIViewController* viewGetAPPCurrentController(UIWindow *window);

