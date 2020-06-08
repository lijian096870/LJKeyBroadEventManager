//
//  LJKeyboardAccessViewRetainResponderView.m
//  AFNetworking
//
//  Created by temp on 2019/12/10.
//

#import "LJKeyboardAccessViewRetainResponderView.h"
#import "LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.h"
#import "LJKeyBroadRegisterManager.h"
#import "UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h"
typedef NS_ENUM (NSInteger, LJKeyBroadViewStyle) {
    LJKeyBroadViewNone,
    LJKeyBroadViewAdd,
    LJKeyBroadViewMove,
};

@interface LJKeyBroadRegisterManager ()

- (void)ShowkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view;

- (void)HiddenkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view;

@end

@interface LJKeyboardAccessViewRetainResponderView ()

@property(nonatomic, strong) LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *accessResponderModel;

@property(nonatomic, strong) NSNumber *numberViewStyle;

@end

@implementation LJKeyboardAccessViewRetainResponderView

- (LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *)KeyBroadInputAccessoryViewRelateResponderModel {
    return self.accessResponderModel;
}

- (UIView *)keyBroadInputAccessoryViewRelateResponderView {
    LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *obj = [self KeyBroadInputAccessoryViewRelateResponderModel];

    UIView *result = obj.responderView;

    if ([result isKindOfClass:UIView.class]) {
        return result;
    } else {
        return obj.weakResponderView;
    }
}

- (LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *)accessResponderModel {
    if (_accessResponderModel == nil) {
        _accessResponderModel = [[LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel alloc]initWithKeyeBroadInputViewController:self];
    }

    return _accessResponderModel;
}

- (void)setKeyBroadInputAccessoryViewRelateResponderView:(UIView *)view {
    self.accessResponderModel.responderView = view;
}

- (void)configResponderView:(UIView *)view {
    if ([view isKindOfClass:UIView.class]) {
        [self setKeyBroadInputAccessoryViewRelateResponderView:view];
    }
}

- (void)viewDidAdd {}

- (void)viewDidMove {
    [self.KeyBroadInputAccessoryViewRelateResponderModel lockCantShowStatue];
    UIView *responderView = [self keyBroadInputAccessoryViewRelateResponderView];
    [responderView.keyBroadInputResponderViewEventControl_view endShowEvent];
    [self.KeyBroadInputAccessoryViewRelateResponderModel lockCanRunHidenBlock:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([self.KeyBroadInputAccessoryViewRelateResponderModel canRunHidenBlockQuery]) {
                [self.KeyBroadInputAccessoryViewRelateResponderModel lockCanRunHidenBlock:NO];
                UIView *responderView = [self keyBroadInputAccessoryViewRelateResponderView];

                if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
                    [[LJKeyBroadRegisterManager sharedInstance] HiddenkeyBroadInputAccessoryViewRelateCallBlock:responderView];
                }

                [responderView.keyBroadInputResponderViewEventControl_view endResponderAllEvent];

                [self.KeyBroadInputAccessoryViewRelateResponderModel endLister];
                [self setKeyBroadInputAccessoryViewRelateResponderView:nil];
            }
        });
    });
}

- (void)viewWillAdd {
    UIView *responderView = [self keyBroadInputAccessoryViewRelateResponderView];

    if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
        [self setKeyBroadInputAccessoryViewRelateResponderView:responderView];
        [self.KeyBroadInputAccessoryViewRelateResponderModel lockCanRunHidenBlock:NO];
        [responderView.keyBroadInputResponderViewEventControl_view beginResponderAllEvent];
        [self.KeyBroadInputAccessoryViewRelateResponderModel startLister];
        [[LJKeyBroadRegisterManager sharedInstance]ShowkeyBroadInputAccessoryViewRelateCallBlock:responderView];
    }
}

- (void)viewWillMove {}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    if ([newWindow isKindOfClass:UIView.class]) {
        self.numberViewStyle = [NSNumber numberWithInteger:LJKeyBroadViewAdd];
        [self viewWillAdd];
    } else {
        self.numberViewStyle = [NSNumber numberWithInteger:LJKeyBroadViewMove];
        [self viewWillMove];
    }

    [super willMoveToWindow:newWindow];
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    LJKeyBroadViewStyle style = [self.numberViewStyle integerValue];

    switch (style) {
        case LJKeyBroadViewAdd:
            [self viewDidAdd];
            break;

        case LJKeyBroadViewMove:
            [self viewDidMove];
            break;

        default:
            break;
    }
}

- (NSNumber *)numberViewStyle {
    if (_numberViewStyle == nil) {
        _numberViewStyle = [NSNumber numberWithInteger:LJKeyBroadViewNone];
    }

    return _numberViewStyle;
}

@end
