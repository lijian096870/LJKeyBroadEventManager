//
//  LJKeyBroadArcReleaseResponerArrayManager.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/5.
//

#import "LJKeyBroadArcReleaseResponerArrayManager.h"
#import "NSObject+LJKeyBroadArcRelease.h"
#import "LJKeyBroadRespoderModel.h"

@interface  LJKeyBroadArcReleaseResponerArrayManagerWeakResponderModel : NSObject

@property(nonatomic,weak)LJKeyBroadRespoderModel *model;

@end

@implementation LJKeyBroadArcReleaseResponerArrayManager

-(void)configArcReleaseCallBlock:(arcReleaseCallBlock)block andArray:(NSArray*)array{
    
//    for (LJKeyBroadRespoderModel *model in array) {
//
//        LJKeyBroadArcReleaseResponerArrayManagerWeakResponderModel *weakModel = [[LJKeyBroadArcReleaseResponerArrayManagerWeakResponderModel alloc]init];
//        weakModel.model = model;
//
//        [model.view setKeyBroadArcObjectClassReleaseCallBlockValue:^{
//            if(block){
//                if([weakModel.model isKindOfClass:LJKeyBroadRespoderModel.class]){
//                    block(weakModel.model);
//                }
//            }
//
//        }];
//
//    }
    
}

@end

@implementation LJKeyBroadArcReleaseResponerArrayManagerWeakResponderModel


@end
