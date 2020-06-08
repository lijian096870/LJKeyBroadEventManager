//
//  UIView+updateConstraints.m
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//
#import "UIView+updateConstraints.h"
#import "LJViewUpdateConstraintsModel.h"
#import <objc/runtime.h>

@interface UIView ()

- (void)LJView_customer_FrameChangeNewFrame:(CGRect)newFrame OldFrame:(CGRect)oldFrame;
- (void)LJViewKVC_customer_FrameChangeNewFrame:(CGRect)newFrame OldFrame:(CGRect)oldFrame;

@end

@implementation UIView (updateConstraints)

- (void)LJView_ViewFrameChange_layoutSubviews {
    [UIView LJView_ViewFrameChange_layoutSubviews_loopSubViewBefore:self];
    [self LJView_ViewFrameChange_layoutSubviews];
    [UIView LJView_ViewFrameChange_layoutSubviews_loopSubViewAfter:self];
}

+ (void)LJView_ViewFrameChange_layoutSubviews_loopSubViewBefore:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        LJViewUpdateConstraintsModel *model = [view LJView_UpdateConstraintsModel_customer_FrameChange];

        if ([model isKindOfClass:LJViewUpdateConstraintsModel.class]) {
            model.frameValue = [NSValue valueWithCGRect:view.frame];
        }

        for (UIView *subView in [NSArray arrayWithArray:view.subviews]) {
            [self LJView_ViewFrameChange_layoutSubviews_loopSubViewBefore:subView];
        }
    }
}

+ (void)LJView_ViewFrameChange_layoutSubviews_loopSubViewAfter:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        LJViewUpdateConstraintsModel *model = [view LJView_UpdateConstraintsModel_customer_FrameChange];

        if ([model isKindOfClass:LJViewUpdateConstraintsModel.class] && [model.frameValue isKindOfClass:NSValue.class]) {
            CGRect  oldFrame = [model.frameValue CGRectValue];
            CGRect  newFrame = view.frame;

            if (CGRectEqualToRect(oldFrame, newFrame)) {} else {
                if ([view respondsToSelector:@selector(LJView_customer_FrameChangeNewFrame:OldFrame:)]) {
                    [view LJView_customer_FrameChangeNewFrame:newFrame OldFrame:oldFrame];
                }

                if ([view respondsToSelector:@selector(LJViewKVC_customer_FrameChangeNewFrame:OldFrame:)]) {
                    [view LJViewKVC_customer_FrameChangeNewFrame:newFrame OldFrame:oldFrame];
                }
            }
        }

        for (UIView *subView in [NSArray arrayWithArray:view.subviews]) {
            [self LJView_ViewFrameChange_layoutSubviews_loopSubViewAfter:subView];
        }
    }
}

- (LJViewUpdateConstraintsModel *)LJView_UpdateConstraintsModel_customer_FrameChange {
    return objc_getAssociatedObject(self, @selector(LJView_UpdateConstraintsModel_customer_FrameChange));
}

@end
