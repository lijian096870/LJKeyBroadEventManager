//
//  LJKeyBroadRegisterManager.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJKeyBroadEventManager.h"

@interface LJKeyBroadRegisterManager : NSObject

- (void)registerKeyBroadResponder:(UIViewController <LJKeyboardManagerDelegate> *)keyBroadResponder;
- (void)removeKeyBroadResponder:(UIViewController <LJKeyboardManagerDelegate> *)keyBroadResponder;

+ (instancetype)sharedInstance;

@end
