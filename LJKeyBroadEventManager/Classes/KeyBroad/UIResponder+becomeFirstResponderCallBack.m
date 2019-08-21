//
//  UIResponder+becomeFirstResponderCallBack.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/8/20.
//

#import "UIResponder+becomeFirstResponderCallBack.h"
#import <objc/runtime.h>
#import "FirstResponderModel.h"

static NSMutableArray *becomeFirstResponderCallBackBlockArray;
static NSMutableArray *resignFirstResponderCallBackBlockArray;

static canBecomeFirstResponderCallBackBlock canBecomeFirstResponder;

@implementation UIResponder (becomeFirstResponderCallBack)

+(void)configCanBecomeFirstResponderCallBackBlock:(canBecomeFirstResponderCallBackBlock)block{
    
    canBecomeFirstResponder = block;
    
}

+(void)configbecomeFirstResponderCallBackBlock:(becomeFirstResponderCallBackBlock)block{
    
    if(becomeFirstResponderCallBackBlockArray==nil){
        becomeFirstResponderCallBackBlockArray = [NSMutableArray array];
    }
    if(block){
        [becomeFirstResponderCallBackBlockArray addObject:block];
    }
    
    
    
}
+(void)configresignFirstResponderCallBackBlock:(becomeFirstResponderCallBackBlock)block{
    if(resignFirstResponderCallBackBlockArray == nil){
        resignFirstResponderCallBackBlockArray = [NSMutableArray array];
    }
    
    if(block){
        [resignFirstResponderCallBackBlockArray addObject:block];
    }
    
}
+(void)becomeFirstResponderCallBackMethodExchange{
    
    
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            SEL sel=sel_registerName("becomeFirstResponder");
            
            SEL NewSel=sel_registerName("Customer_becomeFirstResponder");
            
            Method originalMethod = class_getInstanceMethod(UIResponder.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UIResponder.class, NewSel);
            
            method_exchangeImplementations(originalMethod, swizzlingMethod);
            
        });
    }
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            SEL sel=sel_registerName("resignFirstResponder");
            
            SEL NewSel=sel_registerName("Customer_resignFirstResponder");
            
            Method originalMethod = class_getInstanceMethod(UIResponder.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UIResponder.class, NewSel);
            
            method_exchangeImplementations(originalMethod, swizzlingMethod);
            
        });
    }
    
}

- (BOOL)Customer_becomeFirstResponder{
    
    
    if([self isKindOfClass:[UITextView class]]||[self isKindOfClass:[UITextField class]]){
        if(canBecomeFirstResponder){
            if(canBecomeFirstResponder((UIView*)self)){
                
                if(self.keyBroad_FirstResponder_info.isFirstResponder){
                    
                }else{
                    self.keyBroad_FirstResponder_info.isFirstResponder = true;
                    for (becomeFirstResponderCallBackBlock block in becomeFirstResponderCallBackBlockArray) {
                        block((UIView*)self);
                    }
                }
                
                return [self Customer_becomeFirstResponder];
            }else{
                return true;
            }
            
        }else{
            
            if(self.keyBroad_FirstResponder_info.isFirstResponder){
                
            }else{
                self.keyBroad_FirstResponder_info.isFirstResponder = true;
                for (becomeFirstResponderCallBackBlock block in becomeFirstResponderCallBackBlockArray) {
                    block((UIView*)self);
                }
            }
            
            return [self Customer_becomeFirstResponder];
        }
    }else{
        return [self Customer_becomeFirstResponder];
    }
    
    
 
    
}

- (BOOL)Customer_resignFirstResponder{
    
    if([self isKindOfClass:[UITextView class]]||[self isKindOfClass: UITextField.class]){
        if(self.keyBroad_FirstResponder_info.isFirstResponder){
            self.keyBroad_FirstResponder_info.isFirstResponder = false;
            for (becomeFirstResponderCallBackBlock block in resignFirstResponderCallBackBlockArray) {
                block((UIView*)self);
            }
        }
    }
    
  
    
    return [self Customer_resignFirstResponder];
}


- (FirstResponderModel *)keyBroad_FirstResponder_info
{
    FirstResponderModel* obj=objc_getAssociatedObject(self, @selector(keyBroad_FirstResponder_info));
    if([obj isKindOfClass:[FirstResponderModel class]]){
        return obj;
    }else{
        FirstResponderModel *mess=[[FirstResponderModel alloc]init];
        objc_setAssociatedObject(self, @selector(keyBroad_FirstResponder_info), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return mess;
    }
}




@end
