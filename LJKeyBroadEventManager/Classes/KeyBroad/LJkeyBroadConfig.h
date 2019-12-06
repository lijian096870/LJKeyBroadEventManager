//
//  LJkeyBroadConfig.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJkeyBroadConfig : NSObject

@property (nonatomic, assign) CGFloat topSpacingToFirstResponder;

@property (nonatomic, assign) BOOL showExtensionToolBar;

+ (instancetype)sharedInstance;

@end
