//
//  LJViewWindowChangeRuner.h
//  FBSnapshotTestCase
//
//  Created by lijian on 2019/12/8.
//

#import <Foundation/Foundation.h>

@interface LJViewWindowChangeRuner : NSObject

+(void)willAddView:(UIView*)superView andSubView:(UIView*)subView;

+(void)didAddView:(UIView*)superView andSubView:(UIView*)subView;


+(void)willMoveView:(UIView*)superView andSubView:(UIView*)subView;

+(void)didMoveView:(UIView*)superView andSubView:(UIView*)subView;

@end


