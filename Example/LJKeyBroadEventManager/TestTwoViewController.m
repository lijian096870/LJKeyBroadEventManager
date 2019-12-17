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
@interface TestTwoViewController () <LJKeyboardManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midle;

@end

@implementation TestTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    registerKeyBroadResponder(self);

    self.navigationItem.hidesBackButton = false;
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(NextPage)];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        PopViewAnimated(self.view.window, [PopView FromeXib], YES, YES, nil, 0.0, ^{}, ^{});

        PopViewAnimated(self.view.window, [PopView FromeXib], YES, YES, nil, 0.0, ^{}, ^{});
    });
}
-(void)NextPage{
    
    TestTwoViewController *page = [[TestTwoViewController alloc]init];
    [self.navigationController pushViewController:page animated:YES];
    
}
#pragma LJKeyboardManagerDelegate

- (void)keyBroadOffset:(CGFloat)offset {}

- (void)keyBroadOffset:(CGFloat)offset Responder:(UIView *)Responder {}

- (void)keyBroadScrollOffset:(CGFloat)offset Responder:(UIView *)Responder {
    
    
    [self.midle setConstant: self.midle.constant - offset];
    
    [self.view layoutIfNeeded];
    
}

- (CGFloat)TopSpacingToFirstResponder:(UIView *)Responder {
    return 20;
}

- (BOOL)ShowExtensionToolBar:(UIView *)Responder {
    return YES;
}

@end
