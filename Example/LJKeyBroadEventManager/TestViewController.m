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
#import "TestTwoViewController.h"
@interface TestViewController () <UITableViewDelegate, UITableViewDataSource, LJKeyboardManagerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, assign) CGFloat offsect;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    

    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
       self.automaticallyAdjustsScrollViewInsets = NO;
    }
   
    
    
    self.navigationItem.hidesBackButton = false;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(NextPage)];
    
    registerKeyBroadResponder(self);

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass(TestTableViewCell.class)];
}

-(void)NextPage{
    
    TestTwoViewController *page = [[TestTwoViewController alloc]init];
    [self.navigationController pushViewController:page animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TestTableViewCell.class)];

    cell.textField.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}

#pragma LJKeyboardManagerDelegate

- (void)keyBroadOffset:(CGFloat)offset {}

- (void)keyBroadOffset:(CGFloat)offset Responder:(UIView *)Responder {}

- (void)keyBroadScrollOffset:(CGFloat)offset Responder:(UIView *)Responder {
    self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, self.tableView.contentOffset.y + offset);
}

- (CGFloat)TopSpacingToFirstResponder:(UIView *)Responder {
    return 5.0;
}

- (BOOL)ShowExtensionToolBar:(UIView *)Responder {
    return YES;
}

@end
