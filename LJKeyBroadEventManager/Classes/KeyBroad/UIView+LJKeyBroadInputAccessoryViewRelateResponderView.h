//
//  UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/8.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.h"
#import "LJKeyBroadInputResponderViewEventControl.h"
@interface UIView (LJKeyBroadInputAccessoryViewRelateResponderView)

- (UIView *)keyBroadInputAccessoryViewRelateResponderView_view;

- (void)setKeyBroadInputAccessoryViewRelateResponderView_view:(UIView *)view;

- (void)setKeyBroadInputAccessoryViewRelateResponderView_view_model:(LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *)model;

- (LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *)KeyBroadInputAccessoryViewRelateResponderModel_view;

- (LJKeyBroadInputResponderViewEventControl *)keyBroadInputResponderViewEventControl_view;

@end
