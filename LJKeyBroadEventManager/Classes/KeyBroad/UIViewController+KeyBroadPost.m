//
//  UIViewController+KeyBroadPost.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/9.
//  Copyright © 2019 李健. All rights reserved.
//

#import "UIViewController+KeyBroadPost.h"
#import <objc/runtime.h>
#import "LJKeyBroadMoveEventPostModel.h"
#import "LJKeyBroadMoveEventPostFindInputAccessViewUtil.h"
#import "LJKeyBroadPostRunBlockModel.h"

@interface LJKeyBroadPostRunBlockModel ()

- (void)receivePostBefore:(NSString *)aName aUserInfo:(NSDictionary *)dictionary AndResponderView:(UIView *)responder;

- (void)receivePostAfter:(NSString *)aName aUserInfo:(NSDictionary *)dictionary AndResponderView:(UIView *)responder;

@end

@implementation UIViewController (KeyBroadPost)

+ (void)change_post_keyBroadMoveEvent {
    {
        static dispatch_once_t onceToken;

        dispatch_once(&onceToken, ^{
            Class calss = NSClassFromString(@"UIInputWindowController");

            SEL sel = sel_registerName("postStartNotifications:withInfo:");

            SEL NewSel = sel_registerName("_postStartNotifications:withInfo:");

            Method originalMethod = class_getInstanceMethod(calss, sel);
            Method swizzlingMethod = class_getInstanceMethod(calss, NewSel);

            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
    {
        static dispatch_once_t onceToken;

        dispatch_once(&onceToken, ^{
            Class calss = NSClassFromString(@"UIInputWindowController");

            SEL sel = sel_registerName("postEndNotifications:withInfo:");

            SEL NewSel = sel_registerName("_postEndNotifications:withInfo:");

            Method originalMethod = class_getInstanceMethod(calss, sel);
            Method swizzlingMethod = class_getInstanceMethod(calss, NewSel);

            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
}

+ (void)KeyBroad_runPostBlockBefore:(NSDictionary *)dictionary AndPostName:(NSString *)Name {
    if (keyBroadInputViewControllerBlockTunerControlShow) {
        if ([Name isEqualToString:UIKeyboardWillShowNotification] || [Name isEqualToString:UIKeyboardWillHideNotification] || [Name isEqualToString:UIKeyboardWillChangeFrameNotification]) {
            keyBroadPostModel = [[LJKeyBroadMoveEventPostModel alloc]init];
            keyBroadPostModel.postName = Name;
            keyBroadPostModel.dictionary = dictionary;

            if ([keybroadInputFirstViewController isKindOfClass:UIViewController.class] && keybroadInputFirstViewController.isViewLoaded && (Name.length > 0) && [dictionary isKindOfClass:NSDictionary.class] && (dictionary.count > 0)) {
                UIView *responderView = [LJKeyBroadMoveEventPostFindInputAccessViewUtil findInputAccessViewController:keybroadInputFirstViewController];

                if ([responderView isKindOfClass:UIView.class]) {
                    [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostBefore:Name aUserInfo:dictionary AndResponderView:responderView];
                }
            }
        }
    }

    if (keyBroadInputViewControllerBlockTunerControlHiden) {
        if ([Name isEqualToString:UIKeyboardDidShowNotification] || [Name isEqualToString:UIKeyboardDidHideNotification] || [Name isEqualToString:UIKeyboardDidChangeFrameNotification]) {
            keyBroadPostModel = [[LJKeyBroadMoveEventPostModel alloc]init];
            keyBroadPostModel.postName = Name;
            keyBroadPostModel.dictionary = dictionary;

            if ([keybroadInputFirstViewController isKindOfClass:UIViewController.class] && keybroadInputFirstViewController.isViewLoaded && (Name.length > 0) && [dictionary isKindOfClass:NSDictionary.class] && (dictionary.count > 0)) {
                UIView *responderView = [LJKeyBroadMoveEventPostFindInputAccessViewUtil findInputAccessViewController:keybroadInputFirstViewController];

                if ([responderView isKindOfClass:UIView.class]) {
                    [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostBefore:Name aUserInfo:dictionary AndResponderView:responderView];
                }
            }
        }
    }
}

+ (void)KeyBroad_runPostBlockAfter:(NSDictionary *)dictionary AndPostName:(NSString *)Name {
    if (keyBroadInputViewControllerBlockTunerControlShow) {
        if ([Name isEqualToString:UIKeyboardWillShowNotification] || [Name isEqualToString:UIKeyboardWillHideNotification] || [Name isEqualToString:UIKeyboardWillChangeFrameNotification]) {
            keyBroadPostModel = [[LJKeyBroadMoveEventPostModel alloc]init];
            keyBroadPostModel.postName = Name;
            keyBroadPostModel.dictionary = dictionary;

            if ([keybroadInputFirstViewController isKindOfClass:UIViewController.class] && keybroadInputFirstViewController.isViewLoaded && (Name.length > 0) && [dictionary isKindOfClass:NSDictionary.class] && (dictionary.count > 0)) {
                UIView *responderView = [LJKeyBroadMoveEventPostFindInputAccessViewUtil findInputAccessViewController:keybroadInputFirstViewController];

                if ([responderView isKindOfClass:UIView.class]) {
                    [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostAfter:Name aUserInfo:dictionary AndResponderView:responderView];
                }
            }
        }
    }

    if (keyBroadInputViewControllerBlockTunerControlHiden) {
        
        if ([Name isEqualToString:UIKeyboardDidShowNotification] || [Name isEqualToString:UIKeyboardDidHideNotification] || [Name isEqualToString:UIKeyboardDidChangeFrameNotification]) {
            keyBroadPostModel = [[LJKeyBroadMoveEventPostModel alloc]init];
            keyBroadPostModel.postName = Name;
            keyBroadPostModel.dictionary = dictionary;

            if ([keybroadInputFirstViewController isKindOfClass:UIViewController.class] && keybroadInputFirstViewController.isViewLoaded && (Name.length > 0) && [dictionary isKindOfClass:NSDictionary.class] && (dictionary.count > 0)) {
                UIView *responderView = [LJKeyBroadMoveEventPostFindInputAccessViewUtil findInputAccessViewController:keybroadInputFirstViewController];

                if ([responderView isKindOfClass:UIView.class]) {
                    [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostAfter:Name aUserInfo:dictionary AndResponderView:responderView];
                }
            }
        }
    }
}

static LJKeyBroadMoveEventPostModel *keyBroadPostModel = nil;
static BOOL                         keyBroadInputViewControllerBlockTunerControlShow = NO;

static BOOL keyBroadInputViewControllerBlockTunerControlHiden = NO;

static UIViewController *keybroadInputFirstViewController = nil;
- (void)_postStartNotifications:(void *)object withInfo:(NSObject *)info {
    keyBroadInputViewControllerBlockTunerControlShow = YES;
    keybroadInputFirstViewController = self;
    [self _postStartNotifications:object withInfo:info];
    keyBroadInputViewControllerBlockTunerControlShow = NO;
    keybroadInputFirstViewController = nil;

    keyBroadPostModel = nil;
}

- (void)_postEndNotifications:(void *)object withInfo:(NSObject *)info {
    keyBroadInputViewControllerBlockTunerControlHiden = YES;
    keybroadInputFirstViewController = self;
    [self _postEndNotifications:object withInfo:info];
    keyBroadInputViewControllerBlockTunerControlHiden = NO;
    keybroadInputFirstViewController = nil;

    keyBroadPostModel = nil;
}

@end
