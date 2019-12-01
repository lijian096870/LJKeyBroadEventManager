//
//  LJKeyBroadResponderArray.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/1.
//

#import <UIKit/UIKit.h>

@interface LJKeyBroadResponderArray : NSObject

+(void)loopSubView:(NSMutableArray*)array and:(UIView*)view andWindow:(UIView*)window AndDontMove:(UIView*)DonMoveView;

+ (BOOL)canBeFirstResponder:(UIView *)view;
@end


