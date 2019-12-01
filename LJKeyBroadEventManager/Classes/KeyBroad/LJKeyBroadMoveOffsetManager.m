//
//  LJKeyBroadMoveOffsetManager.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/1.
//

#import "LJKeyBroadMoveOffsetManager.h"
#import "LJKeyBroadEventManager.h"
#import "UIViewController+KeyBoradManager.h"
@interface UIViewController ()<LJKeyboardManagerDelegate>

@end

@interface LJKeyBroadMoveOffsetManager ()

@property(nonatomic,weak)UIViewController *object_keyBroad;

@property(nonatomic,strong)NSNumber *currentNumber;

@end

@implementation LJKeyBroadMoveOffsetManager

- (instancetype)initWithMaster_object_keyBroad:(UIViewController*)object
{
    self = [super init];
    if (self) {
        self.object_keyBroad = object;
      
    }
    return self;
}
-(void)moveOffset:(CGFloat)offset Responder:(UIView*)Responder{
    
    
    if([self.currentNumber isKindOfClass:[NSNumber class]]){
        
        if([self.currentNumber floatValue] == offset){
            
        }else{
            self.currentNumber = [NSNumber numberWithFloat:offset];
            
            if([self.object_keyBroad isKindOfClass:[UIViewController class]]){
                
                
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:)]){
                    
                    [self.object_keyBroad keyBroadOffset:-offset];
                    
                }
                
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:Responder:)]){
                    
                    [self.object_keyBroad keyBroadOffset:-offset Responder:Responder];
                }
                CGFloat scrollOffsect = [self.object_keyBroad claculateScrollerViewOffset:-offset];
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadScrollOffset:Responder:)]){
                    [self.object_keyBroad keyBroadScrollOffset:-scrollOffsect Responder:Responder];
                }
                
                
            }
        }
        
    }else{
        
        if(offset == 0.0){
            
            
        }else{
            self.currentNumber = [NSNumber numberWithFloat:offset];
            if([self.object_keyBroad isKindOfClass:[UIViewController class]]){
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:)]){
                    
                    [self.object_keyBroad keyBroadOffset:-offset];
                    
                }
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadOffset:Responder:)]){
                    
                    [self.object_keyBroad keyBroadOffset:-offset Responder:Responder];
                }
                
                CGFloat scrollOffsect = [self.object_keyBroad claculateScrollerViewOffset:-offset];
                if([self.object_keyBroad respondsToSelector:@selector(keyBroadScrollOffset:Responder:)]){
                    [self.object_keyBroad keyBroadScrollOffset:-scrollOffsect Responder:Responder];
                }
                
                
            }
        }
        
    }
}
@end
