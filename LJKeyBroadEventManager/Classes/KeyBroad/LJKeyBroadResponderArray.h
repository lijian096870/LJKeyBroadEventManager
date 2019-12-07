//
//  LJKeyBroadResponderArray.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/1.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadRespoderModel.h"

@interface LJKeyBroadResponderArray : NSObject

+ (void)loopSubView:(NSMutableArray *)array and:(UIView *)view andWindow:(UIView *)window AndDontMove:(UIView *)DonMoveView;

+ (void)responderArrayRenewResponderLocation:(NSMutableArray *)responderArray AndDontMove:(LJKeyBroadRespoderModel *)model andRootView:(UIView *)rootView;

+ (BOOL)LocationJudegSuitView:(UIView *)view andWindow:(UIView *)window andRootView:(UIView *)rootView AndisStrict:(BOOL)strict;


+ (LJKeyBroadRespoderModel *)CanLeftArrowButton:(LJKeyBroadRespoderModel *)currentModel AndResponderArray:(NSArray *)array AndViewController:(UIViewController *)viewController;

+ (LJKeyBroadRespoderModel *)CanRightArrowButton:(LJKeyBroadRespoderModel *)currentModel AndResponderArray:(NSArray *)array AndViewController:(UIViewController *)viewController;

@end
