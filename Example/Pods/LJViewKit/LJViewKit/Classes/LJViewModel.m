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

@property(nonatomic, strong) NSMutableDictionary    *willChangeDictionary;
@property(nonatomic, strong) NSMutableDictionary    *didChangeDictionary;
@property(nonatomic, strong) NSMutableDictionary    *willAddDictionary;
@property(nonatomic, strong) NSMutableDictionary    *didAddDictionary;
@property(nonatomic, strong) NSMutableDictionary    *willMoveDictionary;
@property(nonatomic, strong) NSMutableDictionary    *didMoveDictionary;

@property(nonatomic, strong) NSMutableDictionary    *superWillChangeDictionary;
@property(nonatomic, strong) NSMutableDictionary    *superDidChangeDictionary;

@property(nonatomic, strong) NSMutableArray *willChangeArray;
@property(nonatomic, strong) NSMutableArray *didChangeArray;
@property(nonatomic, strong) NSMutableArray *willMoveArray;
@property(nonatomic, strong) NSMutableArray *didMoveArray;
@property(nonatomic, strong) NSMutableArray *willAddArray;
@property(nonatomic, strong) NSMutableArray *didAddArray;

@property(nonatomic, strong) NSMutableArray *superWillChangeArray;
@property(nonatomic, strong) NSMutableArray *superDidChangeArray;

@property(nonatomic, strong) NSMutableArray         *DidAddSubViewArray;
@property(nonatomic, strong) NSMutableDictionary    *DidAddSubViewDictionary;

@property(nonatomic, strong) NSMutableArray         *WillAddSubViewArray;
@property(nonatomic, strong) NSMutableDictionary    *WillAddSubViewDictionary;

@property(nonatomic, strong) NSMutableArray         *DidRemoveViewArray;
@property(nonatomic, strong) NSMutableDictionary    *DidRemoveViewDictionary;

@property(nonatomic, strong) NSMutableArray         *WillRemoveViewArray;
@property(nonatomic, strong) NSMutableDictionary    *WillRemoveViewDictionary;

@property(nonatomic, strong) NSMutableArray         *AddSubViewArray;
@property(nonatomic, strong) NSMutableDictionary    *AddSubViewDictionary;

@end

@implementation LJViewModel

- (void)SetViewAddSubViewBlock:(viewAddSubView)block {
    self.addSubViewBlock = block;
}

- (void)AddViewAddSubViewBlock:(viewAddSubView)block {
    if (block) {
        [self.AddSubViewArray addObject:block];
    }
}

- (void)AddViewAddSubViewKeyBlock:(viewAddSubView)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.AddSubViewDictionary setObject:block forKey:key];
        }
    } else {
        [self AddViewAddSubViewBlock:block];
    }
}

- (void)SetViewWillAddSubViewBlock:(viewBeAddSubView)block {
    if (block) {
        self.WillremoveViewBlock = block;
    }
}

- (void)AddViewWillAddSubViewBlock:(viewBeAddSubView)block {
    if (block) {
        [self.WillAddSubViewArray addObject:block];
    }
}

- (void)AddViewWillAddSubViewKeyBlock:(viewBeAddSubView)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.WillAddSubViewDictionary setObject:block forKey:key];
        }
    } else {
        [self AddViewWillAddSubViewBlock:block];
    }
}

- (void)SetViewDidAddSubViewBlock:(viewBeAddSubView)block {
    self.DidaddSubViewBlock = block;
}

- (void)AddViewDidAddSubViewBlock:(viewBeAddSubView)block {
    if (block) {
        [self.DidAddSubViewArray addObject:block];
    }
}

- (void)AddViewDidAddSubViewKeyBlock:(viewBeAddSubView)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.DidAddSubViewDictionary setObject:block forKey:key];
        }
    } else {
        [self AddViewDidAddSubViewBlock:block];
    }
}

- (void)SetViewDidRemoveBlock:(viewRemoveView)block {
    if (block) {
        self.DidremoveViewBlock = block;
    }
}

- (void)AddViewDidRemoveBlock:(viewRemoveView)block {
    if (block) {
        [self.DidRemoveViewArray addObject:block];
    }
}

- (void)AddViewDidRemoveKeyBlock:(viewRemoveView)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.DidRemoveViewDictionary setObject:block forKey:key];
        }
    } else {
        [self AddViewDidRemoveBlock:block];
    }
}

- (void)SetViewWillRemoveBlock:(viewRemoveView)block {
    if (block) {
        self.WillremoveViewBlock = block;
    }
}

- (void)AddViewWillRemoveBlock:(viewRemoveView)block {
    if (block) {
        self.WillremoveViewBlock = block;
    }
}

- (void)AddViewWillRemoveKeyBlock:(viewRemoveView)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.WillRemoveViewDictionary setObject:block forKey:key];
        }
    } else {
        [self AddViewWillRemoveBlock:block];
    }
}

- (void)SetSuperViewFrameWillChangeBlock:(viewSuperFrameChangeBlock)block {
    if (block) {
        self.superWillChangeBlock = block;
    }
}

- (void)AddSuperViewFrameWillChangeBlock:(viewSuperFrameChangeBlock)block {
    if (block) {
        [self.superWillChangeArray addObject:block];
    }
}

- (void)AddSuperViewFrameWillChangeKeyBlock:(viewSuperFrameChangeBlock)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.superWillChangeDictionary setObject:block forKey:key];
        }
    } else {
        [self AddSuperViewFrameWillChangeBlock:block];
    }
}

- (void)SetSuperViewFrameDidChangeBlock:(viewSuperFrameChangeBlock)block {
    self.superDidChangeBlock = block;
}

- (void)AddSuperViewFrameDidChangeBlock:(viewSuperFrameChangeBlock)block {
    if (block) {
        [self.superDidChangeArray addObject:block];
    }
}

- (void)AddSuperViewFrameDidChangeKeyBlock:(viewSuperFrameChangeBlock)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.superDidChangeDictionary setObject:block forKey:key];
        }
    } else {
        [self AddSuperViewFrameDidChangeBlock:block];
    }
}

- (NSArray *)_viewAddSubViewArray {
    return [self byDictionaryKey:self.AddSubViewDictionary AndArray:self.AddSubViewArray];
}

- (NSArray *)_viewWillRemoveViewArray {
    return [self byDictionaryKey:self.WillRemoveViewDictionary AndArray:self.WillRemoveViewArray];
}

- (NSArray *)_viewDidRemoveViewArray {
    return [self byDictionaryKey:self.DidRemoveViewDictionary AndArray:self.DidRemoveViewArray];
}

- (NSArray *)_viewWillAddSubViewArray {
    return [self byDictionaryKey:self.WillAddSubViewDictionary AndArray:self.WillAddSubViewArray];
}

- (NSArray *)_viewDidAddSubViewArray {
    return [self byDictionaryKey:self.DidAddSubViewDictionary AndArray:self.DidAddSubViewArray];
}

- (NSArray *)_superWillChangeArray {
    return [self byDictionaryKey:self.superWillChangeDictionary AndArray:self.superWillChangeArray];
}

- (NSArray *)_superDidChangeArray {
    return [self byDictionaryKey:self.superDidChangeDictionary AndArray:self.superDidChangeArray];
}

- (NSArray *)_willChangeArray {
    return [self byDictionaryKey:self.willChangeDictionary AndArray:self.willChangeArray];
}

- (NSArray *)_didChangeArray {
    return [self byDictionaryKey:self.didChangeDictionary AndArray:self.didChangeArray];
}

- (NSArray *)_willAddArray {
    return [self byDictionaryKey:self.willAddDictionary AndArray:self.willAddArray];
}

- (NSArray *)_didAddArray {
    return [self byDictionaryKey:self.didAddDictionary AndArray:self.didAddArray];
}

- (NSArray *)_willMoveArray {
    return [self byDictionaryKey:self.willMoveDictionary AndArray:self.willMoveArray];
}

- (NSArray *)_didMoveArray {
    return [self byDictionaryKey:self.didMoveDictionary AndArray:self.didMoveArray];
}

- (void)AddWindowDidAddKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.didAddDictionary setObject:block forKey:key];
        }
    } else {
        [self AddWindowDidAddBlock:block];
    }
}

- (void)AddWindowDidMoveKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.didMoveDictionary setObject:block forKey:key];
        }
    } else {
        [self AddWindowDidMoveBlock:block];
    }
}

- (void)AddWindowWillAddKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.willAddDictionary setObject:block forKey:key];
        }
    } else {
        [self AddWindowWillAddBlock:block];
    }
}

- (void)AddWindowWillMoveKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.willMoveDictionary setObject:block forKey:key];
        }
    } else {
        [self AddWindowWillMoveBlock:block];
    }
}

- (void)AddFrameDidChangeKeyBlock:(viewFrameChangeBlock)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.didChangeDictionary setObject:block forKey:key];
        }
    } else {
        [self AddFrameDidChangeBlock:block];
    }
}

- (void)AddFrameWillChangeKeyBlock:(viewFrameChangeBlock)block AndKey:(NSString *)key {
    if ([key isKindOfClass:NSString.class] && (key.length > 0)) {
        if (block) {
            [self.willChangeDictionary setObject:block forKey:key];
        }
    } else {
        [self AddFrameWillChangeBlock:block];
    }
}

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

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];

    if (self) {
        self.view = view;
    }

    return self;
}

- (NSMutableArray *)byDictionaryKey:(NSDictionary *)dictionary AndArray:(NSArray *)array {
    if (dictionary.count > 0) {
        NSMutableArray *keys = [NSMutableArray arrayWithArray:dictionary.allKeys];

        [keys sortUsingComparator:^NSComparisonResult (NSString *obj1, NSString *obj2) {
            if ([obj1 isKindOfClass:NSString.class] && (obj1.length > 0) && [obj2 isKindOfClass:NSString.class] && (obj2.length > 0)) {
                return [self sortUsingComparator:obj1 and:obj2];
            } else {
                return NSOrderedSame;
            }
        }];

        NSMutableArray *result = [NSMutableArray array];

        for (NSObject *key in keys) {
            [result addObject:[dictionary objectForKey:key]];
        }

        if (array.count > 0) {
            [result addObjectsFromArray:array];
        }

        return result;
    } else {
        return [NSMutableArray arrayWithArray:array];
    }
}

- (NSComparisonResult)sortUsingComparator:(NSString *)obj1 and:(NSString *)obj2 {
    double  index1 = [self getStringIndex:obj1];
    double  index2 = [self getStringIndex:obj2];

    if (index1 > index2) {
        return NSOrderedAscending;
    } else if (index1 < index2) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

- (double)getStringIndex:(NSString *)string {
    if ([string isKindOfClass:NSString.class] && (string.length > 0)) {
        NSMutableString *result = [NSMutableString string];

        for (int i = 0; i < string.length; i++) {
            char c = [string characterAtIndex:i];

            if (((c <= '9') && (c >= '0')) || (c == '.')) {
                [result appendFormat:@"%c", c];
            } else {
                break;
            }
        }

        if (result.length > 0) {
            return [result doubleValue];
        } else {
            return 0.0;
        }
    } else {
        return 0.0;
    }
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

- (NSMutableDictionary *)willChangeDictionary {
    if (_willChangeDictionary == nil) {
        _willChangeDictionary = [NSMutableDictionary dictionary];
    }

    return _willChangeDictionary;
}

- (NSMutableDictionary *)didChangeDictionary {
    if (_didChangeDictionary == nil) {
        _didChangeDictionary = [NSMutableDictionary dictionary];
    }

    return _didChangeDictionary;
}

- (NSMutableDictionary *)willAddDictionary {
    if (_willAddDictionary == nil) {
        _willAddDictionary = [NSMutableDictionary dictionary];
    }

    return _willAddDictionary;
}

- (NSMutableDictionary *)didAddDictionary {
    if (_didAddDictionary == nil) {
        _didAddDictionary = [NSMutableDictionary dictionary];
    }

    return _didAddDictionary;
}

- (NSMutableDictionary *)willMoveDictionary {
    if (_willMoveDictionary == nil) {
        _willMoveDictionary = [NSMutableDictionary dictionary];
    }

    return _willMoveDictionary;
}

- (NSMutableDictionary *)didMoveDictionary {
    if (_didMoveDictionary == nil) {
        _didMoveDictionary = [NSMutableDictionary dictionary];
    }

    return _didMoveDictionary;
}

- (NSMutableDictionary *)superDidChangeDictionary {
    if (_superDidChangeDictionary == nil) {
        _superDidChangeDictionary = [NSMutableDictionary dictionary];
    }

    return _superDidChangeDictionary;
}

- (NSMutableDictionary *)superWillChangeDictionary {
    if (_superWillChangeDictionary == nil) {
        _superWillChangeDictionary = [NSMutableDictionary dictionary];
    }

    return _superWillChangeDictionary;
}

- (NSMutableArray *)superDidChangeArray {
    if (_superDidChangeArray == nil) {
        _superDidChangeArray = [NSMutableArray array];
    }

    return _superDidChangeArray;
}

- (NSMutableArray *)superWillChangeArray {
    if (_superWillChangeArray == nil) {
        _superWillChangeArray = [NSMutableArray array];
    }

    return _superWillChangeArray;
}

- (NSMutableArray *)DidAddSubViewArray {
    if (_DidAddSubViewArray == nil) {
        _DidAddSubViewArray = [NSMutableArray array];
    }

    return _DidAddSubViewArray;
}

- (NSMutableArray *)WillAddSubViewArray {
    if (_WillAddSubViewArray == nil) {
        _WillAddSubViewArray = [NSMutableArray array];
    }

    return _WillAddSubViewArray;
}

- (NSMutableDictionary *)WillAddSubViewDictionary {
    if (_WillAddSubViewDictionary == nil) {
        _WillAddSubViewDictionary = [NSMutableDictionary dictionary];
    }

    return _WillAddSubViewDictionary;
}

- (NSMutableDictionary *)DidAddSubViewDictionary {
    if (_DidAddSubViewDictionary == nil) {
        _DidAddSubViewDictionary = [NSMutableDictionary dictionary];
    }

    return _DidAddSubViewDictionary;
}

- (NSMutableArray *)WillRemoveViewArray {
    if (_WillRemoveViewArray == nil) {
        _WillRemoveViewArray = [NSMutableArray array];
    }

    return _WillRemoveViewArray;
}

- (NSMutableDictionary *)WillRemoveViewDictionary {
    if (_WillRemoveViewDictionary == nil) {
        _WillRemoveViewDictionary = [NSMutableDictionary dictionary];
    }

    return _WillRemoveViewDictionary;
}

- (NSMutableArray *)DidRemoveViewArray {
    if (_DidRemoveViewArray == nil) {
        _DidRemoveViewArray = [NSMutableArray array];
    }

    return _DidRemoveViewArray;
}

- (NSMutableDictionary *)DidRemoveViewDictionary {
    if (_DidRemoveViewDictionary == nil) {
        _DidRemoveViewDictionary = [NSMutableDictionary dictionary];
    }

    return _DidRemoveViewDictionary;
}

- (NSMutableArray *)AddSubViewArray {
    if (_AddSubViewArray == nil) {
        _AddSubViewArray = [NSMutableArray array];
    }

    return _AddSubViewArray;
}

- (NSMutableDictionary *)AddSubViewDictionary {
    if (_AddSubViewDictionary == nil) {
        _AddSubViewDictionary = [NSMutableDictionary dictionary];
    }

    return _AddSubViewDictionary;
}

@end
