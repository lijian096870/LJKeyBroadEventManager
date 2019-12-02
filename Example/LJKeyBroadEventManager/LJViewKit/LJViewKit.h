//
//  LJViewKit.h
//  PP
//
//  Created by 李健 on 2018/7/31.
//  Copyright © 2018年 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^viewFrameChangeBlock)(UIView *view,CGRect oldFrame,CGRect newFrame);



FOUNDATION_EXTERN void viewsetFrameChangeBlock(UIView *view,viewFrameChangeBlock block);

FOUNDATION_EXTERN void viewAddFrameChangeBlock(UIView *view,viewFrameChangeBlock block);



