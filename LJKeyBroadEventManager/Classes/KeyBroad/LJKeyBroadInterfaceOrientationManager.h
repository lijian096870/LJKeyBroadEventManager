//
//  LJKeyBroadInterfaceOrientationManager.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/10.
//

#import <UIKit/UIKit.h>

@interface LJKeyBroadInterfaceOrientationManager : NSObject

@property(nonatomic,assign)CGFloat cacheKeyBroadHeight;

- (instancetype)initWithMaster_object_keyBroad:(UIViewController *)object;

-(void)configWillOrientationBlock:(dispatch_block_t)willblock didOrientationBlock:(dispatch_block_t)didBlock;

@end


