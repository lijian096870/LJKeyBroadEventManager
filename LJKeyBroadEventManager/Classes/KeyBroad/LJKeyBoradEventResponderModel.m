//
//  LJKeyBoradEventResponderModel.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/3.
//

#import "LJKeyBoradEventResponderModel.h"
#import "UIViewController+KeyBoradManager.h"
#import "LJKeyBroadRegisterManager.h"

@interface LJKeyBroadRegisterManager ()

- (BOOL)isRegister:(NSString *)key;

@end

@interface LJKeyBoradEventResponderModel ()

@property(nonatomic, weak) UIViewController *object_keyBroad;

@property(nonatomic, copy) dispatch_block_t dellocBlock;

@property(nonatomic, weak) UIView   *currentView;
@property(nonatomic, weak) UIView   *cancelView;

@end

@implementation LJKeyBoradEventResponderModel

- (instancetype)initWithMaster_object_keyBroad:(UIViewController *)object
{
    self = [super init];

    if (self) {
        self.object_keyBroad = object;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBroadDidHidenHeight) name:UIKeyboardDidHideNotification object:nil];
    }

    return self;
}

- (BOOL)ShowKeyBroad:(UIView *)view {
    if ([self.object_keyBroad isViewLoaded] && [self.object_keyBroad isKindOfClass:UIViewController.class]) {
        if ([view isKindOfClass:UITextView.class] || [view isKindOfClass:UITextField.class]) {
            self.cancelView = nil;

            if ([self.currentView isKindOfClass:UIView.class]) {
                if (self.currentView == view) {
                    return YES;
                } else {
                    BOOL result = [self.object_keyBroad.NSObject_KeyBoradManager_info ShowKeyBroad:view];

                    if (result) {
                        self.currentView = view;
                    }

                    return result;
                }
            } else {
                BOOL result = [self.object_keyBroad.NSObject_KeyBoradManager_info ShowKeyBroad:view];

                if (result) {
                    self.currentView = view;
                }

                return result;
            }
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

- (void)ShowkeyBroadResult:(UIView *)view AndResult:(BOOL)result {
    if ([self.object_keyBroad isViewLoaded] && [self.object_keyBroad isKindOfClass:UIViewController.class]) {
        if ([view isKindOfClass:UITextView.class] || [view isKindOfClass:UITextField.class]) {
            if ([self.currentView isKindOfClass:UIView.class] && (self.currentView == view)) {
                self.cancelView = nil;

                [self.object_keyBroad.NSObject_KeyBoradManager_info ShowkeyBroadResult:view AndResult:result];
            }
        }
    }
}
-(void)ShowKeyBroadWillAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight{
    
    if ([self.object_keyBroad isViewLoaded] && [self.object_keyBroad isKindOfClass:UIViewController.class]) {
        if ([self.currentView isKindOfClass:UIView.class] && (self.currentView == view)) {
            self.cancelView = nil;
            [self.object_keyBroad.NSObject_KeyBoradManager_info ShowKeyBroadWillAnimation:view andkeyBroadHeight:keyBroadHeight];
        }
    }
    
    
}

- (void)ShowKeyBroadDidAnimation:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight{
    
    if ([self.object_keyBroad isViewLoaded] && [self.object_keyBroad isKindOfClass:UIViewController.class]) {
        if ([self.currentView isKindOfClass:UIView.class] && (self.currentView == view)) {
            self.cancelView = nil;
            [self.object_keyBroad.NSObject_KeyBoradManager_info ShowKeyBroadDidAnimation:view andkeyBroadHeight:keyBroadHeight];
        }
    }
    
}


- (void)keyBroadFrameChange:(UIView *)view andkeyBroadHeight:(CGFloat)keyBroadHeight {
    if ([self.object_keyBroad isViewLoaded] && [self.object_keyBroad isKindOfClass:UIViewController.class]) {
        if ([self.currentView isKindOfClass:UIView.class] && (self.currentView == view)) {
            [self.object_keyBroad.NSObject_KeyBoradManager_info keyBroadFrameChange:view andkeyBroadHeight:keyBroadHeight];
        }
    }
}

- (void)HiddenKeyBroad:(UIView *)view {
    if ([self.object_keyBroad isViewLoaded] && [self.object_keyBroad isKindOfClass:UIViewController.class]) {
        if ([self.currentView isKindOfClass:UIView.class] && (self.currentView == view)) {
            self.cancelView = view;
            self.currentView = nil;
            [self.object_keyBroad.NSObject_KeyBoradManager_info HiddenKeyBroad:view];
        }
    }
}

- (void)keyBroadDidHidenHeight {
    if ([self.object_keyBroad isViewLoaded] && [self.object_keyBroad isKindOfClass:UIViewController.class]) {
        if ([self.cancelView isKindOfClass:UIView.class]) {
            UIView *view = self.cancelView;
            self.cancelView = nil;

            if ([[LJKeyBroadRegisterManager sharedInstance] isRegister:self.object_keyBroad.keyBroad_mess_uniqueID]) {
                [self.object_keyBroad.NSObject_KeyBoradManager_info HiddenBroadAnimation:view];
            }
        }
    }
}

- (void)HiddenBroadAnimation:(UIView *)view {
    if ([self.object_keyBroad isViewLoaded] && [self.object_keyBroad isKindOfClass:UIViewController.class]&&[view isKindOfClass:UIView.class]) {
       [self.object_keyBroad.NSObject_KeyBoradManager_info HiddenBroadAnimation:view];
    }
}

- (void)ShowkeyBroadInputAccessoryViewRelateCallBlock:(UIView*)view{
    
    if ([self.object_keyBroad isViewLoaded] && [self.object_keyBroad isKindOfClass:UIViewController.class]&&[view isKindOfClass:UIView.class]) {
        
        
        if ([[LJKeyBroadRegisterManager sharedInstance] isRegister:self.object_keyBroad.keyBroad_mess_uniqueID]) {
            
            [self.object_keyBroad.NSObject_KeyBoradManager_info ShowkeyBroadInputAccessoryViewRelateCallBlock:view];
        }
    }
}

- (void)HiddenkeyBroadInputAccessoryViewRelateCallBlock:(UIView*)view{
    
    if ([self.object_keyBroad isViewLoaded] && [self.object_keyBroad isKindOfClass:UIViewController.class]&&[view isKindOfClass:UIView.class]) {
        
        if ([[LJKeyBroadRegisterManager sharedInstance] isRegister:self.object_keyBroad.keyBroad_mess_uniqueID]) {
            
            [self.object_keyBroad.NSObject_KeyBoradManager_info HiddenkeyBroadInputAccessoryViewRelateCallBlock:view];
            
            
        }
    }
}
- (void)configDestroyBlock:(dispatch_block_t)dellocBlock {
    
    self.dellocBlock = dellocBlock;
}

- (void)dealloc
{
    if (self.dellocBlock) {
        self.dellocBlock();
    }

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
