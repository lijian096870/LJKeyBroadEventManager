//
//  LJKeyBroadResponderArray.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/1.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadRespoderModel.h"

@interface LJKeyBroadResponderArray : NSObject

+(void)loopSubView:(NSMutableArray*)array and:(UIView*)view andWindow:(UIView*)window AndDontMove:(UIView*)DonMoveView;


+ (LJKeyBroadRespoderModel*)CanLeftArrowButton:(LJKeyBroadRespoderModel *)currentModel AndResponderArray:(NSArray*)array andRootView:(UIView*)rootView;

+ (LJKeyBroadRespoderModel*)CanRightArrowButton:(LJKeyBroadRespoderModel *)currentModel AndResponderArray:(NSArray*)array andRootView:(UIView*)rootView;


//+(BOOL)confimDisCorrect:(LJKeyBroadRespoderModel*)ahead andNext:(LJKeyBroadRespoderModel*)Next and:(UIView*)window andRootView:(UIView*)rootView;

@end


