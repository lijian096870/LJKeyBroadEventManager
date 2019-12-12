//
//  LJKeyBroadMoveOffsetManager.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/1.
//

#import "LJKeyBroadMoveOffsetManager.h"
#import "LJKeyBroadEventManager.h"
#import "UIViewController+KeyBoradManager.h"
@interface UIViewController () <LJKeyboardManagerDelegate>

@end

@interface LJKeyBroadMoveOffsetManager ()

@property(nonatomic, weak) UIViewController *object_keyBroad;

@property(nonatomic, strong) NSNumber *currentNumber;

@property(nonatomic, strong) NSNumber *keyBroadHeightNumber;

@property(nonatomic, strong) NSNumber *moveOffsetNumber;

@end

@implementation LJKeyBroadMoveOffsetManager

- (instancetype)initWithMaster_object_keyBroad:(UIViewController *)object
{
    self = [super init];

    if (self) {
        self.object_keyBroad = object;
    }

    return self;
}

- (void)customerKeyBroadChange:(LJKeyBroadRespoderNextSet *)responderNextSet {
    LJKeyBroadRespoderModel *temp = responderNextSet.currentResponderModel;

    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && [self.object_keyBroad isViewLoaded] && [temp isKindOfClass:LJKeyBroadRespoderModel.class] && [temp.view isKindOfClass:UIView.class] && [responderNextSet isKindOfClass:LJKeyBroadRespoderNextSet.class] && [responderNextSet isValid] && (responderNextSet.currentResponderModel == temp) && (self.keyBroadHeight > 0.0)) {
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self moveOffsetKeyBroadHeight:self.keyBroadHeight ResponderModel:responderNextSet.currentResponderModel];
            } completion:^(BOOL finished) {}];
        }
    });
}

- (void)endEditResponderModel:(LJKeyBroadRespoderModel *)model {
    if ([model isKindOfClass:LJKeyBroadRespoderModel.class] && [model.view isKindOfClass:UIView.class]) {
        self.keyBroadHeightNumber = [NSNumber numberWithFloat:0.0];
        self.moveOffsetNumber = [NSNumber numberWithFloat:0.0];

        [self moveOffset:0.0 ResponderModel:model];
    }
}

- (void)moveOffsetKeyBroadHeight:(CGFloat)keyBroadHeight ResponderModel:(LJKeyBroadRespoderModel *)model {
    if ([model isKindOfClass:LJKeyBroadRespoderModel.class] && [model.view isKindOfClass:UIView.class]) {
        self.keyBroadHeightNumber = [NSNumber numberWithFloat:keyBroadHeight];

        [self moveOffset:[model calculate:keyBroadHeight] ResponderModel:model];
    }
}

- (void)moveOffset:(CGFloat)offset ResponderModel:(LJKeyBroadRespoderModel *)model {
    if ([self.currentNumber isKindOfClass:[NSNumber class]]) {
        if ([self.currentNumber isEqualToNumber:[NSNumber numberWithFloat:offset]]) {} else {
            self.currentNumber = [NSNumber numberWithFloat:offset];

            if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && self.object_keyBroad.isViewLoaded) {
                if ([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:)]) {
                    [self.object_keyBroad keyBroadOffset:-offset];
                }

                self.moveOffsetNumber = [NSNumber numberWithFloat:offset];

                if ([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:Responder:)]) {
                    [self.object_keyBroad keyBroadOffset:-offset Responder:model.view];
                }

                CGFloat scrollOffsect = [self.object_keyBroad claculateScrollerViewOffset:-offset];

                if ([self.object_keyBroad respondsToSelector:@selector(keyBroadScrollOffset:Responder:)]) {
                    [self.object_keyBroad keyBroadScrollOffset:-scrollOffsect Responder:model.view];
                }

                if (self.moveCallBlock) {
                    self.moveCallBlock(model);
                }
            }
        }
    } else {
        if ([[NSNumber numberWithFloat:offset] isEqualToNumber:[NSNumber numberWithFloat:0.0]]) {} else {
            self.currentNumber = [NSNumber numberWithFloat:offset];

            if ([self.object_keyBroad isKindOfClass:[UIViewController class]] && self.object_keyBroad.isViewLoaded) {
                if ([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:)]) {
                    [self.object_keyBroad keyBroadOffset:-offset];
                }

                self.moveOffsetNumber = [NSNumber numberWithFloat:offset];

                if ([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:Responder:)]) {
                    [self.object_keyBroad keyBroadOffset:-offset Responder:model.view];
                }

                CGFloat scrollOffsect = [self.object_keyBroad claculateScrollerViewOffset:-offset];

                if ([self.object_keyBroad respondsToSelector:@selector(keyBroadScrollOffset:Responder:)]) {
                    [self.object_keyBroad keyBroadScrollOffset:-scrollOffsect Responder:model.view];
                }

                if (self.moveCallBlock) {
                    self.moveCallBlock(model);
                }
            }
        }
    }
}

- (CGFloat)keyBroadHeight {
    CGFloat result = [self.keyBroadHeightNumber floatValue];

    return result;
}

- (CGFloat)moveOffset {
    return [self.moveOffsetNumber floatValue];
}

- (NSNumber *)keyBroadHeightNumber {
    if (_keyBroadHeightNumber == nil) {
        _keyBroadHeightNumber = [NSNumber numberWithFloat:0.0];
    }

    return _keyBroadHeightNumber;
}

- (NSNumber *)moveOffsetNumber {
    if (_moveOffsetNumber == nil) {
        _moveOffsetNumber = [NSNumber numberWithFloat:0.0];
    }

    return _moveOffsetNumber;
}

- (NSNumber *)windowRotateSingalValue {
    if (_windowRotateSingalValue == nil) {
        _windowRotateSingalValue = [NSNumber numberWithBool:NO];
    }

    return _windowRotateSingalValue;
}

@end
