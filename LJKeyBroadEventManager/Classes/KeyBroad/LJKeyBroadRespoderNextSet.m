//
//  LJKeyBroadRespoderNextSet.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/4.
//

#import "LJKeyBroadRespoderNextSet.h"
#import "LJKeyBroadResponderArray.h"
#import "LJKeyBroadArcReleaseResponerArrayManager.h"
@interface LJKeyBroadRespoderNextSet ()

@property(nonatomic,strong)NSMutableArray *ResponderArray;

@property(nonatomic,strong)LJKeyBroadRespoderModel *model;

@property(nonatomic,weak)UIViewController *object_keyBroad;

@property(nonatomic,strong)LJKeyBroadArcReleaseResponerArrayManager *arcReleaseManager;

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
            
            __weak LJKeyBroadRespoderNextSet *weakself = self;
            [self.arcReleaseManager configArcReleaseCallBlock:^(LJKeyBroadRespoderModel *model) {
                if(weakself && [weakself isKindOfClass:LJKeyBroadRespoderNextSet.class]){
                    [weakself releaseResponder:model];
                }

            } andArray:self.ResponderArray];
        }
        
    }
    return self;
}

-(void)releaseResponder:(LJKeyBroadRespoderModel*)model{
    
    if([model isKindOfClass:LJKeyBroadRespoderModel.class]){
        NSUInteger index = [self.ResponderArray indexOfObject:model];
        if(index>=0&&index<self.ResponderArray.count){
            if(index ==0){
                [self.ResponderArray removeObjectAtIndex:0];
                
            }else if (index == self.ResponderArray.count-1)
                
                [self.ResponderArray removeLastObject];
            
        }else{
            
            LJKeyBroadRespoderModel *aheadModel = [self.ResponderArray objectAtIndex:index-1];
            LJKeyBroadRespoderModel *NextModel = [self.ResponderArray objectAtIndex:index +1];
            
            [self.ResponderArray removeObjectAtIndex:index];
            
            if([aheadModel isKindOfClass:LJKeyBroadRespoderModel.class]&&[NextModel isKindOfClass:LJKeyBroadRespoderModel.class]){
                aheadModel.nextDis = model.nextDis + aheadModel.nextDis;
                NextModel.aheadDis = model.aheadDis + NextModel.aheadDis;
                aheadModel.nextView = NextModel.view;
                NextModel.aheadView = aheadModel.view;
                
            }
        }
    }
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
    
    LJKeyBroadRespoderModel *currentModel = self.model;
    
    LJKeyBroadRespoderModel *model = [self GetResponder:self.ResponderArray and:view];
    
    if([model isKindOfClass:LJKeyBroadRespoderModel.class]&&[model.view isKindOfClass:UIView.class]&&model.view == view){
        
        NSUInteger currentIndex = [self.ResponderArray indexOfObject:currentModel];
        NSUInteger index = [self.ResponderArray indexOfObject:model];
        
        if(currentIndex>=0&&currentIndex<self.ResponderArray.count&&index>=0&&index<self.ResponderArray.count){
            if(currentIndex>index){
                
                BOOL result = [self loopLeftLookForRespoderModel:model AndCurrentModel:currentModel And:self.ResponderArray];
                if(result){
                    self.model = model;
                }
                
                return result;
                
            }else if (currentIndex<index){
                
                BOOL result = [self loopRightLookForRespoderModel:model AndCurrentModel:currentModel And:self.ResponderArray];
                if(result){
                    self.model = model;
                }
                
                return result;
            }else{
                
                self.model = model;
                return YES;
            }
            
            
        }else{
            return NO;
        }
    }else{
        return NO;
    }
    
    
}

-(BOOL)loopLeftLookForRespoderModel:(LJKeyBroadRespoderModel*)model AndCurrentModel:(LJKeyBroadRespoderModel*)currentModel And:(NSArray*)array{
    
    LJKeyBroadRespoderModel *lookResult = [LJKeyBroadResponderArray CanLeftArrowButton:currentModel AndResponderArray:array AndViewController:self.object_keyBroad];
    if([lookResult isKindOfClass:LJKeyBroadRespoderModel.class]){
        
        if(lookResult == model){
            
            return YES;
        }else{
            
            return [self loopLeftLookForRespoderModel:model AndCurrentModel:lookResult And:array];
        }
        
    }else{
        return NO;
    }
    
}

-(BOOL)loopRightLookForRespoderModel:(LJKeyBroadRespoderModel*)model AndCurrentModel:(LJKeyBroadRespoderModel*)currentModel And:(NSArray*)array{
    
    LJKeyBroadRespoderModel *lookResult = [LJKeyBroadResponderArray CanRightArrowButton:currentModel AndResponderArray:array AndViewController:self.object_keyBroad];
    if([lookResult isKindOfClass:LJKeyBroadRespoderModel.class]){
        
        if(lookResult == model){
            
            return YES;
        }else{
            
            return [self loopRightLookForRespoderModel:model AndCurrentModel:lookResult And:array];
        }
        
    }else{
        return NO;
    }
    
}

- (BOOL)isContain:(UIView*)view{
    
    if([self.object_keyBroad isKindOfClass:UIViewController.class] && self.object_keyBroad.isViewLoaded && self.ResponderArray.count>0 &&[self.model isKindOfClass:LJKeyBroadRespoderModel.class]&&[view isKindOfClass:UIView.class]){
        
        for (LJKeyBroadRespoderModel *model in self.ResponderArray) {
            if(model.view == view){
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

-(LJKeyBroadArcReleaseResponerArrayManager*)arcReleaseManager{
    
    if(_arcReleaseManager==nil){
        _arcReleaseManager = [[LJKeyBroadArcReleaseResponerArrayManager alloc]init];
    }
    return _arcReleaseManager;
    
    
}

@end
