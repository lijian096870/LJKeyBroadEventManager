//
//  LJKeyBroadInputViewShowManager.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/6/5.
//

#import "LJKeyBroadInputViewShowManager.h"
#import "LJViewControllerManager.h"
#import "LJViewKit.h"
#import "UIView+LJKeyBroadInputAccessoryViewRelateResponderView.h"

NSString *const accessoryViewSuperViewName = @"UIInputSetHostView";
NSString *const accessoryViewSuperViewInputWindowController = @"UIInputWindowController";

@implementation LJKeyBroadInputViewShowManager

+ (void)initialize
{
    if (self == [self class]) {
        [[LJKeyBroadInputViewShowManager sharedInstance] configInputLister];
    }
}

+ (void)load {
    [[LJKeyBroadInputViewShowManager sharedInstance] configInputLister];
}

- (void)configInputLister {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        addViewControllerLoadViewBlock(^(UIViewController *viewController) {
            if ([accessoryViewSuperViewInputWindowController isEqualToString:NSStringFromClass(viewController.class)]) {
                AddViewAddSubViewKeyBlock(viewController.view, @"_LJKeyBroadInputViewShowManager", ^(UIView *view, UIView *subView) {
                    if ([accessoryViewSuperViewName isEqualToString:NSStringFromClass(subView.class)]) {
                        AddFrameDidChangeKeyBlock(subView, @"_LJKeyBroadInputViewShowManager", ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
                            if ([accessoryViewSuperViewName isEqualToString:NSStringFromClass(view.class)]) {
                                if ([view.window isKindOfClass:UIWindow.class] && ([[LJKeyBroadInputViewShowManager sharedInstance] findAccessoryView:view].count > 0)) {
                                    [[LJKeyBroadInputViewShowManager sharedInstance] InputViewChange:view OldFrame:oldFrame NewFrame:newFrame];
                                }
                            }
                        });
                    }
                });
            }
        });
    });
}

- (void)InputViewChange:(UIView *)inputView OldFrame:(CGRect)oldFrame NewFrame:(CGRect)newFrame {
    
    NSLog(@"%@",NSStringFromCGRect(inputView.window.bounds));
    
    NSLog(@"%@,%@,%@", inputView.class, NSStringFromCGRect(oldFrame), NSStringFromCGRect(newFrame));
    
    
    
}

- (NSArray *)findAccessoryView:(UIView *)view {
    NSMutableArray *array = [NSMutableArray array];

    [self findAccessoryView:view array:array];
    return array;
}

- (void)findAccessoryView:(UIView *)view array:(NSMutableArray *)array {
    if ([view isKindOfClass:UIView.class]) {
        if ([view customer_Responder_AccessoryView_relateInputView_value]) {
            [array addObject:view];
        }

        for (UIView *subView in [view subviews]) {
            [self findAccessoryView:subView array:array];
        }
    }
}

static id _instace;
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [super allocWithZone:zone];
    });
    return _instace;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

+ (instancetype)new
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instace;
}

@end
