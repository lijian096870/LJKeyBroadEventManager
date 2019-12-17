//
//  LJAlertViewKit.h
//  LJAlertViewKit
//
//  Created by 李健 on 2018/8/2.
//  Copyright © 2018年 李健. All rights reserved.
//

#import <UIKit/UIKit.h>


FOUNDATION_EXTERN UIView* PopTipString(UIWindow *window,NSString *title,BOOL TapOutSideClosed,NSTimeInterval delayHide);


FOUNDATION_EXTERN UIView* PopTipIndicator(UIWindow *window,BOOL TapOutSideClosed,NSTimeInterval delayHide);


FOUNDATION_EXTERN UIView* PopTipIndicatorAndString(UIWindow *window,NSString *title,BOOL TapOutSideClosed,NSTimeInterval delayHide);



FOUNDATION_EXTERN UIView* PopViewAnimated(UIWindow *window,UIView *view,BOOL animated,BOOL TapOutSideClosed,UIColor *backGroundColor,NSTimeInterval delayHide,dispatch_block_t completion,dispatch_block_t HideCompletion);


FOUNDATION_EXTERN void PopHidenAnimated(UIWindow *window,UIView *view,BOOL animated,dispatch_block_t completion);



FOUNDATION_EXTERN UIView* CurrentPopView(UIWindow *window);

FOUNDATION_EXTERN void PopViewClearQueue(UIWindow *window);




@protocol LJAlertViewkeyboardOffsetMoveDelegate <NSObject>


- (CGFloat)keyBroadNeedMoveOffset:(CGFloat)offset AndkeyBroadheight:(CGFloat)keyBroadheight;


@end
