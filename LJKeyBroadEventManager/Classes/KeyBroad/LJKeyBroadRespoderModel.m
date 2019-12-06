//
//  LJKeyBroadRespoderModel.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyBroadRespoderModel.h"

@interface LJKeyBroadRespoderModel ()

@property (nonatomic, strong) NSNumber *topSpacingToFirstResponder_temp;

@property (nonatomic, strong) NSNumber *showExtensionToolBar_temp;

@property (nonatomic, strong) NSNumber *ExtensionToolBarHeight_temp;

@property(nonatomic, strong) NSNumber *aheadDis_temp;

@property(nonatomic, strong) NSNumber *nextDis_temp;

@end

@implementation LJKeyBroadRespoderModel

- (CGRect)windowBounds {
    return self.window.bounds;
}

- (void)setNextDis:(CGFloat)nextDis {
    self.nextDis_temp = [NSNumber numberWithFloat:nextDis];
}

- (void)setAheadDis:(CGFloat)aheadDis {
    self.aheadDis_temp = [NSNumber numberWithFloat:aheadDis];
}

- (CGFloat)nextDis {
    return [self.nextDis_temp floatValue];
}

- (CGFloat)aheadDis {
    return [self.aheadDis_temp floatValue];
}

- (NSNumber *)nextDis_temp {
    if (_nextDis_temp == nil) {
        _nextDis_temp = [NSNumber numberWithFloat:0];
    }

    return _nextDis_temp;
}

- (NSNumber *)aheadDis_temp {
    if (_aheadDis_temp == nil) {
        _aheadDis_temp = [NSNumber numberWithFloat:0];
    }

    return _aheadDis_temp;
}

- (CGFloat)calculate:(CGFloat)keyBroadHeight {
    CGFloat windowsHeight = self.windowBounds.origin.y + self.windowBounds.size.height;

    CGFloat locationHeight = self.responderLocation.size.height + self.responderLocation.origin.y;

    CGFloat belowHeight = windowsHeight - locationHeight;

    CGFloat keyH = self.topSpacingToFirstResponder + keyBroadHeight;

    if (belowHeight > keyH) {
        return 0.0;
    } else {
        return keyH - belowHeight;
    }
}

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

- (NSNumber *)ExtensionToolBarHeight_temp {
    if (_ExtensionToolBarHeight_temp == nil) {
        _ExtensionToolBarHeight_temp = [NSNumber numberWithFloat:0.0];
    }

    return _ExtensionToolBarHeight_temp;
}

- (void)setExtensionToolBarHeight:(CGFloat)ExtensionToolBarHeight {
    self.ExtensionToolBarHeight_temp = [NSNumber numberWithFloat:ExtensionToolBarHeight];
}

- (CGFloat)ExtensionToolBarHeight {
    return [self.ExtensionToolBarHeight_temp floatValue];
}

@end
