//
//  LJViewSuperViewFrameChangeRuner.h
//  FBSnapshotTestCase
//
//  Created by lijian on 2019/12/8.
//

#import <UIKit/UIKit.h>

@interface LJViewSuperViewFrameChangeRuner : NSObject

+ (void)viewWillChange:(UIView *)view AndOldFrame:(CGRect)oldframe AndNewFrame:(CGRect)NewFrame;

+ (void)viewDidChange:(UIView *)view AndOldFrame:(CGRect)oldframe AndNewFrame:(CGRect)NewFrame;

+ (void)DidaddSuperView:(UIView *)view AndBeAddView:(UIView *)beAddView;
+ (void)WilladdSuperView:(UIView *)view AndBeAddView:(UIView *)beAddView;

+ (void)DidremovwSuperView:(UIView *)view AndBeRemoveView:(UIView *)beRemove;
+ (void)WillremovwSuperView:(UIView *)view AndBeRemoveView:(UIView *)beRemove;

+ (void)addSubView:(UIView *)view AndBeAddView:(UIView *)beAddView;

@end
