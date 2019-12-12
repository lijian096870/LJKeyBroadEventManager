//
//  LJViewKit.h
//  PP
//
//  Created by 李健 on 2018/7/31.
//  Copyright © 2018年 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^viewFrameChangeBlock)(UIView *view,CGRect oldFrame,CGRect newFrame);

typedef void(^viewWindowChangeBlock)(UIView *view);

typedef void(^viewSuperFrameChangeBlock)(UIView *view,UIView *superView,CGRect oldFrame,CGRect newFrame);

typedef void(^viewAddSubView)(UIView *view,UIView *subView);


//kvc
FOUNDATION_EXTERN void viewSetFrameChangeBlock(UIView *view,viewFrameChangeBlock block);

FOUNDATION_EXTERN void viewAddFrameChangeBlock(UIView *view,viewFrameChangeBlock block);





FOUNDATION_EXTERN void SetFrameWillChangeBlock(UIView *view,viewFrameChangeBlock block);
FOUNDATION_EXTERN void AddFrameWillChangeBlock(UIView *view,viewFrameChangeBlock block);
FOUNDATION_EXTERN void AddFrameWillChangeKeyBlock(UIView *view,NSString *key,viewFrameChangeBlock block);


FOUNDATION_EXTERN void SetFrameDidChangeBlock(UIView *view,viewFrameChangeBlock block);
FOUNDATION_EXTERN void AddFrameDidChangeBlock(UIView *view,viewFrameChangeBlock block);
FOUNDATION_EXTERN void AddFrameDidChangeKeyBlock(UIView *view,NSString *key,viewFrameChangeBlock block);



FOUNDATION_EXTERN void SetWindowWillMoveBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowWillMoveBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowWillMoveKeyBlock(UIView *view,NSString *key,viewWindowChangeBlock block);

FOUNDATION_EXTERN void SetWindowDidMoveBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowDidMoveBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowDidMoveKeyBlock(UIView *view,NSString *key,viewWindowChangeBlock block);




FOUNDATION_EXTERN void SetWindowWillAddBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowWillAddBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowWillAddKeyBlock(UIView *view,NSString *key,viewWindowChangeBlock block);

FOUNDATION_EXTERN void SetWindowDidAddBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowDidAddBlock(UIView *view,viewWindowChangeBlock block);
FOUNDATION_EXTERN void AddWindowDidAddKeyBlock(UIView *view,NSString *key,viewWindowChangeBlock block);


FOUNDATION_EXTERN void SetSuperViewFrameWillChangeBlock(UIView *view,viewSuperFrameChangeBlock block);
FOUNDATION_EXTERN void AddSuperViewFrameWillChangeBlock(UIView *view,viewSuperFrameChangeBlock block);
FOUNDATION_EXTERN void AddSuperViewFrameWillChangeKeyBlock(UIView *view,NSString *key,viewSuperFrameChangeBlock block);


FOUNDATION_EXTERN void SetSuperViewFrameDidChangeBlock(UIView *view,viewSuperFrameChangeBlock block);
FOUNDATION_EXTERN void AddSuperViewFrameDidChangeBlock(UIView *view,viewSuperFrameChangeBlock block);
FOUNDATION_EXTERN void AddSuperViewFrameDidChangeKeyBlock(UIView *view,NSString *key,viewSuperFrameChangeBlock block);

FOUNDATION_EXTERN void SetViewAddSubViewBlock(UIView *view,viewAddSubView block);
FOUNDATION_EXTERN void AddViewAddSubViewBlock(UIView *view,viewAddSubView block);
FOUNDATION_EXTERN void AddViewAddSubViewKeyBlock(UIView *view,NSString *key,viewAddSubView block);
