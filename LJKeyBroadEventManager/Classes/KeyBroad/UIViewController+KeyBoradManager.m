//
//  UIViewController+KeyBoradManager.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "UIViewController+KeyBoradManager.h"
#import <objc/runtime.h>
#import "KeyBroadRandString.h"

@interface LJKeyBroadManager ()

- (instancetype)initWithMaster_object_keyBroad:(UIViewController*)object;

@end

@implementation UIViewController (KeyBoradManager)


- (LJKeyBroadManager *)NSObject_KeyBoradManager_info
{
    id obj=objc_getAssociatedObject(self, @selector(NSObject_KeyBoradManager_info));
    if([obj isKindOfClass:[LJKeyBroadManager class]]){
        return obj;
    }else{
        LJKeyBroadManager *mess=[[LJKeyBroadManager alloc] initWithMaster_object_keyBroad:self];
        objc_setAssociatedObject(self, @selector(NSObject_KeyBoradManager_info), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return mess;
    }
}
- (NSString *)keyBroad_mess_uniqueID
{
    NSString* obj=objc_getAssociatedObject(self, @selector(keyBroad_mess_uniqueID));
    if([obj isKindOfClass:[NSString class]]&&obj.length>0){
        return obj;
    }else{
        NSString *mess=[KeyBroadRandString randomStringNameWithLength:32];
        objc_setAssociatedObject(self, @selector(keyBroad_mess_uniqueID), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return mess;
    }
}




-(CGFloat)claculateScrollerViewOffset:(CGFloat)offset{
    
    CGFloat ahead = [self ReadrwordscrollerViewOffset];
    
    CGFloat result = offset - ahead;
    
    [self rwordscrollerViewOffset:offset];
    
    return result;
    
    
}
-(void)rwordscrollerViewOffset:(CGFloat)offset{
    objc_setAssociatedObject(self, @selector(ReadrwordscrollerViewOffset), [NSNumber numberWithFloat:offset], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
-(CGFloat)ReadrwordscrollerViewOffset{
    
    NSNumber* obj=objc_getAssociatedObject(self, @selector(ReadrwordscrollerViewOffset));
    if([obj isKindOfClass:[NSNumber class]]){
        return [obj floatValue];
    }else{
        NSNumber *mess=[NSNumber numberWithFloat:0.0];;
        objc_setAssociatedObject(self, @selector(ReadrwordscrollerViewOffset), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return [mess floatValue];
    }
}
@end
