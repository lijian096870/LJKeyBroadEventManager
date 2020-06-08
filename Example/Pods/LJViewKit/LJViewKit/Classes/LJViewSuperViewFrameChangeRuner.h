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

+ (void)addSubView:(UIView *)view AndBeAddView:(UIView *)beAddView;

@end
