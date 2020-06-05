//
//  UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/8.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadInputResponderViewEventControl.h"
#import "LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.h"
@interface UIView (LJKeyBroadInputAccessoryViewRelateResponderView)

- (LJKeyBroadInputResponderViewEventControl *)keyBroadInputResponderViewEventControl_view;

- (LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *)KeyBroadInputAccessoryViewRelateResponderModel;


- (void)customer_Responder_AccessoryView_relateInputView_value:(BOOL)value;
- (BOOL)customer_Responder_AccessoryView_relateInputView_value;

@end
