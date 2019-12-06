//
//  LJKeyboardToolBar.h
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJKeyboardToolBar;
typedef void (^ KeyboardToolBar)(LJKeyboardToolBar *bar);

@interface LJKeyboardToolBar : UIToolbar

- (instancetype)initWithFrame   :(CGRect)frame
                leftBtnBlock    :(KeyboardToolBar)leftblock
                rightBtnBlock   :(KeyboardToolBar)rightblock
                doneBtnBlock    :(KeyboardToolBar)doneBlock;

@property (nonatomic, strong) UIButton  *leftbtn;
@property (nonatomic, strong) UIButton  *rightbtn;
@property (nonatomic, strong) UIButton  *donebtn;

@end
