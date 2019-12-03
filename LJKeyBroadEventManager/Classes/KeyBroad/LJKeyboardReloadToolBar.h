//
//  LJKeyboardReloadToolBar.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/3.
//

#import <UIKit/UIKit.h>
#import "LJKeyboardToolBar.h"
#import "LJKeyBroadRespoderModel.h"

@interface LJKeyboardReloadToolBar : NSObject


- (instancetype)initWithMaster_object_keyBroad:(UIViewController*)object;


-(void)configLJKeyboardToolBar:(LJKeyBroadRespoderModel*)model andNewToolBar:(LJKeyboardToolBar*)bar AndResponderArray:(NSArray*)responderArray;


-(void)reloadLJKeyboardToolBarAndResponderModel:(LJKeyBroadRespoderModel*)model AndResponderArray:(NSArray*)responderArray;


@end

