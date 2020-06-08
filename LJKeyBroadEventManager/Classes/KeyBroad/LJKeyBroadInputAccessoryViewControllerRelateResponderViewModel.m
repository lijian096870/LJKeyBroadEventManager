//
//  LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/9.
//

#import "LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.h"
#import "NSNotificationCenter+LJKeyBroad.h"
#import "KeyBroadRandString.h"
#import "LJKeyBroadPostRunBlockModel.h"

@interface LJKeyBroadPostRunBlockModel ()

- (void)receivePostBefore:(NSString *)aName aUserInfo:(NSDictionary *)dictionary AndResponderView:(UIView *)responder;

- (void)receivePostAfter:(NSString *)aName aUserInfo:(NSDictionary *)dictionary AndResponderView:(UIView *)responder;

@end

@interface LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel ()

@property(nonatomic, strong) NSString *randStringID;

@property(nonatomic, weak) UIView *rootView;

@property(nonatomic, strong) NSNumber *listerStatue;

@property(nonatomic, strong) NSNumber *lockShowNot;

@property(nonatomic, strong) NSNumber *canRunHidenBlock;

@end

@implementation LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel

- (BOOL)canRunHidenBlockQuery {
    return [self.canRunHidenBlock boolValue];
}

- (void)lockCanRunHidenBlock:(BOOL)canRunBlock {
    self.canRunHidenBlock = [NSNumber numberWithBool:canRunBlock];
}

- (void)startLister {
    self.listerStatue = [NSNumber numberWithBool:YES];
    self.lockShowNot = [NSNumber numberWithBool:YES];
}

- (void)lockCantShowStatue {
    self.lockShowNot = [NSNumber numberWithBool:NO];
}

- (void)endLister {
    self.listerStatue = [NSNumber numberWithBool:NO];
    self.lockShowNot = [NSNumber numberWithBool:NO];
}

- (instancetype)initWithKeyeBroadInputViewController:(UIView *)rootView
{
    self = [super init];

    if (self) {
        self.rootView = rootView;
        [self addLister];
    }

    return self;
}

- (void)addLister {
    __weak LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel *weakSelf = self;

    [NSNotificationCenter registerNotificationMostAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue] && [weakSelf.lockShowNot boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostAfter:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardWillShowNotification anyKey:self.randStringID];

    [NSNotificationCenter registerNotificationMostAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostAfter:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardWillHideNotification anyKey:self.randStringID];
    [NSNotificationCenter registerNotificationMostAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue] && [weakSelf.lockShowNot boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostAfter:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardWillChangeFrameNotification anyKey:self.randStringID];

    [NSNotificationCenter registerNotificationMostAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue] && [weakSelf.lockShowNot boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostAfter:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardDidShowNotification anyKey:self.randStringID];

    [NSNotificationCenter registerNotificationMostAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostAfter:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardDidHideNotification anyKey:self.randStringID];
    [NSNotificationCenter registerNotificationMostAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue] && [weakSelf.lockShowNot boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostAfter:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardDidChangeFrameNotification anyKey:self.randStringID];

    [NSNotificationCenter registerNotificationMostBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue] && [weakSelf.lockShowNot boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostBefore:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardWillShowNotification anyKey:self.randStringID];

    [NSNotificationCenter registerNotificationMostBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostBefore:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardWillHideNotification anyKey:self.randStringID];
    [NSNotificationCenter registerNotificationMostBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue] && [weakSelf.lockShowNot boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostBefore:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardWillChangeFrameNotification anyKey:self.randStringID];

    [NSNotificationCenter registerNotificationMostBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue] && [weakSelf.lockShowNot boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostBefore:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardDidShowNotification anyKey:self.randStringID];

    [NSNotificationCenter registerNotificationMostBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostBefore:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardDidHideNotification anyKey:self.randStringID];

    [NSNotificationCenter registerNotificationMostBeforeBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
        if (weakSelf && [weakSelf isKindOfClass:LJKeyBroadInputAccessoryViewControllerRelateResponderViewModel.class]) {
            if (weakSelf.responderView && [weakSelf.responderView isKindOfClass:UIView.class] && [weakSelf.rootView isKindOfClass:UIView.class] && [weakSelf.listerStatue boolValue] && [weakSelf.lockShowNot boolValue]) {
                [[LJKeyBroadPostRunBlockModel sharedInstance] receivePostBefore:aName aUserInfo:aUserInfo AndResponderView:weakSelf.responderView];
            }
        }
    } AndName:UIKeyboardDidChangeFrameNotification anyKey:self.randStringID];
}

- (NSString *)randStringID {
    if (_randStringID == nil) {
        _randStringID = [KeyBroadRandString randomStringNameWithLength:32];
    }

    return _randStringID;
}

- (NSNumber *)listerStatue {
    if (_listerStatue == nil) {
        _listerStatue = [NSNumber numberWithBool:NO];
    }

    return _listerStatue;
}

- (NSNumber *)lockShowNot {
    if (_lockShowNot == nil) {
        _lockShowNot = [NSNumber numberWithBool:NO];
    }

    return _lockShowNot;
}

- (NSNumber *)canRunHidenBlock {
    if (_canRunHidenBlock == nil) {
        _canRunHidenBlock = [NSNumber numberWithBool:NO];
    }

    return _canRunHidenBlock;
}

- (void)setResponderView:(UIView *)responderView {
    _responderView = responderView;

    if ([responderView isKindOfClass:UIView.class]) {
        self.weakResponderView = responderView;
    }
}

- (void)dealloc {
    [NSNotificationCenter removeNotificationMostBeforeName:UIKeyboardDidChangeFrameNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostBeforeName:UIKeyboardDidHideNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostBeforeName:UIKeyboardDidShowNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostBeforeName:UIKeyboardWillHideNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostBeforeName:UIKeyboardWillShowNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostBeforeName:UIKeyboardWillChangeFrameNotification anyKey:self.randStringID];

    [NSNotificationCenter removeNotificationMostAftereName:UIKeyboardDidChangeFrameNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostAftereName:UIKeyboardDidHideNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostAftereName:UIKeyboardDidShowNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostAftereName:UIKeyboardWillHideNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostAftereName:UIKeyboardWillShowNotification anyKey:self.randStringID];
    [NSNotificationCenter removeNotificationMostAftereName:UIKeyboardWillChangeFrameNotification anyKey:self.randStringID];
}

@end
