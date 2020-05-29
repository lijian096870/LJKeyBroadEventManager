//
//  LJKeyBroadInputAccessoryViewListerModel.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/27.
//

#import <UIKit/UIKit.h>

typedef BOOL (^     UITextInputAccessoryViewBlock)(UIView *inputView, UIView *oldView, UIView *neweView);

typedef UIView * (^ UITextInputAccessoryNewViewBlock)(UIView *inputView, UIView *view);

@interface LJKeyBroadInputAccessoryViewListerModel : NSObject

@property(nonatomic, weak) UIView   *oldInputAccessoryView;
@property(nonatomic, weak) UIView   *neWInputAccessoryView;

@property(nonatomic, copy) UITextInputAccessoryViewBlock    Beforeblock;
@property(nonatomic, copy) UITextInputAccessoryViewBlock    Afterblock;
@property(nonatomic, copy) UITextInputAccessoryNewViewBlock madeBlock;

@end
