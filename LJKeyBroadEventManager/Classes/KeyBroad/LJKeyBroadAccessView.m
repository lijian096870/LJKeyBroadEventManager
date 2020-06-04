//
//  LJKeyBroadAccessView.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/6/3.
//

#import "LJKeyBroadAccessView.h"
#import "LJViewKit.h"
#import "LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.h"
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

@property(nonatomic, weak) UIView                                                           *responder;
@property(nonatomic, strong) UIView                                                         *accessoryView;
@property(nonatomic, strong) NSNumber                                                       *numberViewStyle;
@property(nonatomic, strong) LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *model;

@end

@implementation LJKeyBroadAccessView

- (instancetype)initWithResponder:(UIView *)responder
{
    self = [super init];

    if (self) {
        self.responder = responder;
        [self.model setResponderView:responder];
    }

    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];

    if ([self.accessoryView superview] == self) {
        CGRect newLocation = CGRectMake(0, 0, frame.size.width, frame.size.height);

        if (CGRectEqualToRect(self.accessoryView.bounds, newLocation)) {} else {
            self.accessoryView.frame = newLocation;
        }
    }
}

- (void)addAccessView:(UIView *)view {
    if ([self.accessoryView isKindOfClass:UIView.class] && [view isKindOfClass:UIView.class] && (self.accessoryView == view)) {} else {
        [UIView performWithoutAnimation:^{
            [self removeAllSubViews];

            if ([view isKindOfClass:UIView.class]) {
                self.accessoryView = view;
                view.frame = CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height);
                self.frame = view.bounds;

                [self addSubview:view];

                AddFrameDidChangeKeyBlock(view, @"_LJKeyBroadAccessView", ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
                    LJKeyBroadAccessView *superView = (LJKeyBroadAccessView *)[view superview];

                    if ([superView isKindOfClass:LJKeyBroadAccessView.class]) {
                        CGRect newLocation = CGRectMake(0, 0, newFrame.size.width, newFrame.size.width);

                        if (CGRectEqualToRect(view.frame, newLocation)) {} else {
                            view.frame = CGRectMake(0, 0, newFrame.size.width, newFrame.size.width);
                            superView.frame = view.bounds;
                        }
                    }
                });
            } else {
                self.accessoryView = nil;
                self.frame = CGRectZero;
            }
        }];
    }
}

- (void)setAccessoryView:(UIView *)accessoryView {
    if ([_accessoryView isKindOfClass:UIView.class]) {
        AddFrameDidChangeKeyBlock(_accessoryView, @"_LJKeyBroadAccessView", ^(UIView *view, CGRect oldFrame, CGRect newFrame) {});
    }

    _accessoryView = accessoryView;
}

- (void)viewDidAdd {}

- (void)viewDidMove {
    UIView *responderView = self.model.responderView;

    [responderView.keyBroadInputResponderViewEventControl_view endShowEvent];
    [self.model lockCantShowStatue];
    [self.model lockCanRunHidenBlock:YES];

    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([self.model canRunHidenBlockQuery]) {
                [self.model lockCanRunHidenBlock:NO];
                UIView *responderView = self.model.responderView;

                [[LJKeyBroadRegisterManager sharedInstance] HiddenkeyBroadInputAccessoryViewRelateCallBlock:responderView];

                [responderView.keyBroadInputResponderViewEventControl_view endResponderAllEvent];
                [self.model endLister];
            }
        });
    });
}

- (void)viewWillAdd {
    UIView *responderView = self.model.responderView;

    if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
        [self setResponder:responderView];
        [self.model lockCanRunHidenBlock:NO];
        [responderView.keyBroadInputResponderViewEventControl_view beginResponderAllEvent];
        [self.model startLister];

        [[LJKeyBroadRegisterManager sharedInstance] ShowkeyBroadInputAccessoryViewRelateCallBlock:responderView];
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

- (LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *)model {
    if (_model == nil) {
        _model = [[LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel alloc]initWithKeyeBroadInputViewController:self];
    }

    return _model;
}

- (void)dealloc
{
    if ([self.accessoryView isKindOfClass:UIView.class]) {
        AddFrameDidChangeKeyBlock(self.accessoryView, @"_LJKeyBroadAccessView", ^(UIView *view, CGRect oldFrame, CGRect newFrame) {});
    }
}

@end
