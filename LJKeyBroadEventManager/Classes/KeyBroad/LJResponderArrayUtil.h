//
//  LJResponderArrayUtil.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/9/2.
//

#import <UIKit/UIKit.h>
#import "LJKeyBroadRespoderModel.h"

@interface LJResponderArrayUtil : NSObject

+(void)sortArray:(NSMutableArray*)array;


+(void)confidDistanceInfo:(NSArray*)array andWindow:(UIView*)window;


+(BOOL)confimDisCorrect:(LJKeyBroadRespoderModel*)ahead andNext:(LJKeyBroadRespoderModel*)Next and:(UIView*)window;

@end


