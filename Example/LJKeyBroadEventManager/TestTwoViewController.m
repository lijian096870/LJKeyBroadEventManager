//
//  TestTwoViewController.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/12/17.
//  Copyright © 2019 李健. All rights reserved.
//

#import "TestTwoViewController.h"
#import "LJKeyBroadEventManager.h"
#import "PopView.h"
#import "LJAlertViewKit.h"
#import "UIView+FromeXib.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a) / 255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface TestTwoViewController () <LJKeyboardManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextView         *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midle;
@property(nonatomic, strong) UIView                     *topView;

@property(nonatomic, assign) NSInteger index;

@end

@implementation TestTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    registerKeyBroadResponder(self);

    self.index = indexC;

    indexC++;

    [self loop];

    self.navigationItem.hidesBackButton = false;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(NextPage)];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        PopViewAnimated(self.view.window, [PopView FromeXib], YES, YES, nil, 0.0, ^{}, ^{});
    });
}

- (void)NextPage {
    TestTwoViewController *page = [[TestTwoViewController alloc]init];

    [self.navigationController pushViewController:page animated:YES];
}

static int indexC = 0;
- (void)loop {
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        self.topView = nil;
    //        indexC ++ ;
    //        if(indexC % 5 ==0){
    //            self.textView.inputAccessoryView = nil;
    //        }else{
    //            self.topView = nil;
    //            self.textView.inputAccessoryView = self.topView;
    //        }
    //
    //        [self loop];
    //    });
}

- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40.0)];
        _topView.backgroundColor = randomColor;
    }

    return _topView;
}

#pragma LJKeyboardManagerDelegate

- (void)keyBroadOffset:(CGFloat)offset {}

- (void)keyBroadOffset:(CGFloat)offset Responder:(UIView *)Responder {}

- (void)keyBroadScrollOffset:(CGFloat)offset Responder:(UIView *)Responder {
   
    [self.midle setConstant:self.midle.constant - offset];

    [self.view layoutIfNeeded];
}

- (CGFloat)TopSpacingToFirstResponder:(UIView *)Responder {
    return 20;
}

- (BOOL)ShowExtensionToolBar:(UIView *)Responder {
    return YES;
}

@end
