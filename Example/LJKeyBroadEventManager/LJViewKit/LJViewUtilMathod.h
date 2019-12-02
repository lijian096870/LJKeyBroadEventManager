//
//  LJViewUtilMathod.h
//  LJViewKit
//
//  Created by 李健 on 2019/1/2.
//  Copyright © 2019年 李健. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJViewUtilMathod : NSObject

+ (void)SwizzlingMethod:(NSString *)systemMethodString systemClassString:(NSString *)systemClassString toSafeMethodString:(NSString *)safeMethodString targetClassString:(NSString *)targetClassString;


@end

NS_ASSUME_NONNULL_END
