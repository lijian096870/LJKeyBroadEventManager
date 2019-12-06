//
//  LJkeyBroadConfig.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJkeyBroadConfig.h"

@interface LJkeyBroadConfig ()

#pragma mark - readwrite

@property (nonatomic, strong) NSNumber *topSpacingToFirstResponder_temp;

@property (nonatomic, strong) NSNumber *showExtensionToolBar_temp;

@end

@implementation LJkeyBroadConfig

- (BOOL)showExtensionToolBar {
    return [self.showExtensionToolBar_temp boolValue];
}

- (BOOL)isShowExtensionToolBar {
    return [self.showExtensionToolBar_temp boolValue];
}

- (NSNumber *)showExtensionToolBar_temp {
    if (_showExtensionToolBar_temp == nil) {
        _showExtensionToolBar_temp = [NSNumber numberWithBool:false];
    }

    return _showExtensionToolBar_temp;
}

- (void)setShowExtensionToolBar:(BOOL)showExtensionToolBar {
    self.showExtensionToolBar_temp = [NSNumber numberWithBool:showExtensionToolBar];
}

- (NSNumber *)topSpacingToFirstResponder_temp {
    if (_topSpacingToFirstResponder_temp == nil) {
        _topSpacingToFirstResponder_temp = [NSNumber numberWithFloat:0.0];
    }

    return _topSpacingToFirstResponder_temp;
}

- (void)setTopSpacingToFirstResponder:(CGFloat)topSpacingToFirstResponder {
    self.topSpacingToFirstResponder_temp = [NSNumber numberWithFloat:topSpacingToFirstResponder];
}

- (CGFloat)topSpacingToFirstResponder {
    return [self.topSpacingToFirstResponder_temp floatValue];
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
