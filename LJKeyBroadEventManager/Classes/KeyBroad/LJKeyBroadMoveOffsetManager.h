//
//  LJKeyBroadMoveOffsetManager.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/1.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadRespoderNextSet.h"

typedef void (^ moveOffsetKeyBlock)(LJKeyBroadRespoderModel *model);

@interface LJKeyBroadMoveOffsetManager : NSObject

- (instancetype)initWithMaster_object_keyBroad:(UIViewController *)object;

@property(nonatomic, strong) NSNumber *windowRotateSingalValue;

@property(nonatomic, assign, readonly) CGFloat keyBroadHeight;

@property(nonatomic, assign, readonly) CGFloat moveOffset;

@property(nonatomic, copy) moveOffsetKeyBlock moveCallBlock;

- (void)customerKeyBroadChange:(LJKeyBroadRespoderNextSet *)responderNextSet;

- (void)moveOffsetKeyBroadHeight:(CGFloat)keyBroadHeight ResponderModel:(LJKeyBroadRespoderModel *)model;

- (void)endEditResponderModel:(LJKeyBroadRespoderModel *)model;

@end
