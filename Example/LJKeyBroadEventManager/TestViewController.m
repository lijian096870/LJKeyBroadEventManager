//
//  TestViewController.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/8/16.
//  Copyright © 2019 李健. All rights reserved.
//

#import "TestViewController.h"
#import "TestTableViewCell.h"
#import "LJKeyBroadEventManager.h"
#import "LJViewKit.h"
#import "LJAlertViewKit.h"
#import "UIView+FromeXib.h"
#import "LJkeyBroadtestView.h"
@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource,LJKeyboardManagerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,assign)CGFloat offsect;

@end

@implementation TestViewController

-(void)setOffsect:(CGFloat)offsect{
    
    
    self.tableView.contentOffset = CGPointMake(0, self.tableView.contentOffset.y + _offsect - offsect);
    _offsect = offsect;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass(TestTableViewCell.class)];

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AddFrameWillChangeBlock(self.view.window, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
           
            NSLog(@"%@,%@",NSStringFromCGRect(oldFrame),NSStringFromCGRect(newFrame));
            
        });
        AddFrameDidChangeBlock(self.view.window, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
           
            NSLog(@"%@,%@",NSStringFromCGRect(oldFrame),NSStringFromCGRect(newFrame));
            
        });
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        LJkeyBroadtestView *alertView = [LJkeyBroadtestView FromeXib];
        PopViewAnimated(self.view.window, alertView, YES, NO, nil, 0.0, nil, nil);
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alertView endEditing:YES];
        });
    });
    
    registerKeyBroadResponder(self);
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 50;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TestTableViewCell.class)];
    cell.textField.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
    
}


# pragma LJKeyboardManagerDelegate

-(void)keyBroadOffset:(CGFloat)offset{
    
    
    
}

-(void)keyBroadOffset:(CGFloat)offset Responder:(UIView *)Responder{
    
}

-(void)keyBroadScrollOffset:(CGFloat)offset Responder:(UIView *)Responder{
    
    
    
    self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x,   self.tableView.contentOffset.y + offset);
    
}
-(CGFloat)TopSpacingToFirstResponder:(UIView*)Responder{
    
    return 0;
}

-(BOOL)ShowExtensionToolBar:(UIView*)Responder{
    
   
    return YES;
    
}
-(BOOL)canBecomeFirstResponder:(UIView *)Responder{
    
    UITextField *text = (UITextField*)Responder;
    if([text.text isEqualToString:@"12"]){
        return NO;
    }
    return true;
    
}

- (void)dealloc
{
    NSLog(@"%@",self);
}

@end
