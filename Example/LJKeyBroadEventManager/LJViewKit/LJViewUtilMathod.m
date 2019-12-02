//
//  LJViewUtilMathod.m
//  LJViewKit
//
//  Created by 李健 on 2019/1/2.
//  Copyright © 2019年 李健. All rights reserved.
//

#import "LJViewUtilMathod.h"
#import <objc/runtime.h>
@implementation LJViewUtilMathod

+ (void)SwizzlingMethod:(NSString *)systemMethodString systemClassString:(NSString *)systemClassString toSafeMethodString:(NSString *)safeMethodString targetClassString:(NSString *)targetClassString{
    
    Class  sys=NSClassFromString(systemClassString);
    Class  safe=NSClassFromString(targetClassString);
    
    SEL sysSel=NSSelectorFromString(systemMethodString);
    SEL safeSel=NSSelectorFromString(safeMethodString);
    
    if(sys&&safe){
        if([sys instancesRespondToSelector:sysSel]&&[safe instancesRespondToSelector:safeSel]){
            
            Method sysMethod = class_getInstanceMethod(sys, sysSel);
            
            Method safeMethod = class_getInstanceMethod(safe, safeSel);
            
            if(sysMethod&&safeMethod){
                method_exchangeImplementations(safeMethod,sysMethod);
            }
            
        }
    }
}
@end
