//
//  LJViewControllerManager.h
//  LJViewController
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

//控制器
FOUNDATION_EXTERN BOOL viewIsControllerView(UIView *view);

FOUNDATION_EXTERN UIViewController* viewGetSuperController(UIView *view);

FOUNDATION_EXTERN UIViewController* viewGetAPPCurrentController(UIWindow *window);

