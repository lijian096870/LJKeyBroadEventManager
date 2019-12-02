//
//  LJKeyBroadMoveOffsetManager.h
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/1.
//

#import <UIKit/UIKit.h>

@interface LJKeyBroadMoveOffsetManager : NSObject

- (instancetype)initWithMaster_object_keyBroad:(UIViewController*)object;


-(void)moveOffset:(CGFloat)offset Responder:(UIView*)Responder;
@end


