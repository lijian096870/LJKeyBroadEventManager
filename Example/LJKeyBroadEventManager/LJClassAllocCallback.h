//
//  LJClassAllocCallback.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/11/29.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^viewAllocBlock)(UIView *view);

@interface LJClassAllocCallback : NSObject

+ (instancetype)sharedInstance;

-(void)ReplaceAllocMethod:(Class)calss And:(viewAllocBlock)block;

@end


