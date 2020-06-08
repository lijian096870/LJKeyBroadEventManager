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
@implementation UIView (LJView)

- (void)LJView_customer_addSubview:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        if (self == view) {} else {
            [LJViewWindowChangeRuner willAddView:self andSubView:view];
        }
    }

    [self LJView_customer_addSubview:view];

    if ([view isKindOfClass:UIView.class]) {
        if (self == view) {} else {
            [LJViewSuperViewFrameChangeRuner addSubView:view AndBeAddView:self];
            [LJViewWindowChangeRuner didAddView:self andSubView:view];
        }
    }
}

- (void)LJView_customer_removeFromSuperview {
    UIView *superView = self.superview;

    if ([superView isKindOfClass:UIView.class]) {
        [LJViewWindowChangeRuner willMoveView:superView andSubView:self];
    }

    [self LJView_customer_removeFromSuperview];

    if ([superView isKindOfClass:UIView.class]) {
        [LJViewWindowChangeRuner didMoveView:superView andSubView:self];
    }
}

- (void)LJView_customer_setFrame:(CGRect)frame {
    CGRect oldFrame = self.frame;

    if (CGRectEqualToRect(oldFrame, frame)) {
        [self LJView_customer_setFrame:frame];
    } else {
        LJViewModel *model = [self viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.willChangeBlock) {
                model.willChangeBlock(self, oldFrame, frame);
            }

            for (viewFrameChangeBlock block in model._willChangeArray) {
                block(self, oldFrame, frame);
            }

            [LJViewSuperViewFrameChangeRuner viewWillChange:self AndOldFrame:oldFrame AndNewFrame:frame];
            [self LJView_customer_setFrame:frame];

            if (model.didChangeBlock) {
                model.didChangeBlock(self, oldFrame, frame);
            }

            for (viewFrameChangeBlock block in model._didChangeArray) {
                block(self, oldFrame, frame);
            }

            [LJViewSuperViewFrameChangeRuner viewDidChange:self AndOldFrame:oldFrame AndNewFrame:frame];
        } else {
            [LJViewSuperViewFrameChangeRuner viewWillChange:self AndOldFrame:oldFrame AndNewFrame:frame];

            [self LJView_customer_setFrame:frame];

            [LJViewSuperViewFrameChangeRuner viewDidChange:self AndOldFrame:oldFrame AndNewFrame:frame];
        }
    }
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
        return mess;
    }
}

@end
