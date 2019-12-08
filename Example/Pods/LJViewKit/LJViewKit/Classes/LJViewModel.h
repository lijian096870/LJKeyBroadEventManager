//
//  UIView+LJView.h
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJViewKit.h"

typedef NS_ENUM(NSInteger, LJViewModelStyle) {
    LJViewModelNone,
    LJViewModelAdd,
    LJViewModelMove,
};


@interface LJViewModel : NSObject


@property(nonatomic,assign)LJViewModelStyle style;

@property(nonatomic, copy) viewFrameChangeBlock willChangeBlock;
@property(nonatomic, strong) NSMutableArray     *willChangeArray;

@property(nonatomic, copy) viewFrameChangeBlock didChangeBlock;
@property(nonatomic, strong) NSMutableArray     *didChangeArray;

@property(nonatomic, copy) viewWindowChangeBlock    willMoveBlock;
@property(nonatomic, strong) NSMutableArray         *willMoveArray;

@property(nonatomic, copy) viewWindowChangeBlock    didMoveBlock;
@property(nonatomic, strong) NSMutableArray         *didMoveArray;

@property(nonatomic, copy) viewWindowChangeBlock    willAddBlock;
@property(nonatomic, strong) NSMutableArray         *willAddArray;

@property(nonatomic, copy) viewWindowChangeBlock    didAddBlock;
@property(nonatomic, strong) NSMutableArray         *didAddArray;

- (void)SetFrameWillChangeBlock:(viewFrameChangeBlock)block;
- (void)AddFrameWillChangeBlock:(viewFrameChangeBlock)block;

- (void)SetFrameDidChangeBlock:(viewFrameChangeBlock)block;
- (void)AddFrameDidChangeBlock:(viewFrameChangeBlock)block;

- (void)SetWindowWillMoveBlock:(viewWindowChangeBlock)block;
- (void)AddWindowWillMoveBlock:(viewWindowChangeBlock)block;

- (void)SetWindowDidMoveBlock:(viewWindowChangeBlock)block;
- (void)AddWindowDidMoveBlock:(viewWindowChangeBlock)block;

- (void)SetWindowWillAddBlock:(viewWindowChangeBlock)block;
- (void)AddWindowWillAddBlock:(viewWindowChangeBlock)block;

- (void)SetWindowDidAddBlock:(viewWindowChangeBlock)block;
- (void)AddWindowDidAddBlock:(viewWindowChangeBlock)block;

- (instancetype)initWithView:(UIView *)view AndWindow:(UIWindow *)window;

@end
