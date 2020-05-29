//
//  LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/9.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, LJKeyBroadInputAccessoryViewState) {
    LJKeyBroadInputAccessoryViewAdd     = 0,
    LJKeyBroadInputAccessoryViewMove    = 1
};

@interface LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel : NSObject

@property(nonatomic, weak) UIView   *rootView;
@property(nonatomic, strong) UIView *responderView;

@property(nonatomic, weak) UIView *weakResponderView;

@property(nonatomic, assign, readonly) LJKeyBroadInputAccessoryViewState state;

- (void)didMove;

- (void)didAdd;

- (instancetype)initWithKeyeBroadInputViewController:(UIView *)rootView;

- (void)startLister;

- (void)lockCantShowStatue;

- (void)endLister;

- (void)lockCanRunHidenBlock:(BOOL)canRunBlock;
- (BOOL)canRunHidenBlockQuery;

@end
