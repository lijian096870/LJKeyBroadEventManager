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

@property(nonatomic, strong) NSNumber *windowRotateLock;

@end

@implementation LJKeyBroadInputResponderViewEventControl

- (instancetype)init
{
    self = [super init];

    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowWillRotate) name:@"UIWindowWillRotateNotification" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidRotate) name:@"UIWindowDidRotateNotification" object:nil];
    }

    return self;
}

- (void)windowWillRotate {
    self.windowRotateLock = [NSNumber numberWithBool:YES];
}

- (void)windowDidRotate {
    self.windowRotateLock = [NSNumber numberWithBool:NO];
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
    if ([self.windowRotateLock boolValue]) {
        return NO;
    } else {
        return [self.lockHidenEvent boolValue];
    }
}

- (BOOL)canResponderShowEvent {
    return [self.lockShowEvent boolValue];
}

- (BOOL)canResponderAllEvent {
    return [self.lockHidenEvent boolValue] && [self.lockShowEvent boolValue];
}

- (BOOL)canresponderShowEvent {
    return [self.lockShowEvent boolValue];
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

- (NSNumber *)windowRotateLock {
    if (_windowRotateLock == nil) {
        _windowRotateLock = [NSNumber numberWithBool:NO];
    }

    return _windowRotateLock;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
