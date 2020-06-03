//
//  LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/9.
//

#import <UIKit/UIKit.h>

@interface LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel : NSObject

@property(nonatomic, weak) UIView *responderView;

- (instancetype)initWithKeyeBroadInputViewController:(UIView *)rootView;

- (void)startLister;

- (void)lockCantShowStatue;

- (void)endLister;

- (void)lockCanRunHidenBlock:(BOOL)canRunBlock;
- (BOOL)canRunHidenBlockQuery;

@end
