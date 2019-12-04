//
//  LJKeyboardToolBar.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJKeyboardToolBar.h"

@interface LJKeyboardToolBar ()

@property(nonatomic,copy)KeyboardToolBar leftBtnBlock;
@property(nonatomic,copy)KeyboardToolBar rightBtnBlock;
@property(nonatomic,copy)KeyboardToolBar doneBtnBlock;
@end

@implementation LJKeyboardToolBar

-(UIButton*)MadeButton:(NSString*)ImageName{
    
    
    UIButton * button;
    
    @autoreleasepool {
        
        
        UIImage * icon = [UIImage imageWithContentsOfFile:ImageName];
        
        
        CGSize size = CGSizeMake(35, 35);
        
        CGSize iconSize = CGSizeMake((icon.size.width / icon.size.height)*20.0, 20.0);
        
        
        UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
        
        CGRect iconFrame = CGRectMake((size.width - iconSize.width) / 2.0,
                                      (size.height - iconSize.height) / 2.0,
                                      iconSize.width, iconSize.height);
        
        [icon drawInRect:iconFrame];
        
        UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.bounds = CGRectMake(0, 0, 35, 35);
        [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        
    }
    
    
    return button;
}

-(void)configUI{
    
    self.leftbtn = [self MadeButton:[[self.class bundle] pathForResource:@"LJKeyBraodEventManager_left" ofType:@"png"]];
    [self.leftbtn addTarget:self action:@selector(leftArrow) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightbtn = [self MadeButton:[[self.class bundle] pathForResource:@"LJKeyBraodEventManager_right" ofType:@"png"]];
    
    [self.rightbtn addTarget:self action:@selector(rightArrow) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * done = [[UIBarButtonItem alloc]initWithTitle:[self localizedStringForKey:@"Done" value:nil] style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    
    done.tintColor = UIColor.blackColor;
    self.tintColor = UIColor.blackColor;
    
    [super setItems:@[[[UIBarButtonItem alloc]initWithCustomView:self.leftbtn],[[UIBarButtonItem alloc]initWithCustomView:self.rightbtn],[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],done]];
    
    
    
}
- (instancetype)initWithFrame:(CGRect)frame
                 leftBtnBlock:(KeyboardToolBar)leftblock
                rightBtnBlock:(KeyboardToolBar)rightblock
                 doneBtnBlock:(KeyboardToolBar)doneBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftBtnBlock = leftblock;
        self.rightBtnBlock = rightblock;
        self.doneBtnBlock = doneBlock;
        
        
        [self configUI];
        
    }
    return self;
}


-(void)leftArrow{
    
    if(self.leftBtnBlock){
        self.leftBtnBlock(self);
    }
}

-(void)rightArrow{
    
    if(self.rightBtnBlock){
        self.rightBtnBlock(self);
    }
}
-(void)done{
    
    if(self.doneBtnBlock){
        self.doneBtnBlock(self);
    }
    
}

-(NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value
{
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        NSString *lan = [NSLocale preferredLanguages].firstObject;
        
        if ([lan hasPrefix:@"zh-Hans"]) {
            lan = @"zh-Hans";
        } else if ([lan hasPrefix:@"zh-Hant"]) {
            lan = @"zh-Hant";
        } else {
            lan = @"en";
        }
        
        bundle = [NSBundle bundleWithPath:[[self.class bundle] pathForResource:lan ofType:@"lproj"]];
    }
    value = [bundle localizedStringForKey:key value:value table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}
+ (NSBundle*)bundle
{
    static NSBundle *Bundle = nil;
    if (Bundle == nil) {
        Bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:self] pathForResource:@"LJkeyBroadEventManager" ofType:@"bundle"]];
    }
    return Bundle;
}
@end


