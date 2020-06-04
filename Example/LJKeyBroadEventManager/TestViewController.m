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

#define random(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a) / 255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface TestViewController () <UITableViewDelegate, UITableViewDataSource, LJKeyboardManagerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, assign) CGFloat offsect;

@property(nonatomic, strong) UIView *topView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loop];

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

- (void)NextPage {
    TestTwoViewController *page = [[TestTwoViewController alloc]init];

    [self.navigationController pushViewController:page animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TestTableViewCell.class)];

    cell.textField.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    cell.textField.inputAccessoryView = self.topView;
    return cell;
}
static int indexC = 0;
- (void)loop {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.topView = nil;
        indexC ++ ;
        if(indexC % 5 ==0){
            [[NSNotificationCenter defaultCenter]postNotificationName:@"1234567891" object:nil];
        }else{ 
            [[NSNotificationCenter defaultCenter]postNotificationName:@"1234567891" object:self.topView];
        }
        
        [self loop];
    });
}

- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40.0)];
        _topView.backgroundColor = randomColor;
    }

    return _topView;
}

#pragma LJKeyboardManagerDelegate

- (void)keyBroadOffset:(CGFloat)offset {
    
    if(offset == 0.0){
        NSLog(@"%f",offset);
    }
    
}

- (void)keyBroadOffset:(CGFloat)offset Responder:(UIView *)Responder {}

- (void)keyBroadScrollOffset:(CGFloat)offset Responder:(UIView *)Responder {
    
  
    
    self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, self.tableView.contentOffset.y + offset);
}

- (CGFloat)TopSpacingToFirstResponder:(UIView *)Responder {
    return 5.0;
}

- (BOOL)ShowExtensionToolBar:(UIView *)Responder {
    return NO;
}

@end
