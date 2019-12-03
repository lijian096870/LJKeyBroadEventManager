//
//  LJKeyboardReloadToolBar.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/12/3.
//

#import "LJKeyboardReloadToolBar.h"
#import "LJKeyBroadResponderArray.h"
#import "LJKeyBroadEventManager.h"
#import "LJkeyBroadConfig.h"

@interface UIViewController ()<LJKeyboardManagerDelegate>

@end

@interface LJKeyboardReloadToolBar ()

@property(nonatomic,weak)UIViewController *object_keyBroad;

@end

@implementation LJKeyboardReloadToolBar

- (instancetype)initWithMaster_object_keyBroad:(UIViewController*)object
{
    self = [super init];
    if (self) {
        self.object_keyBroad = object;
    }
    return self;
}

-(void)configLJKeyboardToolBar:(LJKeyBroadRespoderModel*)model andNewToolBar:(LJKeyboardToolBar*)bar AndResponderArray:(NSArray*)responderArray{
    
    
    if([self.object_keyBroad respondsToSelector:@selector(TopSpacingToFirstResponder:)]){
        model.topSpacingToFirstResponder = [self.object_keyBroad TopSpacingToFirstResponder:model.view];
    }else{
        model.topSpacingToFirstResponder = [LJkeyBroadConfig sharedInstance].topSpacingToFirstResponder;
    }
    if([self.object_keyBroad respondsToSelector:@selector(ShowExtensionToolBar:)]){
        model.showExtensionToolBar = [self.object_keyBroad ShowExtensionToolBar:model.view];
    }else{
        model.showExtensionToolBar = [LJkeyBroadConfig sharedInstance].showExtensionToolBar;
    }
    if(model.showExtensionToolBar){
        
        if([model.view isKindOfClass:[UITextField class]]){
            UITextField *textView = ((UITextField*)model.view);
            if(textView.inputAccessoryView == nil){
                
                
                textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:model AndResponderArray:responderArray];
                
                model.ExtensionToolBarHeight = 40;
            }else{
                
                if([textView.inputAccessoryView isKindOfClass:[LJKeyboardToolBar class]]){
                    
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:model AndResponderArray:responderArray];
                    model.ExtensionToolBarHeight = 40;
                    
                }else{
                    model.ExtensionToolBarHeight = textView.inputAccessoryView.bounds.size.height;
                }
            }
        }
        if([model.view isKindOfClass:[UITextView class]]){
            UITextView *textView = ((UITextView*)model.view);
            if(textView.inputAccessoryView == nil){
                
                textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:model AndResponderArray:responderArray];
                
                model.ExtensionToolBarHeight = 40;
                
            }else{
                
                if([textView.inputAccessoryView isKindOfClass:[LJKeyboardToolBar class]]){
                    
                    textView.inputAccessoryView = [self reloadLJKeyboardToolBar:bar and:model AndResponderArray:responderArray];
                    model.ExtensionToolBarHeight = 40;
                    
                }else{
                    model.ExtensionToolBarHeight = textView.inputAccessoryView.bounds.size.height;
                }
            }
        }
    }
    
}


-(void)reloadLJKeyboardToolBarAndResponderModel:(LJKeyBroadRespoderModel*)model AndResponderArray:(NSArray*)responderArray{
    
    if([model isKindOfClass:LJKeyBroadRespoderModel.class]&&[model.view isKindOfClass:UIView.class]&&[model.window isKindOfClass:UIView.class]){
        
        UIView *bar = nil;
        
        if([model.view isKindOfClass:[UITextView class]]){
            UITextView *textView = ((UITextView*)model.view);
            bar = textView.inputAccessoryView;
            
        }
        if([model.view isKindOfClass:[UITextField class]]){
            UITextField *textView = ((UITextField*)model.view);
            bar = textView.inputAccessoryView;
            
        }
        if([bar isKindOfClass:LJKeyboardToolBar.class]){
            LJKeyboardToolBar *keyBroadBar = (LJKeyboardToolBar*)bar;
            
            [self reloadLJKeyboardToolBar:keyBroadBar and:model AndResponderArray:responderArray];
            
        }
        
    }
}
-(LJKeyboardToolBar*)reloadLJKeyboardToolBar:(LJKeyboardToolBar*)bar and:(LJKeyBroadRespoderModel*)model AndResponderArray:(NSArray*)responderArray{
    
    if(self.object_keyBroad.isViewLoaded && [model isKindOfClass:LJKeyBroadRespoderModel.class]&&responderArray.count>0){
        LJKeyBroadRespoderModel *leftModel = [LJKeyBroadResponderArray CanLeftArrowButton:model AndResponderArray:responderArray andRootView:self.object_keyBroad.view AndViewController:self.object_keyBroad];
        
        if([leftModel isKindOfClass:LJKeyBroadRespoderModel.class]){
            
            bar.leftbtn.enabled = YES;
            
        }else{
            bar.leftbtn.enabled = NO;
        }
        
        LJKeyBroadRespoderModel *rightModel = [LJKeyBroadResponderArray CanRightArrowButton:model AndResponderArray:responderArray andRootView:self.object_keyBroad.view AndViewController:self.object_keyBroad];
        
        if([rightModel isKindOfClass:LJKeyBroadRespoderModel.class]){
            bar.rightbtn.enabled = YES;
        }else{
            bar.rightbtn.enabled = NO;
        }
        
    }else{
        bar.leftbtn.enabled = NO;
        bar.rightbtn.enabled = NO;
        
    }
    return bar;
}

@end
