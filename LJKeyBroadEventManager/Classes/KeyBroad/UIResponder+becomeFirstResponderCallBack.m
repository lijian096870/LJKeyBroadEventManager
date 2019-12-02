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

static canBecomeFirstResponderCallBackBlock canBecomeFirstResponder = nil;

static __weak UIResponder *lj_currentFirstResponder;
static __weak UIResponder *lj_currentBecomeFirstResponderIng;

@implementation UIResponder (becomeFirstResponderCallBack)


+(UIResponder*)lj_currentBecomeFirstResponderIng{
    
    return lj_currentBecomeFirstResponderIng;
}

+ (UIResponder *)lj_currentFirstResponder{
    
    lj_currentFirstResponder = nil;
    
    [[UIApplication sharedApplication] sendAction:@selector(LJ_findFirstResponder:)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
    
    
    return lj_currentFirstResponder;
}
- (void)LJ_findFirstResponder:(id)sender {
    
    lj_currentFirstResponder = self;
}



+(void)configCanBecomeFirstResponderCallBackBlock:(canBecomeFirstResponderCallBackBlock)block{
    
    [UIResponder becomeFirstResponderCallBackMethodExchange];
    
    canBecomeFirstResponder = block;
    
}

+(void)configbecomeFirstResponderCallBackBlock:(becomeFirstResponderCallBackBlock)block{
    
    [UIResponder becomeFirstResponderCallBackMethodExchange];
    
    if(becomeFirstResponderCallBackBlockArray==nil){
        becomeFirstResponderCallBackBlockArray = [NSMutableArray array];
    }
    if(block){
        [becomeFirstResponderCallBackBlockArray addObject:block];
    }
    
    
    
}
+(void)configresignFirstResponderCallBackBlock:(resignFirstResponderCallBackBlock)block{
    
    [UIResponder becomeFirstResponderCallBackMethodExchange];
    
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
                
                NSLog(@"ttttttttttt,%d:%@",(self.keyBroad_FirstResponder_info.isFirstResponder),self);
                
                if(self.keyBroad_FirstResponder_info.isFirstResponder){
                    
                    lj_currentBecomeFirstResponderIng = self;
                    BOOL result = [self Customer_becomeFirstResponder];
                    lj_currentBecomeFirstResponderIng = nil;
                    return result;
                    
                }else{
                    
                    
                    
                    BOOL canBeFirst = YES;
                    for (becomeFirstResponderCallBackBlock block in becomeFirstResponderCallBackBlockArray) {
                        canBeFirst = block((UIView*)self) && canBeFirst;
                    }
                    
                    if(canBeFirst){
                        
                        self.keyBroad_FirstResponder_info.isFirstResponder = true;
                        
                        lj_currentBecomeFirstResponderIng = self;
                        BOOL result = [self Customer_becomeFirstResponder];
                        lj_currentBecomeFirstResponderIng = nil;
                        
                        return result;
                    }else{
                        return false;
                    }
                }
                
            }else{
                
                return false;
            }
            
        }else{
            
            if(self.keyBroad_FirstResponder_info.isFirstResponder){
                
                lj_currentBecomeFirstResponderIng = self;
                BOOL result = [self Customer_becomeFirstResponder];
                lj_currentBecomeFirstResponderIng = nil;
                return result;
                
            }else{
                

                BOOL canBeFirst = YES;
                for (becomeFirstResponderCallBackBlock block in becomeFirstResponderCallBackBlockArray) {
                    canBeFirst = block((UIView*)self) && canBeFirst;
                }
                if(canBeFirst){
                    
                    self.keyBroad_FirstResponder_info.isFirstResponder = true;
                    
                    lj_currentBecomeFirstResponderIng = self;
                    BOOL result = [self Customer_becomeFirstResponder];
                    lj_currentBecomeFirstResponderIng = nil;
                    return result;
                }else{
                    return false;
                }
                
            }
        }
    }else{
        
        return [self Customer_becomeFirstResponder];
    }
    
}

- (BOOL)Customer_resignFirstResponder{
    
    if([self isKindOfClass:[UITextView class]]||[self isKindOfClass: UITextField.class]){
        
        if(self.keyBroad_FirstResponder_info.isFirstResponder){
            self.keyBroad_FirstResponder_info.isFirstResponder = false;
            for (resignFirstResponderCallBackBlock block in resignFirstResponderCallBackBlockArray) {
                block((UIView*)self);
            }
        }
    }
    
    return [self Customer_resignFirstResponder];
}


- (FirstResponderModel *)keyBroad_FirstResponder_info
{
    FirstResponderModel* obj = objc_getAssociatedObject(self, @selector(keyBroad_FirstResponder_info));
    if([obj isKindOfClass:[FirstResponderModel class]]){
        return obj;
    }else{
        FirstResponderModel *mess=[[FirstResponderModel alloc]init];
        objc_setAssociatedObject(self, @selector(keyBroad_FirstResponder_info), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return mess;
    }
}



@end
