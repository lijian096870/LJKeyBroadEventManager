//
//  UITextField+AccessoryView.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/27.
//

#import "UIResponder+AccessoryView.h"

typedef BOOL (^     UITextFieldAccessoryViewBlock)(UITextField *textField, UIView *oldView, UIView *neweView);

typedef UIView *(^  UITextFieldNewAccessoryViewBlock)(UITextField *textField, UIView *view);

@interface UITextField (AccessoryView)

+ (void)InputAccessoryViewChangeCallBackMethodExchange;

- (void)configTextAccessoryViewListerBefore:(UITextFieldAccessoryViewBlock)beforeBlock After:(UITextFieldAccessoryViewBlock)afterBlock viewMadeBlock:(UITextFieldNewAccessoryViewBlock)madeViewBlock;


@end
