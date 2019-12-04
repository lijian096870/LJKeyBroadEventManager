//
//  LJKeyBroadRespoderNextSet.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/4.
//

#import "LJKeyBroadRespoderNextSet.h"
#import "LJKeyBroadResponderArray.h"
@interface LJKeyBroadRespoderNextSet ()

@property(nonatomic,strong)NSMutableArray *ResponderArray;

@property(nonatomic,strong)LJKeyBroadRespoderModel *model;

@property(nonatomic,weak)UIViewController *object_keyBroad;

@end

@implementation LJKeyBroadRespoderNextSet


- (instancetype)initWithViewController:(UIViewController*)viewController AndMustHaveView:(UIView*)mastView
{
    self = [super init];
    if (self) {
        self.object_keyBroad = viewController;
        
        if(viewController.isViewLoaded){
            [self.ResponderArray removeAllObjects];
            [LJKeyBroadResponderArray loopSubView:self.ResponderArray and:viewController.view andWindow:[self getSuperWindows:viewController.view] AndDontMove:mastView];
            self.model = [self GetResponder:self.ResponderArray and:mastView];
        }
        
    }
    return self;
}

-(void)responderArrayRenewResponderLocation{
    
    if([self isValid]&&self.object_keyBroad.isViewLoaded){
        [LJKeyBroadResponderArray responderArrayRenewResponderLocation:self.ResponderArray AndDontMove:self.model andRootView:self.object_keyBroad.view];
    }
}

-(BOOL)isCurrentView:(UIView*)view{
    
    if([view isKindOfClass:UIView.class]&&self.model.view == view){
        
        return YES;
    }else{
        return NO;
    }
    
    
}

-(BOOL)moveThisView:(UIView*)view{
    
    LJKeyBroadRespoderModel *model = [self GetResponder:self.ResponderArray and:view];
    if([model isKindOfClass:LJKeyBroadRespoderModel.class]&&[model.view isKindOfClass:UIView.class]&&model.view == view){
        self.model = model;
        return YES;
    }else{
        return NO;
    }
    
    
}

- (BOOL)isValidContain:(UIView*)view{
    
    if([self.object_keyBroad isKindOfClass:UIViewController.class] && self.object_keyBroad.isViewLoaded && self.ResponderArray.count>0 &&[self.model isKindOfClass:LJKeyBroadRespoderModel.class]&&[view isKindOfClass:UIView.class]){
        
        for (LJKeyBroadRespoderModel *model in self.ResponderArray) {
            if(model == self.model && model.view == view){
                return YES;
            }
        }
        return NO;
        
        
    }else{
        return NO;
    }
    
}

- (BOOL)isValid{
    
    if([self.object_keyBroad isKindOfClass:UIViewController.class] && self.object_keyBroad.isViewLoaded && self.ResponderArray.count>0 &&[self.model isKindOfClass:LJKeyBroadRespoderModel.class]&&[self.model.view isKindOfClass:UIView.class]){
        
        for (LJKeyBroadRespoderModel *model in self.ResponderArray) {
            if(model == self.model){
                return YES;
            }
        }
        return NO;
        
        
    }else{
        return NO;
    }
    
    
}

- (BOOL)CanLeftArrow{
    
    LJKeyBroadRespoderModel *model = [LJKeyBroadResponderArray CanLeftArrowButton:self.currentResponderModel AndResponderArray:self.ResponderArray AndViewController:self.object_keyBroad];
    
    if([model isKindOfClass:LJKeyBroadRespoderModel.class]){
        return YES;
    }else{
        return NO;
    }
}
- (BOOL)CanRightArrow{
    
    LJKeyBroadRespoderModel *model = [LJKeyBroadResponderArray CanRightArrowButton:self.currentResponderModel AndResponderArray:self.ResponderArray AndViewController:self.object_keyBroad];
    
    if([model isKindOfClass:LJKeyBroadRespoderModel.class]){
        return YES;
    }else{
        return NO;
    }
}

- (LJKeyBroadRespoderModel*)MoveLeftArrow{
    
    return [LJKeyBroadResponderArray CanLeftArrowButton:self.currentResponderModel AndResponderArray:self.ResponderArray AndViewController:self.object_keyBroad];
    
}
- (LJKeyBroadRespoderModel*)MoveRightArrow{
    
    return [LJKeyBroadResponderArray CanRightArrowButton:self.currentResponderModel AndResponderArray:self.ResponderArray AndViewController:self.object_keyBroad];
    
}


-(LJKeyBroadRespoderModel*)currentResponderModel{
    
    return self.model;
}

-(LJKeyBroadRespoderModel*)GetResponder:(NSMutableArray*)array and:(UIView*)view{
    
    if([view isKindOfClass:UIView.class]&&array.count>0){
        for (LJKeyBroadRespoderModel *temp in array) {
            if(temp.view == view){
                return temp;
            }
        }
    }
    
    
    return nil;
    
}


-(UIView*)getSuperWindows:(UIView*)view{
    
    if([view.superview isKindOfClass:[UIView class]]){
        
        return [self getSuperWindows:view.superview];
        
    }else{
        return view;
    }
}
-(NSMutableArray*)ResponderArray{
    
    if(_ResponderArray==nil){
        _ResponderArray = [NSMutableArray array];
    }
    return _ResponderArray;
    
    
}

@end
