//
//  LJKeyBroadRespoderModel.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJKeyBroadRespoderModel : NSObject

@property(nonatomic, assign) CGFloat aheadDis;

@property(nonatomic, assign) CGFloat nextDis;

@property(nonatomic, weak) UIView   *nextView;
@property(nonatomic, weak) UIView   *aheadView;

@property(nonatomic, assign, readonly) CGRect windowBounds;

@property(nonatomic, assign) CGRect responderLocation;

@property (nonatomic, assign) CGFloat topSpacingToFirstResponder;

@property (nonatomic, assign) BOOL showExtensionToolBar;

@property (nonatomic, assign) CGFloat ExtensionToolBarHeight;

@property(nonatomic, weak) UIView   *view;
@property(nonatomic, weak) UIView   *window;

- (CGFloat)calculate:(CGFloat)keyBroadHeight;

@end
