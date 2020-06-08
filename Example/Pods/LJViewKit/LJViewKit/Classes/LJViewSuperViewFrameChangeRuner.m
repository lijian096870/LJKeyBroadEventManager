//
//  LJViewSuperViewFrameChangeRuner.m
//  FBSnapshotTestCase
//
//  Created by lijian on 2019/12/8.
//

#import "LJViewSuperViewFrameChangeRuner.h"
#import "UIView+LJView.h"
#import "LJViewModel.h"

@implementation LJViewSuperViewFrameChangeRuner

+ (void)viewWillChange:(UIView *)view AndOldFrame:(CGRect)oldframe AndNewFrame:(CGRect)NewFrame {
    [self viewWillChangeloop:view AndOldFrame:oldframe AndNewFrame:NewFrame andSuperView:view];
}

+ (void)viewWillChangeloop:(UIView *)view AndOldFrame:(CGRect)oldframe AndNewFrame:(CGRect)NewFrame andSuperView:(UIView *)superView {
    LJViewModel *model = [view viewFrameChangeMoveWindowChangeModelMayBenil];

    if ([model isKindOfClass:LJViewModel.class]) {
        if (model.superWillChangeBlock) {
            model.superWillChangeBlock(view, superView, oldframe, NewFrame);
        }

        for (viewSuperFrameChangeBlock Block in model._superWillChangeArray) {
            if (Block) {
                Block(view, superView, oldframe, NewFrame);
            }
        }
    }

    NSArray *array = [NSArray arrayWithArray:view.subviews];

    for (UIView *subView in array) {
        [self viewWillChangeloop:subView AndOldFrame:oldframe AndNewFrame:NewFrame andSuperView:superView];
    }
}

+ (void)viewDidChange:(UIView *)view AndOldFrame:(CGRect)oldframe AndNewFrame:(CGRect)NewFrame {
    [self viewDidChangeLoop:view AndOldFrame:oldframe AndNewFrame:NewFrame andSuperView:view];
}

+ (void)viewDidChangeLoop:(UIView *)view AndOldFrame:(CGRect)oldframe AndNewFrame:(CGRect)NewFrame andSuperView:(UIView *)superView {
    LJViewModel *model = [view viewFrameChangeMoveWindowChangeModelMayBenil];

    if ([model isKindOfClass:LJViewModel.class]) {
        if (model.superDidChangeBlock) {
            model.superDidChangeBlock(view, superView, oldframe, NewFrame);
        }

        for (viewSuperFrameChangeBlock Block in model._superDidChangeArray) {
            if (Block) {
                Block(view, superView, oldframe, NewFrame);
            }
        }
    }

    NSArray *array = [NSArray arrayWithArray:view.subviews];

    for (UIView *subView in array) {
        [self viewDidChangeLoop:subView AndOldFrame:oldframe AndNewFrame:NewFrame andSuperView:superView];
    }
}

+ (void)addSubView:(UIView *)view AndBeAddView:(UIView *)beAddView {
    [self runSuperView:beAddView andArray:nil AndRootView:view];
}

+ (void)runSuperView:(UIView *)view andArray:(NSArray *)array AndRootView:(UIView *)RootView {
    NSArray *tempArray = array;

    if ([view isKindOfClass:UIView.class]) {
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if ([tempArray isKindOfClass:NSArray.class] && (tempArray.count > 0)) {} else {
                tempArray = [self subViewArray:RootView];
            }

            for (UIView *addView in tempArray) {
                if ([addView isKindOfClass:UIView.class]) {
                    if (model.addSubViewBlock) {
                        model.addSubViewBlock(view, addView);
                    }

                    for (viewAddSubView block in model._viewAddSubViewArray) {
                        if (block) {
                            block(view, addView);
                        }
                    }
                }
            }
        }

        [self runSuperView:view.superview andArray:tempArray AndRootView:RootView];
    }
}

+ (NSArray *)subViewArray:(UIView *)view {
    NSMutableArray *array = [NSMutableArray array];

    [self subViewArrayLoop:array andView:view];

    return array;
}

+ (void)subViewArrayLoop:(NSMutableArray *)array andView:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        [array addObject:view];
    }

    NSArray *temp = [NSArray arrayWithArray:view.subviews];

    for (UIView *tempSubView in temp) {
        [self subViewArrayLoop:array andView:tempSubView];
    }
}

@end
