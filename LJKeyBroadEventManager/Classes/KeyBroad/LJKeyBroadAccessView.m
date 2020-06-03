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

@interface LJKeyBroadAccessView ()

@property(nonatomic, weak) UIView                                                           *responder;
@property(nonatomic, strong) UIView                                                         *accessoryView;
@property(nonatomic, strong) LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *model;

@end

@implementation LJKeyBroadAccessView

- (instancetype)initWithResponder:(UIView *)responder
{
    self = [super init];

    if (self) {
        self.responder = responder;
        [self.model setResponderView:responder];
        [self addViewState];
    }

    return self;
}

- (void)addViewState {
    AddViewWillAddSubViewKeyBlock(self, @"_LJKeyboardReloadToolBar", ^(UIView *view, UIView *superView) {
        if ([view isKindOfClass:LJKeyBroadAccessView.class]) {
            LJKeyBroadAccessView *accessSuperViewView = (LJKeyBroadAccessView *)view;
            UIView *responderView = accessSuperViewView.model.responderView;

            if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
                [accessSuperViewView setResponder:responderView];
                [accessSuperViewView.model lockCanRunHidenBlock:NO];
                [responderView.keyBroadInputResponderViewEventControl_view beginResponderAllEvent];
                [accessSuperViewView.model startLister];

                [[LJKeyBroadRegisterManager sharedInstance] ShowkeyBroadInputAccessoryViewRelateCallBlock:responderView];
            }
        }
    });

    AddViewDidRemoveKeyBlock(self, @"_LJKeyboardReloadToolBar", ^(UIView *view, UIView *superView) {
        if ([view isKindOfClass:LJKeyBroadAccessView.class]) {
            LJKeyBroadAccessView *accessSuperViewView = (LJKeyBroadAccessView *)view;

            UIView *responderView = accessSuperViewView.model.responderView;
            [responderView.keyBroadInputResponderViewEventControl_view endShowEvent];
            [accessSuperViewView.model lockCantShowStatue];
            [accessSuperViewView.model lockCanRunHidenBlock:YES];

            dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if ([accessSuperViewView.model canRunHidenBlockQuery]) {
                        [accessSuperViewView.model lockCanRunHidenBlock:NO];
                        UIView *responderView = accessSuperViewView.model.responderView;

                        if ([responderView isKindOfClass:UITextField.class] || [responderView isKindOfClass:UITextView.class]) {
                            [[LJKeyBroadRegisterManager sharedInstance] HiddenkeyBroadInputAccessoryViewRelateCallBlock:responderView];
                        }

                        [responderView.keyBroadInputResponderViewEventControl_view endResponderAllEvent];
                        [accessSuperViewView.model endLister];
                    }
                });
            });
        }
    });
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
    [UIView performWithoutAnimation:^{
        [self removeAllSubViews];

        if ([view isKindOfClass:UIView.class]) {
            self.accessoryView = view;
            view.frame = CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height);
            self.frame = view.bounds;

            [self addSubview:view];
            viewAddFrameChangeBlock(view, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
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

- (void)removeAllSubViews {
    NSArray *array = [NSArray arrayWithArray:self.subviews];

    for (UIView *view in array) {
        [view removeFromSuperview];
    }
}

- (UIView *)currentAccessView {
    return self.accessoryView;
}

- (LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *)model {
    if (_model == nil) {
        _model = [[LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel alloc]initWithKeyeBroadInputViewController:self];
    }

    return _model;
}

@end
