//
//  LJViewControllerManager.m
//  LJViewController
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJViewControllerManager.h"
#import "UIView+ReateViewController.h"
#import "UIViewController+LJViewController.h"

BOOL viewIsControllerView(UIView *view){
    return view.isControllerView_viewController_info;
}


UIViewController* viewGetSuperController(UIView *view){
    
    return view.ViewController_viewController_info;
}


UIViewController* viewGetAPPCurrentController(UIWindow *window){
    if([window isKindOfClass:[UIWindow class]]){
        return [window viewGetCurrentController_viewController_info];
    }else{
        return nil;
    }
}
void addViewControllerLoadViewBlock(LJViewControllerLoadViewBlock block){
    
    [UIViewController addViewControllerLoadViewBlock:block];
    
}
