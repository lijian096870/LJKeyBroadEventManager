//
//  LJKeyBroadInputResponderViewEventControl.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadInputResponderViewEventControl.h"
#import "NSNotificationCenter+LJKeyBroad.h"
#import "KeyBroadRandString.h"
@interface LJKeyBroadInputResponderViewEventControl ()

@property(nonatomic, strong) NSNumber *lockHidenEvent;

@property(nonatomic, strong) NSNumber *lockShowEvent;

@property(nonatomic, assign) NSInteger windowRotateLockIndex;

@property(nonatomic, weak) UIView *masterView;

@property(nonatomic, strong) NSString *randStringID;

@end

@implementation LJKeyBroadInputResponderViewEventControl

- (instancetype)initWithmasterView:(UIView *)view
{
    self = [super init];

    if (self) {
        self.masterView = view;

        __weak LJKeyBroadInputResponderViewEventControl *weakself = self;

        [NSNotificationCenter registerNotificationMostBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
            if (weakself && [weakself isKindOfClass:LJKeyBroadInputResponderViewEventControl.class]) {
                [weakself windowWillRotate:aUserInfo];
            }
        } AndName:@"UIWindowWillRotateNotification" anyKey:self.randStringID];

        [NSNotificationCenter registerNotificationMostAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
            if (weakself && [weakself isKindOfClass:LJKeyBroadInputResponderViewEventControl.class]) {
                [weakself windowDidRotate:aUserInfo];
            }
        } AndName:@"UIWindowDidRotateNotification" anyKey:self.randStringID];

        [NSNotificationCenter registerNotificationMostBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
            if (weakself && [weakself isKindOfClass:LJKeyBroadInputResponderViewEventControl.class]) {
                [weakself windowWillRotate:aUserInfo];
            }
        } AndName:@"UIApplication_Customer_WillRotateNotification" anyKey:self.randStringID];

        [NSNotificationCenter registerNotificationMostAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
            if (weakself && [weakself isKindOfClass:LJKeyBroadInputResponderViewEventControl.class]) {
                [weakself windowDidRotate:aUserInfo];
            }
        } AndName:@"UIApplication_Customer_DidRotateNotification" anyKey:self.randStringID];

        [NSNotificationCenter registerNotificationMostBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
            if (weakself && [weakself isKindOfClass:LJKeyBroadInputResponderViewEventControl.class]) {
                [weakself windowWillRotate:aUserInfo];
            }
        } AndName:UIDeviceOrientationDidChangeNotification anyKey:self.randStringID];

        [NSNotificationCenter registerNotificationMostAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
            if (weakself && [weakself isKindOfClass:LJKeyBroadInputResponderViewEventControl.class]) {
                [weakself windowDidRotate:aUserInfo];
            }
        } AndName:UIDeviceOrientationDidChangeNotification anyKey:self.randStringID];
    }

    return self;
}

- (void)windowWillRotate:(NSDictionary *)aUserInfo {
    self.windowRotateLockIndex++;
}

- (void)windowDidRotate:(NSDictionary *)aUserInfo {
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

- (NSString *)randStringID {
    if (_randStringID == nil) {
        _randStringID = [KeyBroadRandString randomStringNameWithLength:32];
    }

    return _randStringID;
}

- (void)dealloc
{
    [NSNotificationCenter removeNotificationMostBeforeName:@"UIWindowWillRotateNotification" anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostAftereName:@"UIWindowDidRotateNotification" anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostBeforeName:@"UIApplication_Customer_WillRotateNotification" anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostAftereName:@"UIApplication_Customer_DidRotateNotification" anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostBeforeName:UIDeviceOrientationDidChangeNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostAftereName:UIDeviceOrientationDidChangeNotification anyKey:self.randStringID];
}

@end
