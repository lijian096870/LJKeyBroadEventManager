//
//  LJViewKit.h
//  PP
//
//  Created by 李健 on 2018/7/31.
//  Copyright © 2018年 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^viewFrameChangeBlock)(UIView *view,CGRect oldFrame,CGRect newFrame);

typedef void(^viewWindowChangeBlock)(UIView *view,UIWindow *window);


FOUNDATION_EXTERN void viewsetFrameChangeBlock(UIView *view,viewFrameChangeBlock block);

FOUNDATION_EXTERN void viewAddFrameChangeBlock(UIView *view,viewFrameChangeBlock block);


FOUNDATION_EXTERN void SetFrameWillChangeBlock(UIView *view,viewFrameChangeBlock block);
FOUNDATION_EXTERN void AddFrameWillChangeBlock(UIView *view,viewFrameChangeBlock block);

FOUNDATION_EXTERN void SetFrameDidChangeBlock(UIView *view,viewFrameChangeBlock block);
FOUNDATION_EXTERN void AddFrameDidChangeBlock(UIView *view,viewFrameChangeBlock block);




FOUNDATION_EXTERN void SetWindowWillMoveBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowWillMoveBlock(UIView *view,viewWindowChangeBlock block);


FOUNDATION_EXTERN void SetWindowDidMoveBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowDidMoveBlock(UIView *view,viewWindowChangeBlock block);





FOUNDATION_EXTERN void SetWindowWillAddBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowWillAddBlock(UIView *view,viewWindowChangeBlock block);

FOUNDATION_EXTERN void SetWindowDidAddBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowDidAddBlock(UIView *view,viewWindowChangeBlock block);
