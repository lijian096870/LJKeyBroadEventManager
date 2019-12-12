//
//  LJViewWindowChangeRuner.m
//  FBSnapshotTestCase
//
//  Created by lijian on 2019/12/8.
//

#import "LJViewWindowChangeRuner.h"
#import "UIView+LJView.h"
@implementation LJViewWindowChangeRuner

+ (void)willAddView:(UIView *)superView andSubView:(UIView *)subView {
    UIWindow *window = [self getRootWindow:superView];

    if ([window isKindOfClass:UIWindow.class]) {
        [self LoopWillAddWindowView:subView];
    }
}

+ (void)LoopWillAddWindowView:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.willAddBlock) {
                model.willAddBlock(view);
            }

            for (viewWindowChangeBlock block in model._willAddArray) {
                if (block) {
                    block(view);
                }
            }
        }

        NSArray *array = [NSArray arrayWithArray:view.subviews];

        for (UIView *subView in array) {
            [self LoopWillAddWindowView:subView];
        }
    }
}

+ (void)didAddView:(UIView *)superView andSubView:(UIView *)subView {
    UIWindow *window = [self getRootWindow:superView];

    if ([window isKindOfClass:UIWindow.class]) {
        [self LoopDidAddWindowView:subView];
    }
}

+ (void)LoopDidAddWindowView:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.didAddBlock) {
                model.didAddBlock(view);
            }

            for (viewWindowChangeBlock block in model._didAddArray) {
                if (block) {
                    block(view);
                }
            }
        }

        NSArray *array = [NSArray arrayWithArray:view.subviews];

        for (UIView *subView in array) {
            [self LoopDidAddWindowView:subView];
        }
    }
}

+ (void)willMoveView:(UIView *)superView andSubView:(UIView *)subView {
    UIWindow *window = [self getRootWindow:superView];

    if ([window isKindOfClass:UIWindow.class]) {
        [self LoopWillMoveWindowView:subView];
    }
}

+ (void)LoopWillMoveWindowView:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.willMoveBlock) {
                model.willMoveBlock(view);
            }

            for (viewWindowChangeBlock block in model._willMoveArray) {
                if (block) {
                    block(view);
                }
            }
        }

        NSArray *array = [NSArray arrayWithArray:view.subviews];

        for (UIView *subView in array) {
            [self LoopWillMoveWindowView:subView];
        }
    }
}

+ (void)didMoveView:(UIView *)superView andSubView:(UIView *)subView {
    UIWindow *window = [self getRootWindow:superView];

    if ([window isKindOfClass:UIWindow.class]) {
        [self LoopDidMoveWindowView:subView];
    }
}

+ (void)LoopDidMoveWindowView:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.didMoveBlock) {
                model.didMoveBlock(view);
            }

            for (viewWindowChangeBlock block in model._didMoveArray) {
                if (block) {
                    block(view);
                }
            }
        }

        NSArray *array = [NSArray arrayWithArray:view.subviews];

        for (UIView *subView in array) {
            [self LoopDidMoveWindowView:subView];
        }
    }
}

+ (UIWindow *)getRootWindow:(UIView *)view {
    if ([view isKindOfClass:UIWindow.class]) {
        if ([view.superview isKindOfClass:UIView.class]) {
            return [self getRootWindow:view.superview];
        } else {
            return (UIWindow *)view;
        }
    } else {
        if ([view isKindOfClass:UIView.class]) {
            return [self getRootWindow:view.superview];
        } else {
            return nil;
        }
    }
}

@end
