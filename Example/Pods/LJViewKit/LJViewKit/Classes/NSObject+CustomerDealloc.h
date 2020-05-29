//
//  NSObject+CustomerDealloc.h
//  FBSnapshotTestCase
//
//  Created by temp on 2020/5/25.
//

#import <Foundation/Foundation.h>

typedef void(^customerDeallocBlock)(NSObject *object);

@interface NSObject (CustomerDealloc)

+(void)registerCustomerDeallocArrayObject:(NSObject *)object block:(customerDeallocBlock)block Key:(NSString *)key;

+(void)registerCustomerDeallocOnceObject:(NSObject *)object block:(customerDeallocBlock)block Key:(NSString *)key;

@end


