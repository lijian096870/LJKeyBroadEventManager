//
//  LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/9.
//

#import <UIKit/UIKit.h>

@interface LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel : NSObject

@property(nonatomic, strong) UIView *responderView;

@property(nonatomic, weak) UIView *weakResponderView;

- (instancetype)initWithKeyeBroadInputViewController:(UIView *)rootView;

- (void)startLister;

- (void)endLister;

@end
