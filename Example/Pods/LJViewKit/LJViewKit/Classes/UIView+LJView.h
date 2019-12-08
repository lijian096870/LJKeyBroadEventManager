//
//  UIView+LJView.h
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJViewModel.h"

@interface UIView (LJView)

- (LJViewModel *)viewFrameChangeMoveWindowChangeModel;

- (LJViewModel *)viewFrameChangeMoveWindowChangeModelMayBenil;

@end
