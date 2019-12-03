//
//  NSNotificationCenter+LJKeyBroad.h
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/3.
//

#import <Foundation/Foundation.h>

typedef void(^NotificationAfterBeforeBlock)(NSNotificationName aName,id anObject,NSDictionary *aUserInfo);

@interface NSNotificationCenter (LJKeyBroad)

+(void)registerNotificationBeforeBlock:(NotificationAfterBeforeBlock)block AndName:(NSString*)aName anyKey:(NSString*)deletkey;

+(void)registerNotificationAfterBlock:(NotificationAfterBeforeBlock)block AndName:(NSString*)aName anyKey:(NSString*)deletkey;


+(void)removeNotificationBeforeName:(NSNotificationName)aName anyKey:(NSString*)deletkey;

+(void)removeNotificationAftereName:(NSNotificationName)aName anyKey:(NSString*)deletkey;

@end


