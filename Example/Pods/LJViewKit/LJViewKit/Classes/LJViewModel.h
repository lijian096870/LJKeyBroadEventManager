//
//  UIView+LJView.h
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJViewKit.h"

@interface LJViewModel : NSObject


@property(nonatomic, copy) viewAddSubView       addSubViewBlock;
@property(nonatomic, strong, readonly) NSArray  *_viewAddSubViewArray;

@property(nonatomic, copy) viewRemoveView       WillremoveViewBlock;
@property(nonatomic, strong, readonly) NSArray  *_viewWillRemoveViewArray;

@property(nonatomic, copy) viewRemoveView       DidremoveViewBlock;
@property(nonatomic, strong, readonly) NSArray  *_viewDidRemoveViewArray;

@property(nonatomic, copy) viewBeAddSubView       WilladdSubViewBlock;
@property(nonatomic, strong, readonly) NSArray  *_viewWillAddSubViewArray;

@property(nonatomic, copy) viewBeAddSubView       DidaddSubViewBlock;
@property(nonatomic, strong, readonly) NSArray  *_viewDidAddSubViewArray;

@property(nonatomic, copy) viewSuperFrameChangeBlock    superWillChangeBlock;
@property(nonatomic, strong, readonly) NSArray          *_superWillChangeArray;

@property(nonatomic, copy) viewSuperFrameChangeBlock    superDidChangeBlock;
@property(nonatomic, strong, readonly) NSArray          *_superDidChangeArray;

@property(nonatomic, copy) viewFrameChangeBlock willChangeBlock;
@property(nonatomic, strong, readonly) NSArray  *_willChangeArray;

@property(nonatomic, copy) viewFrameChangeBlock didChangeBlock;
@property(nonatomic, strong, readonly) NSArray  *_didChangeArray;

@property(nonatomic, copy) viewWindowChangeBlock    willMoveBlock;
@property(nonatomic, strong, readonly) NSArray      *_willMoveArray;

@property(nonatomic, copy) viewWindowChangeBlock    didMoveBlock;
@property(nonatomic, strong, readonly) NSArray      *_didMoveArray;

@property(nonatomic, copy) viewWindowChangeBlock    willAddBlock;
@property(nonatomic, strong, readonly) NSArray      *_willAddArray;

@property(nonatomic, copy) viewWindowChangeBlock    didAddBlock;
@property(nonatomic, strong, readonly) NSArray      *_didAddArray;

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

- (void)AddWindowDidAddKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString *)key;
- (void)AddWindowDidMoveKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString *)key;
- (void)AddWindowWillAddKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString *)key;
- (void)AddWindowWillMoveKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString *)key;
- (void)AddFrameDidChangeKeyBlock:(viewFrameChangeBlock)block AndKey:(NSString *)key;
- (void)AddFrameWillChangeKeyBlock:(viewFrameChangeBlock)block AndKey:(NSString *)key;

- (void)SetSuperViewFrameWillChangeBlock:(viewSuperFrameChangeBlock)block;
- (void)AddSuperViewFrameWillChangeBlock:(viewSuperFrameChangeBlock)block;
- (void)AddSuperViewFrameWillChangeKeyBlock:(viewSuperFrameChangeBlock)block AndKey:(NSString *)key;
- (void)SetSuperViewFrameDidChangeBlock:(viewSuperFrameChangeBlock)block;
- (void)AddSuperViewFrameDidChangeBlock:(viewSuperFrameChangeBlock)block;
- (void)AddSuperViewFrameDidChangeKeyBlock:(viewSuperFrameChangeBlock)block AndKey:(NSString *)key;

- (void)SetViewDidAddSubViewBlock:(viewBeAddSubView)block;
- (void)AddViewDidAddSubViewBlock:(viewBeAddSubView)block;
- (void)AddViewDidAddSubViewKeyBlock:(viewBeAddSubView)block AndKey:(NSString *)key;

- (void)SetViewWillAddSubViewBlock:(viewBeAddSubView)block;
- (void)AddViewWillAddSubViewBlock:(viewBeAddSubView)block;
- (void)AddViewWillAddSubViewKeyBlock:(viewBeAddSubView)block AndKey:(NSString *)key;

- (void)SetViewDidRemoveBlock:(viewRemoveView)block;
- (void)AddViewDidRemoveBlock:(viewRemoveView)block;
- (void)AddViewDidRemoveKeyBlock:(viewRemoveView)block AndKey:(NSString *)key;


- (void)SetViewWillRemoveBlock:(viewRemoveView)block;
- (void)AddViewWillRemoveBlock:(viewRemoveView)block;
- (void)AddViewWillRemoveKeyBlock:(viewRemoveView)block AndKey:(NSString *)key;


- (void)SetViewAddSubViewBlock:(viewAddSubView)block;
- (void)AddViewAddSubViewBlock:(viewAddSubView)block;
- (void)AddViewAddSubViewKeyBlock:(viewAddSubView)block AndKey:(NSString *)key;

- (instancetype)initWithView:(UIView *)view;

@end
