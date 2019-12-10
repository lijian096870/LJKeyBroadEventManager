//
//  LJKeyBroadInterfaceOrientationManager.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/10.
//

#import "LJKeyBroadInterfaceOrientationManager.h"
#import "LJViewKit.h"
@interface LJKeyBroadInterfaceOrientationManager ()

@property(nonatomic, weak) UIViewController *object_keyBroad;

@property(nonatomic, copy) dispatch_block_t willBlock;

@property(nonatomic, copy) dispatch_block_t didBlock;

@end

@implementation LJKeyBroadInterfaceOrientationManager

- (void)configWillOrientationBlock:(dispatch_block_t)willblock didOrientationBlock:(dispatch_block_t)didBlock {
    self.willBlock = willblock;
    self.didBlock = didBlock;
}

- (instancetype)initWithMaster_object_keyBroad:(UIViewController *)object
{
    self = [super init];

    if (self) {
        self.cacheKeyBroadHeight = 0.0;
        self.object_keyBroad = object;

        if (object.isViewLoaded) {
            [self configWindow:(UIWindow *)[self getSuperWindows:object.view]];
        }
    }

    return self;
}

- (void)configWindow:(UIWindow *)window {
    if ([window isKindOfClass:UIWindow.class]) {
        __weak LJKeyBroadInterfaceOrientationManager *weakSelf = self;
        AddFrameWillChangeBlock(window, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
            if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInterfaceOrientationManager.class]) {
                if (weakSelf.willBlock) {
                    weakSelf.willBlock();
                }
            }
        });

        AddFrameDidChangeBlock(window, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
            if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInterfaceOrientationManager.class]) {
                if (weakSelf.didBlock) {
                    weakSelf.didBlock();
                }
            }
        });
    }
}

- (UIView *)getSuperWindows:(UIView *)view {
    if ([view.superview isKindOfClass:[UIView class]]) {
        return [self getSuperWindows:view.superview];
    } else {
        return view;
    }
}

@end
