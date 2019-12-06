//
//  LJKeyBroadArcReleaseResponerArrayManager.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/5.
//

#import <Foundation/Foundation.h>
#import "LJKeyBroadRespoderModel.h"

typedef void (^ arcReleaseCallBlock)(LJKeyBroadRespoderModel *model);

@interface LJKeyBroadArcReleaseResponerArrayManager : NSObject

- (void)configArcReleaseCallBlock:(arcReleaseCallBlock)block andArray:(NSArray *)array;

@end
