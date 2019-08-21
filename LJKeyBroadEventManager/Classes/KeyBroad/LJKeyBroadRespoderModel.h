//
//  LJKeyBroadRespoderModel.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LJKeyBroadRespoderModel : NSObject

@property(nonatomic,assign)CGRect windowBounds;

@property(nonatomic,assign)CGRect responderLocation;


@property (nonatomic, assign)CGFloat topSpacingToFirstResponder;


@property (nonatomic, assign)BOOL showExtensionToolBar;

@property (nonatomic,assign)CGFloat ExtensionToolBarHeight;


@property(nonatomic,weak)UIView *view;

-(CGFloat)calculate:(CGFloat)keyBroadHeight;


@end


