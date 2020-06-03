//
//  LJKeyBroadAccessView.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/6/3.
//

#import <UIKit/UIKit.h>

@interface LJKeyBroadAccessView : UIView

- (instancetype)initWithResponder:(UIView *)responder;

- (void)addAccessView:(UIView *)view;
- (UIView *)currentAccessView;

@end
