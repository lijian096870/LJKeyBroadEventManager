//
//  LJKeyBroadRespoderNextSet.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/4.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadRespoderModel.h"

@interface LJKeyBroadRespoderNextSet : NSObject

@property(nonatomic, strong, readonly) LJKeyBroadRespoderModel *currentResponderModel;

- (instancetype)initWithViewController:(UIViewController *)viewController AndMustHaveView:(UIView *)mastView;

@property(nonatomic, copy) dispatch_block_t reloadBarBlock;

- (void)responderArrayRenewResponderLocation;

- (BOOL)moveThisView:(UIView *)view;

- (BOOL)isCurrentView:(UIView *)view;

- (BOOL)isValid;

- (BOOL)isContain:(UIView *)view;

- (BOOL)CanLeftArrow;
- (BOOL)CanRightArrow;


- (BOOL)isCurrentBecomeFirstNecessaryMove;


- (LJKeyBroadRespoderModel *)MoveLeftArrow;
- (LJKeyBroadRespoderModel *)MoveRightArrow;

@end
