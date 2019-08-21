//
//  UIViewController+KeyBoradManager.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LJKeyBroadManager.h"

@interface UIViewController (KeyBoradManager)

- (LJKeyBroadManager *)NSObject_KeyBoradManager_info;

- (NSString *)keyBroad_mess_uniqueID;


-(CGFloat)claculateScrollerViewOffset:(CGFloat)offset;

@end


