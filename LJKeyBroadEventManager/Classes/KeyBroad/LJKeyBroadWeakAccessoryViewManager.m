//
//  LJKeyBroadWeakAccessoryViewManager.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/29.
//

#import "LJKeyBroadWeakAccessoryViewManager.h"
#import "LJKeyBroadWeakAccessoryViewModel.h"
#import "LJViewKit.h"
#import "LJKeyboardReloadToolBar.h"
#import <objc/runtime.h>

NSString *const accessoryViewSuperViewName = @"UIInputSetHostView";

@interface LJKeyBroadWeakAccessoryViewManager ()

@property(nonatomic, strong) NSMutableArray <LJKeyBroadWeakAccessoryViewModel *> *accessoryViewArray;

@end

@implementation LJKeyBroadWeakAccessoryViewManager

- (UIView *)currentKeyBroadAccessoryView {
    for (int i = 0; i < self.accessoryViewArray.count; i++) {
        LJKeyBroadWeakAccessoryViewModel *model = [self.accessoryViewArray objectAtIndex:i];

        if ([model.accessoryView isKindOfClass:UIView.class]) {
            if ([model.accessoryView.superview isKindOfClass:UIView.class] && [accessoryViewSuperViewName isEqualToString:NSStringFromClass(model.accessoryView.superview.class)]) {
                return model.accessoryView;
            }
        }
    }

    return nil;
}

- (void)popView:(UIView *)newInputAccessoryView {
    if ([newInputAccessoryView isKindOfClass:UIView.class]) {
        AddWindowDidAddKeyBlock(newInputAccessoryView, @"_LJKeyboardReloadToolBar_InputAccessoryView", ^(UIView *view) {
            AddWindowDidAddKeyBlock(view, @"_LJKeyboardReloadToolBar_InputAccessoryView", ^(UIView *view) {});

            if ([accessoryViewSuperViewName isEqualToString:NSStringFromClass(view.superview.class)]) {
                [[LJKeyBroadWeakAccessoryViewManager sharedInstance] addObject:view];

                AddWindowDidMoveKeyBlock(view, @"_LJKeyboardReloadToolBar_InputAccessoryView", ^(UIView *view) {
                    AddWindowDidMoveKeyBlock(view, @"_LJKeyboardReloadToolBar_InputAccessoryView", ^(UIView *view) {});
                    [[LJKeyBroadWeakAccessoryViewManager sharedInstance] removeObject:view];
                });
            }
        });
    }
}

- (void)addObject:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        LJKeyBroadWeakAccessoryViewModel *model = [[LJKeyBroadWeakAccessoryViewModel alloc]init];
        model.accessoryView = view;
        [self.accessoryViewArray addObject:model];
    }
}

- (void)removeObject:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        for (int i = 0; i < self.accessoryViewArray.count; i++) {
            LJKeyBroadWeakAccessoryViewModel *model = [self.accessoryViewArray objectAtIndex:i];

            if ([model.accessoryView isKindOfClass:UIView.class]) {
                if (model.accessoryView == view) {
                    [self.accessoryViewArray removeObjectAtIndex:i];
                    [self removeObject:view];
                    return;
                }
            } else {
                [self.accessoryViewArray removeObjectAtIndex:i];
                [self removeObject:view];
                return;
            }
        }
    }
}

- (NSMutableArray <LJKeyBroadWeakAccessoryViewModel *> *)accessoryViewArray {
    if (_accessoryViewArray == nil) {
        _accessoryViewArray = [NSMutableArray <LJKeyBroadWeakAccessoryViewModel *> array];
    }

    return _accessoryViewArray;
}

static id _instace;
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [super allocWithZone:zone];
    });
    return _instace;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

+ (instancetype)new
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instace;
}

@end
