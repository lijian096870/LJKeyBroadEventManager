//
//  LJKeyBroadAccessView.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/6/3.
//

#import "LJKeyBroadAccessView.h"
#import "LJViewKit.h"
#import "UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h"
#import "LJKeyBroadRegisterManager.h"

@interface LJKeyBroadRegisterManager ()

- (void)ShowkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view;

- (void)HiddenkeyBroadInputAccessoryViewRelateCallBlock:(UIView *)view;

@end

typedef NS_ENUM (NSInteger, LJKeyBroadViewStyle) {
    LJKeyBroadViewNone,
    LJKeyBroadViewAdd,
    LJKeyBroadViewMove,
};

@interface LJKeyBroadAccessView ()

@property(nonatomic, weak) UIView       *responder;
@property(nonatomic, strong) UIView     *accessoryView;
@property(nonatomic, strong) NSNumber   *numberViewStyle;

@end

@implementation LJKeyBroadAccessView

- (instancetype)initWithResponder:(UIView *)responder
{
    self = [super init];

    if (self) {
        self.responder = responder;

        AddFrameDidChangeKeyBlock(self, @"_LJKeyBroadAccessView", ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
            LJKeyBroadAccessView *accessView = (LJKeyBroadAccessView *)view;

            if ([accessView isKindOfClass:LJKeyBroadAccessView.class] && [accessView.accessoryView isKindOfClass:UIView.class]) {
                CGRect newLocation = CGRectMake(0, 0, newFrame.size.width, accessView.accessoryView.bounds.size.height);

                if (CGRectEqualToRect(accessView.accessoryView.frame, newLocation)) {} else {
                    accessView.accessoryView.frame = newLocation;
                }
            }
        });
    }

    return self;
}

- (void)addAccessView:(UIView *)view {
    if ([self.accessoryView isKindOfClass:UIView.class] && [view isKindOfClass:UIView.class] && (self.accessoryView == view)) {} else {
        [UIView performWithoutAnimation:^{
            [self removeAllSubViews];

            if ([view isKindOfClass:UIView.class]) {
                self.accessoryView = view;
                view.frame = CGRectMake(0, 0, self.bounds.size.width, view.bounds.size.height);
                self.frame = view.bounds;
                [self addSubview:view];
            } else {
                self.accessoryView = nil;
                self.frame = CGRectZero;
            }
        }];
    }
}

- (void)viewWillAdd {
  
    UIView *responderView = self.responder;

    if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
        [[responderView KeyBroadInputAccessoryViewRelateResponderModel] lockCanRunHidenBlock:NO];
        [responderView.keyBroadInputResponderViewEventControl_view beginResponderAllEvent];
        [[responderView KeyBroadInputAccessoryViewRelateResponderModel] startLister];
        [[LJKeyBroadRegisterManager sharedInstance] ShowkeyBroadInputAccessoryViewRelateCallBlock:responderView];
    }
}

- (void)viewDidAdd {}

- (void)viewWillMove {}

- (void)viewDidMove {
    UIView *responderView = self.responder;

    if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
        [responderView.keyBroadInputResponderViewEventControl_view endShowEvent];
        [[responderView KeyBroadInputAccessoryViewRelateResponderModel] lockCantShowStatue];
        [[responderView KeyBroadInputAccessoryViewRelateResponderModel] lockCanRunHidenBlock:YES];

        dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if ([[responderView KeyBroadInputAccessoryViewRelateResponderModel] canRunHidenBlockQuery]) {
                    [[responderView KeyBroadInputAccessoryViewRelateResponderModel] lockCanRunHidenBlock:NO];
                    [[LJKeyBroadRegisterManager sharedInstance] HiddenkeyBroadInputAccessoryViewRelateCallBlock:responderView];
                    [responderView.keyBroadInputResponderViewEventControl_view endResponderAllEvent];
                    [[responderView KeyBroadInputAccessoryViewRelateResponderModel] endLister];
                }
            });
        });
    }
}

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

- (void)removeAllSubViews {
    NSArray *array = [NSArray arrayWithArray:self.subviews];

    for (UIView *view in array) {
        [view removeFromSuperview];
    }
}

- (UIView *)currentAccessView {
    return self.accessoryView;
}

- (NSNumber *)numberViewStyle {
    if (_numberViewStyle == nil) {
        _numberViewStyle = [NSNumber numberWithInteger:LJKeyBroadViewNone];
    }

    return _numberViewStyle;
}

@end
