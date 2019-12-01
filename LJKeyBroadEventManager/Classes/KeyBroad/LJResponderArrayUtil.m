//
//  LJResponderArrayUtil.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/9/2.
//

#import "LJResponderArrayUtil.h"

@implementation LJResponderArrayUtil


+(void)sortArray:(NSMutableArray*)array{
    
    [array sortUsingComparator:^NSComparisonResult(LJKeyBroadRespoderModel  *obj1, LJKeyBroadRespoderModel  *obj2) {
        
        if(obj1.responderLocation.origin.y>obj2.responderLocation.origin.y){
            
            return NSOrderedDescending;
            
        }else if(obj1.responderLocation.origin.y<obj2.responderLocation.origin.y){
            
            return NSOrderedAscending;
            
            
        }else if(obj1.responderLocation.origin.x>obj2.responderLocation.origin.x){
            
            return NSOrderedDescending;
            
        }else if(obj1.responderLocation.origin.y<obj2.responderLocation.origin.y){
            return NSOrderedAscending;
        }else{
            return NSOrderedSame;
        }
        
    }];
    
}
+(void)confidDistanceInfo:(NSArray*)array andWindow:(UIView*)window{
    
    LJKeyBroadRespoderModel *model = nil;
    
    for (int i = 0; i<array.count; i++) {
        
        LJKeyBroadRespoderModel *current = [array objectAtIndex:i];
        
        if([model isKindOfClass:LJKeyBroadRespoderModel.class]){
            
            CGFloat dis = [self dis:current.view and:model.view and:window];
            model.nextDis = dis;
            current.aheadDis = dis;
            
        }
        model = current;
    }
    
}
+(BOOL)confimDisCorrect:(LJKeyBroadRespoderModel*)ahead andNext:(LJKeyBroadRespoderModel*)Next and:(UIView*)window{
    
    CGFloat dis = [self dis:ahead.view and:Next.view and:window];
    
    if(ahead.nextDis == dis && Next.aheadDis == dis){
        return YES;
    }else{
        return NO;
    }
    
    
    
}
+(CGFloat)dis:(UIView*)view1 and:(UIView*)view2 and:(UIView*)window{
    
    
    CGRect loaction1 = [view1 convertRect:view1.bounds toView:window];
    CGRect loaction2 = [view2 convertRect:view2.bounds toView:window];
    
    
    return fabs(loaction1.origin.y-loaction2.origin.y);
    
}


@end
