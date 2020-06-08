//
//  UIView+LJView.m
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "UIView+LJView.h"
#import "LJViewModel.h"
#import <objc/runtime.h>
#import "LJViewSuperViewFrameChangeRuner.h"
#import "LJViewWindowChangeRuner.h"
#import "LJViewUpdateConstraintsModel.h"
#import "LJViewFrameChangeNoRepeatModel.h"
@interface UIView ()

- (LJViewUpdateConstraintsModel *)LJView_UpdateConstraintsModel_customer_FrameChange;

@end

@implementation UIView (LJView)

- (void)LJView_customer_addSubview:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        if (self == view) {} else {
            [LJViewSuperViewFrameChangeRuner WilladdSuperView:self AndBeAddView:view];
            [LJViewWindowChangeRuner willAddView:self andSubView:view];
        }
    }

    [self LJView_customer_addSubview:view];

    if ([view isKindOfClass:UIView.class]) {
        if (self == view) {} else {
            [LJViewSuperViewFrameChangeRuner DidaddSuperView:self AndBeAddView:view];
            [LJViewSuperViewFrameChangeRuner addSubView:self AndBeAddView:view];
            [LJViewWindowChangeRuner didAddView:self andSubView:view];
        }
    }
}

- (void)LJView_customer_removeFromSuperview {
    UIView *superView = self.superview;

    if ([superView isKindOfClass:UIView.class]) {
        [LJViewSuperViewFrameChangeRuner WillremovwSuperView:superView AndBeRemoveView:self];
        [LJViewWindowChangeRuner willMoveView:superView andSubView:self];
    }

    [self LJView_customer_removeFromSuperview];

    if ([superView isKindOfClass:UIView.class]) {
        [LJViewSuperViewFrameChangeRuner DidremovwSuperView:superView AndBeRemoveView:self];
        [LJViewWindowChangeRuner didMoveView:superView andSubView:self];
    }
}

- (void)LJView_customer_FrameChangeNewFrame:(CGRect)newFrame OldFrame:(CGRect)oldFrame {
    if (CGRectEqualToRect(oldFrame, newFrame)) {} else {
        LJViewModel *model = [self viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.didChangeBlock) {
                model.didChangeBlock(self, oldFrame, newFrame);
            }

            for (viewFrameChangeBlock block in model._didChangeArray) {
                block(self, oldFrame, newFrame);
            }

            [LJViewSuperViewFrameChangeRuner viewDidChange:self AndOldFrame:oldFrame AndNewFrame:newFrame];
        } else {
            [LJViewSuperViewFrameChangeRuner viewDidChange:self AndOldFrame:oldFrame AndNewFrame:newFrame];
        }
    }
}

- (void)LJView_customer_setFrame:(CGRect)frame {
    CGRect oldFrame = self.frame;

    [self LJView_customer_setFrame:frame];
    [self LJView_customer_FrameChangeNewFrame:frame OldFrame:oldFrame];
}

- (LJViewModel *)viewFrameChangeMoveWindowChangeModelMayBenil {
    return objc_getAssociatedObject(self, @selector(viewFrameChangeMoveWindowChangeModel));
}

- (LJViewModel *)viewFrameChangeMoveWindowChangeModel
{
    LJViewModel *obj = objc_getAssociatedObject(self, @selector(viewFrameChangeMoveWindowChangeModel));

    if ([obj isKindOfClass:[LJViewModel class]]) {
        return obj;
    } else {
        LJViewModel *mess = [[LJViewModel alloc]initWithView:self];
        objc_setAssociatedObject(self, @selector(viewFrameChangeMoveWindowChangeModel), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        if ([[self LJView_UpdateConstraintsModel_customer_FrameChange] isKindOfClass:LJViewUpdateConstraintsModel.class]) {} else {
            objc_setAssociatedObject(self, @selector(LJView_UpdateConstraintsModel_customer_FrameChange), [[LJViewUpdateConstraintsModel alloc]init], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }

        return mess;
    }
}



@end
