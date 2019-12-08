//
//  UIView+LJView.m
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJViewModel.h"

@interface LJViewModel ()

@property(nonatomic, weak) UIView *view;

@end

@implementation LJViewModel

- (void)SetFrameWillChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        self.willChangeBlock = block;
    }
}

- (void)AddFrameWillChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
      
        [self.willChangeArray addObject:block];
    }
}

- (void)SetFrameDidChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        self.didChangeBlock = block;
    }
}

- (void)AddFrameDidChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        [self.didChangeArray addObject:block];
    }
}

- (void)SetWindowWillMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        self.willMoveBlock = block;
    }

}

- (void)AddWindowWillMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        [self.willMoveArray addObject:block];
    }

}

- (void)SetWindowDidMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        self.didMoveBlock = block;
    }

}

- (void)AddWindowDidMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        [self.didMoveArray addObject:block];
    }

}

- (void)SetWindowWillAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        self.willAddBlock = block;
    }

}

- (void)AddWindowWillAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        [self.willAddArray addObject:block];
    }

}

- (void)SetWindowDidAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        self.didAddBlock = block;
    }

}

- (void)AddWindowDidAddBlock:(viewWindowChangeBlock)block {
    if (block) {
    
        [self.didAddArray addObject:block];
    }

}

- (instancetype)initWithView:(UIView *)view AndWindow:(UIWindow *)window
{
    self = [super init];

    if (self) {
        self.view = view;
        self.style = LJViewModelNone;

    }

    return self;
}

- (NSMutableArray *)willChangeArray {
    if (_willChangeArray == nil) {
        _willChangeArray = [NSMutableArray array];
    }

    return _willChangeArray;
}

- (NSMutableArray *)didChangeArray {
    if (_didChangeArray == nil) {
        _didChangeArray = [NSMutableArray array];
    }

    return _didChangeArray;
}

- (NSMutableArray *)didMoveArray {
    if (_didMoveArray == nil) {
        _didMoveArray = [NSMutableArray array];
    }

    return _didMoveArray;
}

- (NSMutableArray *)willMoveArray {
    if (_willMoveArray == nil) {
        _willMoveArray = [NSMutableArray array];
    }

    return _willMoveArray;
}

- (NSMutableArray *)willAddArray {
    if (_willAddArray == nil) {
        _willAddArray = [NSMutableArray array];
    }

    return _willAddArray;
}

- (NSMutableArray *)didAddArray {
    if (_didAddArray == nil) {
        _didAddArray = [NSMutableArray array];
    }

    return _didAddArray;
}

@end
