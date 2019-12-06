//
//  LJKeyboardReloadToolBar.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/3.
//

#import <UIKit/UIKit.h>
#import "LJKeyboardToolBar.h"
#import "LJKeyBroadRespoderNextSet.h"

@interface LJKeyboardReloadToolBar : NSObject

- (instancetype)initWithMaster_object_keyBroad:(UIViewController *)object;

- (void)configLJKeyboardToolBar:(LJKeyBroadRespoderNextSet *)responderNextSet andNewToolBar:(LJKeyboardToolBar *)bar;

- (void)reloadLJKeyboardToolBarAndResponderModel:(LJKeyBroadRespoderNextSet *)responderNextSet;

@end
