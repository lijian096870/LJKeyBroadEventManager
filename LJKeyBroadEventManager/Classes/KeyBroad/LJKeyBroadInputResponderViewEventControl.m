//
//  LJKeyBroadInputResponderViewEventControl.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadInputResponderViewEventControl.h"

@interface LJKeyBroadInputResponderViewEventControl ()

@property(nonatomic, strong) NSNumber *lockHidenEvent;

@property(nonatomic, strong) NSNumber *lockShowEvent;

@property(nonatomic, assign) NSInteger windowRotateLockIndex;

@property(nonatomic, weak) UIView *masterView;

@end

@implementation LJKeyBroadInputResponderViewEventControl

- (instancetype)initWithmasterView:(UIView *)view
{
    self = [super init];

    if (self) {
        self.masterView = view;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowWillRotate:) name:@"UIWindowWillRotateNotification" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidRotate:) name:@"UIWindowDidRotateNotification" object:nil];
    }

    return self;
}

- (void)windowWillRotate:(NSNotification *)not {
    self.windowRotateLockIndex++;
}

- (void)windowDidRotate:(NSNotification *)not {
    self.windowRotateLockIndex--;
}

- (void)beginResponderAllEvent {
    self.lockHidenEvent = [NSNumber numberWithBool:YES];
    self.lockShowEvent = [NSNumber numberWithBool:YES];
}

- (void)endResponderAllEvent {
    self.lockHidenEvent = [NSNumber numberWithBool:NO];
    self.lockShowEvent = [NSNumber numberWithBool:NO];
}

- (void)endShowEvent {
    self.lockShowEvent = [NSNumber numberWithBool:NO];
}

- (void)endHidenEvent {
    self.lockHidenEvent = [NSNumber numberWithBool:NO];
}

- (BOOL)canResponderHidenEvent {
    if (self.windowRotateLockIndex == 0) {
        return [self.lockHidenEvent boolValue];
    } else {
        return NO;
    }
}

- (BOOL)canResponderShowEvent {
    if (self.windowRotateLockIndex == 0) {
        return [self.lockShowEvent boolValue];
    } else {
        return NO;
    }
}

- (BOOL)canWindowRotateTimeHidenEvent {
    return self.windowRotateLockIndex != 0;
}

- (BOOL)canwindowRotateTimeShowEvent {
    return self.windowRotateLockIndex != 0;
}

- (NSNumber *)lockHidenEvent {
    if (_lockHidenEvent == nil) {
        _lockHidenEvent = [NSNumber numberWithBool:NO];
    }

    return _lockHidenEvent;
}

- (NSNumber *)lockShowEvent {
    if (_lockShowEvent == nil) {
        _lockShowEvent = [NSNumber numberWithBool:NO];
    }

    return _lockShowEvent;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
