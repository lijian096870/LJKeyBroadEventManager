//
//  LJKeyBroadWeakAccessoryViewManager.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2020/5/29.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString * const accessoryViewSuperViewName;

@interface LJKeyBroadWeakAccessoryViewManager : NSObject

+ (instancetype)sharedInstance;

-(void)popView:(UIView*)newInputAccessoryView;

-(UIView *)currentKeyBroadAccessoryView;

@end
