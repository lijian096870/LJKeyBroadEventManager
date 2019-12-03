//
//  LJKeyBroadNotificationManager.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//

#import "LJKeyBroadNotificationManager.h"
#import "UIResponder+becomeFirstResponderCallBack.h"
#import "NSNotificationCenter+LJKeyBroad.h"
#import "KeyBroadRandString.h"
@interface LJKeyBroadNotificationManager()


@property(nonatomic,strong)NSMutableDictionary *keyBroadNotificationBlockDictionary;

@property(nonatomic,strong)NSString *randStringID;

@end

@implementation LJKeyBroadNotificationManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addlister];
        
    }
    return self;
}

-(void)addlister{
    
//      __weak LJKeyBroadNotificationManager *weakself = self;
//
//    [NSNotificationCenter registerNotificationAfterBlock:^(NSNotificationName aName, id anObject, NSDictionary *aUserInfo) {
//
//        if([weakself isKindOfClass:LJKeyBroadNotificationManager.class]){
//
//            [weakself keyboardDidShow:aUserInfo];
//
//        }
//
//    } AndName:UIKeyboardDidShowNotification anyKey:self.randStringID];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillChange:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
    
}
-(void)keyboardDidShow:(NSDictionary*)aUserInfo{
        
    UIView *view = (UIView *)[UIResponder lj_currentFirstResponder];
    if([view isKindOfClass:UITextField.class]||[view isKindOfClass:UITextView.class]){
        
        for (NSString *Key in self.keyBroadNotificationBlockDictionary.allKeys) {
            if([Key isEqualToString:UIKeyboardWillShowNotification]){
                
                NSArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:Key];
                
                for (NSString *NotKey in aUserInfo.allKeys) {
                    if([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]){
                        
                        NSValue *aValue = [aUserInfo objectForKey:NotKey];
                        CGRect keyboardRect = [aValue CGRectValue];
                        CGFloat height = keyboardRect.size.height;
                        
                        for (KeyBroadNotificationBlock block in array) {
                            if(block){
                                block(view,height);
                            }
                        }
                        break;
                    }
                }
                
            }
        }
    }
    
    
}
-(void)keyboardWillChange:(NSNotification*)not{
    
    NSDictionary *aUserInfo = not.userInfo;
    
    UIView *view = (UIView *)[UIResponder lj_currentFirstResponder];
    
    if([view isKindOfClass:UITextField.class]||[view isKindOfClass:UITextView.class]){
        
        for (NSString *Key in self.keyBroadNotificationBlockDictionary.allKeys) {
            if([Key isEqualToString:UIKeyboardWillChangeFrameNotification]){
                
                NSArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:Key];
                
                for (NSString *NotKey in aUserInfo.allKeys) {
                    if([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]){
                        
                        NSValue *aValue = [aUserInfo objectForKey:NotKey];
                        CGRect keyboardRect = [aValue CGRectValue];
                        CGFloat height = keyboardRect.size.height;
                        
                        for (KeyBroadNotificationBlock block in array) {
                            if(block){
                                block(view,height);
                            }
                        }
                        break;
                    }
                }
                
            }
        }
        
    }
}

-(void)keyboardWillHide:(NSNotification*)not{
    
    UIView *view = (UIView *)[UIResponder lj_currentFirstResponder];
    
    if([view isKindOfClass:UITextField.class]||[view isKindOfClass:UITextView.class]){
        
        [self keyboardWillHideView:view];
        
    }else{
        UIView *view = (UIView *)[UIResponder lj_currentBecomeFirstResponderIng];
        
        if([view isKindOfClass:UITextField.class]||[view isKindOfClass:UITextView.class]){
            
            [self keyboardWillHideView:view];
            
        }
    }
}

-(void)keyboardWillHideView:(UIView*)view{
    
    if([view isKindOfClass:UITextField.class]||[view isKindOfClass:UITextView.class]){
        
        for (NSString *Key in self.keyBroadNotificationBlockDictionary.allKeys) {
            if([Key isEqualToString:UIKeyboardWillHideNotification]){
                
                NSArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:Key];
                
                for (KeyBroadNotificationBlock block in array) {
                    if(block){
                        block(view,0.0);
                    }
                }
                
            }
        }
    }
    
}
-(void)keyboardWillShow:(NSNotification*)not{
    
    NSDictionary *aUserInfo = not.userInfo;
    
    UIView *view = (UIView *)[UIResponder lj_currentFirstResponder];
    if([view isKindOfClass:UITextField.class]||[view isKindOfClass:UITextView.class]){
        
        for (NSString *Key in self.keyBroadNotificationBlockDictionary.allKeys) {
            if([Key isEqualToString:UIKeyboardWillShowNotification]){
                
                NSArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:Key];
                
                for (NSString *NotKey in aUserInfo.allKeys) {
                    if([NotKey isEqualToString:UIKeyboardFrameEndUserInfoKey]){
                        
                        NSValue *aValue = [aUserInfo objectForKey:NotKey];
                        CGRect keyboardRect = [aValue CGRectValue];
                        CGFloat height = keyboardRect.size.height;
                        
                        for (KeyBroadNotificationBlock block in array) {
                            if(block){
                                block(view,height);
                            }
                        }
                        break;
                    }
                }
                
            }
        }
    }
    
    
}

-(void)addKeyBroadNotificationShowBlock:(KeyBroadNotificationBlock)block{
    
    if(block){
        
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardWillShowNotification];
    }
    
}

-(void)addKeyBroadNotificationFrameChangeBlock:(KeyBroadNotificationBlock)block{
    
    if(block){
        
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardWillChangeFrameNotification];
        
    }
    
}

-(void)addKeyBroadNotificationHideBlock:(KeyBroadNotificationBlock)block{
    
    if(block){
        
        [self addKeyBroadNotificationBlock:block AndNotName:UIKeyboardWillHideNotification];
        
    }
}

-(void)addKeyBroadNotificationBlock:(id)block AndNotName:(NSString*)Name{
    
    if(block){
        
        for (NSString *key in self.keyBroadNotificationBlockDictionary.allKeys) {
            if([key isEqualToString:Name]){
                NSMutableArray *array = [self.keyBroadNotificationBlockDictionary objectForKey:key];
                [array addObject:block];
                return;
            }
        }
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:block];
        [self.keyBroadNotificationBlockDictionary setObject:array forKey:Name];
    }
    
    
}

-(NSMutableDictionary*)keyBroadNotificationBlockDictionary{
    
    if(_keyBroadNotificationBlockDictionary==nil){
        _keyBroadNotificationBlockDictionary = [NSMutableDictionary dictionary];
    }
    
    return _keyBroadNotificationBlockDictionary;
}

-(NSString*)randStringID{
    
    if(_randStringID==nil){
        _randStringID = [KeyBroadRandString randomStringNameWithLength:32];
    }
    return _randStringID;
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [NSNotificationCenter removeNotificationAftereName:UIKeyboardDidShowNotification anyKey:self.randStringID];
}
@end
