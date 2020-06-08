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

+ (void)DidaddSuperView:(UIView *)view AndBeAddView:(UIView *)beAddView {
    if ([beAddView isKindOfClass:UIView.class] && [view isKindOfClass:UIView.class]) {
        LJViewModel *model = [beAddView viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.DidaddSubViewBlock) {
                model.DidaddSubViewBlock(beAddView, view);
            }

            for (viewBeAddSubView block in model._viewDidAddSubViewArray) {
                if (block) {
                    block(beAddView, view);
                }
            }
        }
    }
}

+ (void)WilladdSuperView:(UIView *)view AndBeAddView:(UIView *)beAddView {
    if ([beAddView isKindOfClass:UIView.class] && [view isKindOfClass:UIView.class]) {
        LJViewModel *model = [beAddView viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.WilladdSubViewBlock) {
                model.WilladdSubViewBlock(beAddView, view);
            }

            for (viewBeAddSubView block in model._viewWillAddSubViewArray) {
                if (block) {
                    block(beAddView, view);
                }
            }
        }
    }
}

+ (void)DidremovwSuperView:(UIView *)view AndBeRemoveView:(UIView *)beRemove {
    if ([beRemove isKindOfClass:UIView.class] && [view isKindOfClass:UIView.class]) {
        LJViewModel *model = [beRemove viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.DidremoveViewBlock) {
                model.DidremoveViewBlock(beRemove, view);
            }

            for (viewRemoveView block in model._viewDidRemoveViewArray) {
                if (block) {
                    block(beRemove, view);
                }
            }
        }
    }
}

+ (void)WillremovwSuperView:(UIView *)view AndBeRemoveView:(UIView *)beRemove {
    if ([beRemove isKindOfClass:UIView.class] && [view isKindOfClass:UIView.class]) {
        LJViewModel *model = [beRemove viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.WillremoveViewBlock) {
                model.WillremoveViewBlock(beRemove, view);
            }

            for (viewRemoveView block in model._viewWillRemoveViewArray) {
                if (block) {
                    block(beRemove, view);
                }
            }
        }
    }
}

+ (void)addSubView:(UIView *)view AndBeAddView:(UIView *)beAddView {
    [self runSuperView:view andArray:nil AndbeAddView:beAddView];
}

+ (void)runSuperView:(UIView *)view andArray:(NSArray *)array AndbeAddView:(UIView *)beAddView {
    NSArray *tempArray = array;

    if ([view isKindOfClass:UIView.class]) {
        LJViewModel *model = [view viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if ([tempArray isKindOfClass:NSArray.class] && (tempArray.count > 0)) {} else {
                tempArray = [self subViewArray:beAddView];
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

        [self runSuperView:view.superview andArray:tempArray AndbeAddView:beAddView];
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
