//
//  UITextView+AccessoryView.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/27.
//

#import "UIResponder+AccessoryView.h"

typedef BOOL (^     UITextViewAccessoryViewBlock)(UITextView *textView, UIView *oldView, UIView *neweView);

typedef UIView * (^ UITextViewAccessoryNewViewBlock)(UITextView *textView, UIView *view);

@interface UITextView (AccessoryView)

+ (void)InputAccessoryViewChangeCallBackMethodExchange;

- (void)configTextAccessoryViewListerBefore:(UITextViewAccessoryViewBlock)beforeBlock After:(UITextViewAccessoryViewBlock)afterBlock madeViewBlock:(UITextViewAccessoryNewViewBlock)madeViewBlock;

@end
