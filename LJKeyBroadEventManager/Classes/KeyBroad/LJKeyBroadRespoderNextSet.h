//
//  LJKeyBroadRespoderNextSet.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/4.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadRespoderModel.h"


@interface LJKeyBroadRespoderNextSet : NSObject


@property(nonatomic,strong,readonly)LJKeyBroadRespoderModel *currentResponderModel;

- (instancetype)initWithViewController:(UIViewController*)viewController AndMustHaveView:(UIView*)mastView;


-(void)responderArrayRenewResponderLocation;


-(BOOL)moveThisView:(UIView*)view;

-(BOOL)isCurrentView:(UIView*)view;

- (BOOL)isValid;

- (BOOL)isValidContain:(UIView*)view;

- (BOOL)CanLeftArrow;
- (BOOL)CanRightArrow;


- (LJKeyBroadRespoderModel*)MoveLeftArrow;
- (LJKeyBroadRespoderModel*)MoveRightArrow;

@end


