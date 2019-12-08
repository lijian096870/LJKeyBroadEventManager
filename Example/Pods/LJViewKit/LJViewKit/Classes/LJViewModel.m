//
//  UIView+LJView.m
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJViewModel.h"

@interface LJViewModel ()

@property(nonatomic, weak) UIView *view;

@property(nonatomic,strong)NSMutableDictionary *willChangeDictionary;
@property(nonatomic,strong)NSMutableDictionary *didChangeDictionary;
@property(nonatomic,strong)NSMutableDictionary *willAddDictionary;
@property(nonatomic,strong)NSMutableDictionary *didAddDictionary;
@property(nonatomic,strong)NSMutableDictionary *willMoveDictionary;
@property(nonatomic,strong)NSMutableDictionary *didMoveDictionary;


@property(nonatomic,strong)NSMutableDictionary *superWillChangeDictionary;
@property(nonatomic,strong)NSMutableDictionary *superDidChangeDictionary;


@property(nonatomic, strong) NSMutableArray     *willChangeArray;
@property(nonatomic, strong) NSMutableArray     *didChangeArray;
@property(nonatomic, strong) NSMutableArray     *willMoveArray;
@property(nonatomic, strong) NSMutableArray     *didMoveArray;
@property(nonatomic, strong) NSMutableArray     *willAddArray;
@property(nonatomic, strong) NSMutableArray     *didAddArray;


@property(nonatomic, strong) NSMutableArray     *superWillChangeArray;
@property(nonatomic, strong) NSMutableArray     *superDidChangeArray;


@property(nonatomic, strong)NSMutableArray      *AddSubViewArray;
@property(nonatomic, strong)NSMutableDictionary      *AddSubViewDictionary;
@end

@implementation LJViewModel


-(void)SetViewAddSubViewBlock:(viewAddSubView)block{
    
    self.addSubViewBlock = block;
    
}

-(void)AddViewAddSubViewBlock:(viewAddSubView)block{
    
    if(block){
        [self.AddSubViewArray addObject:block];
    }
    
}

-(void)AddViewAddSubViewKeyBlock:(viewAddSubView)block AndKey:(NSString*)key{
    
    if([key isKindOfClass:NSString.class]&&key.length>0){
        if(block){
            
            [self.AddSubViewDictionary setObject:block forKey:key];
            
        }
        
    }else{
        [self AddViewAddSubViewBlock:block];
    }
    
}

- (void)SetSuperViewFrameWillChangeBlock:(viewSuperFrameChangeBlock)block{
    if(block){
        self.superWillChangeBlock = block;
    }
    
}
- (void)AddSuperViewFrameWillChangeBlock:(viewSuperFrameChangeBlock)block{
    if(block){
        [self.superWillChangeArray addObject:block];
    }
    
}
- (void)AddSuperViewFrameWillChangeKeyBlock:(viewSuperFrameChangeBlock)block AndKey:(NSString*)key{
    
    if([key isKindOfClass:NSString.class]&&key.length>0){
        if(block){
            
            [self.superWillChangeDictionary setObject:block forKey:key];
            
        }
        
    }else{
        [self AddSuperViewFrameWillChangeBlock:block];
    }
    
}
- (void)SetSuperViewFrameDidChangeBlock:(viewSuperFrameChangeBlock)block{
    
    self.superDidChangeBlock = block;
    
}
- (void)AddSuperViewFrameDidChangeBlock:(viewSuperFrameChangeBlock)block{
    if(block){
        
        [self.superDidChangeArray addObject:block];
    }
    
}
- (void)AddSuperViewFrameDidChangeKeyBlock:(viewSuperFrameChangeBlock)block AndKey:(NSString*)key{
    
    if([key isKindOfClass:NSString.class]&&key.length>0){
        if(block){
            
            [self.superDidChangeDictionary setObject:block forKey:key];
            
        }
        
    }else{
        [self AddSuperViewFrameDidChangeBlock:block];
    }
    
}

-(NSArray*)_viewAddSubViewArray{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.AddSubViewArray];
    
    if(self.AddSubViewDictionary.count>0){
        
        [array addObjectsFromArray:self.AddSubViewDictionary.allValues];
        
    }
    return array;
    
}

-(NSArray*)_superWillChangeArray{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.superWillChangeArray];
    
    if(self.willChangeDictionary.count>0){
        
        [array addObjectsFromArray:self.superWillChangeDictionary.allValues];
        
    }
    return array;
    
    
}

-(NSArray*)_superDidChangeArray{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.superDidChangeArray];
    
    if(self.willChangeDictionary.count>0){
        
        [array addObjectsFromArray:self.superDidChangeDictionary.allValues];
        
    }
    return array;
    
    
}
-(NSArray*)_willChangeArray{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.willChangeArray];
    
    if(self.willChangeDictionary.count>0){
        
        [array addObjectsFromArray:self.willChangeDictionary.allValues];
        
    }
    return array;
    
}

-(NSArray*)_didChangeArray{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.didChangeArray];
    if(self.didChangeDictionary.count>0){
        
        [array addObjectsFromArray:self.didChangeDictionary.allValues];
        
    }
    return array;
}

-(NSArray*)_willAddArray{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.willAddArray];
    if(self.willAddDictionary.count>0){
        
        [array addObjectsFromArray:self.willAddDictionary.allValues];
        
    }
    return array;
    
}
-(NSArray*)_didAddArray{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.didAddArray];
    
    if(self.didAddDictionary.count>0){
        
        [array addObjectsFromArray:self.didAddDictionary.allValues];
        
    }
    return array;
}

-(NSArray*)_willMoveArray{
    
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.willMoveArray];
    
    if(self.willMoveDictionary.count>0){
        
        [array addObjectsFromArray:self.willMoveDictionary.allValues];
        
    }
    return array;
    
}
-(NSArray*)_didMoveArray{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.didMoveArray];
    
    if(self.didMoveDictionary.count>0){
        
        [array addObjectsFromArray:self.didMoveDictionary.allValues];
        
    }
    return array;
    
}
- (void)AddWindowDidAddKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString*)key{
    if([key isKindOfClass:NSString.class]&&key.length>0){
        if(block){
            
            [self.didAddDictionary setObject:block forKey:key];
            
        }
    }else{
        [self AddWindowDidAddBlock:block];
    }
    
}
- (void)AddWindowDidMoveKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString*)key{
    
    if([key isKindOfClass:NSString.class]&&key.length>0){
        if(block){
            
            [self.didMoveDictionary setObject:block forKey:key];
            
        }
        
    }else{
        [self AddWindowDidMoveBlock:block];
    }
    
}
- (void)AddWindowWillAddKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString*)key{
    
    if([key isKindOfClass:NSString.class]&&key.length>0){
        if(block){
            
            [self.willAddDictionary setObject:block forKey:key];
        }
        
    }else{
        [self AddWindowWillAddBlock:block];
    }
    
}
- (void)AddWindowWillMoveKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString*)key{
    
    if([key isKindOfClass:NSString.class]&&key.length>0){
        if(block){
            
            [self.willMoveDictionary setObject:block forKey:key];
        }
        
    }else{
        [self AddWindowWillMoveBlock:block];
    }
    
}
- (void)AddFrameDidChangeKeyBlock:(viewFrameChangeBlock)block AndKey:(NSString*)key{
    
    if([key isKindOfClass:NSString.class]&&key.length>0){
        if(block){
            [self.didChangeDictionary setObject:block forKey:key];
        }
        
    }else{
        [self AddFrameDidChangeBlock:block];
    }
    
}
- (void)AddFrameWillChangeKeyBlock:(viewFrameChangeBlock)block AndKey:(NSString*)key{
    
    if([key isKindOfClass:NSString.class]&&key.length>0){
        if(block){
            [self.willChangeDictionary setObject:block forKey:key];
        }
        
    }else{
        [self AddFrameWillChangeBlock:block];
    }
    
}


- (void)SetFrameWillChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        self.willChangeBlock = block;
    }
}

- (void)AddFrameWillChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        
        [self.willChangeArray addObject:block];
    }
}

- (void)SetFrameDidChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        self.didChangeBlock = block;
    }
}

- (void)AddFrameDidChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        [self.didChangeArray addObject:block];
    }
}

- (void)SetWindowWillMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        self.willMoveBlock = block;
    }
    
}

- (void)AddWindowWillMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        [self.willMoveArray addObject:block];
    }
    
}

- (void)SetWindowDidMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        self.didMoveBlock = block;
    }
    
}

- (void)AddWindowDidMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        [self.didMoveArray addObject:block];
    }
    
}

- (void)SetWindowWillAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        self.willAddBlock = block;
    }
    
}

- (void)AddWindowWillAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        [self.willAddArray addObject:block];
    }
    
}

- (void)SetWindowDidAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        self.didAddBlock = block;
    }
    
}

- (void)AddWindowDidAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        
        [self.didAddArray addObject:block];
    }
    
}

- (instancetype)initWithView:(UIView *)view AndWindow:(UIWindow *)window
{
    self = [super init];
    
    if (self) {
        self.view = view;
        self.style = LJViewModelNone;
        
    }
    
    return self;
}

- (NSMutableArray *)willChangeArray {
    if (_willChangeArray == nil) {
        _willChangeArray = [NSMutableArray array];
    }
    
    return _willChangeArray;
}

- (NSMutableArray *)didChangeArray {
    if (_didChangeArray == nil) {
        _didChangeArray = [NSMutableArray array];
    }
    
    return _didChangeArray;
}

- (NSMutableArray *)didMoveArray {
    if (_didMoveArray == nil) {
        _didMoveArray = [NSMutableArray array];
    }
    
    return _didMoveArray;
}

- (NSMutableArray *)willMoveArray {
    if (_willMoveArray == nil) {
        _willMoveArray = [NSMutableArray array];
    }
    
    return _willMoveArray;
}

- (NSMutableArray *)willAddArray {
    if (_willAddArray == nil) {
        _willAddArray = [NSMutableArray array];
    }
    
    return _willAddArray;
}

- (NSMutableArray *)didAddArray {
    if (_didAddArray == nil) {
        _didAddArray = [NSMutableArray array];
    }
    
    return _didAddArray;
}

-(NSMutableDictionary*)willChangeDictionary{
    
    if(_willChangeDictionary==nil){
        _willChangeDictionary = [NSMutableDictionary dictionary];
    }
    return _willChangeDictionary;
    
}

-(NSMutableDictionary*)didChangeDictionary{
    
    if(_didChangeDictionary==nil){
        _didChangeDictionary = [NSMutableDictionary dictionary];
    }
    return _didChangeDictionary;
    
}

-(NSMutableDictionary*)willAddDictionary{
    
    if(_willAddDictionary==nil){
        _willAddDictionary = [NSMutableDictionary dictionary];
    }
    return _willAddDictionary;
    
}
-(NSMutableDictionary*)didAddDictionary{
    
    if(_didAddDictionary==nil){
        _didAddDictionary = [NSMutableDictionary dictionary];
    }
    return _didAddDictionary;
    
}
-(NSMutableDictionary*)willMoveDictionary{
    
    if(_willMoveDictionary==nil){
        _willMoveDictionary = [NSMutableDictionary dictionary];
    }
    return _willMoveDictionary;
    
}

-(NSMutableDictionary*)didMoveDictionary{
    
    if(_didMoveDictionary==nil){
        _didMoveDictionary = [NSMutableDictionary dictionary];
    }
    return _didMoveDictionary;
    
}
-(NSMutableDictionary*)superDidChangeDictionary{
    
    if(_superDidChangeDictionary==nil){
        _superDidChangeDictionary = [NSMutableDictionary dictionary];
    }
    return _superDidChangeDictionary;
    
    
}

-(NSMutableDictionary*)superWillChangeDictionary{
    
    if(_superWillChangeDictionary==nil){
        _superWillChangeDictionary = [NSMutableDictionary dictionary];
    }
    return _superWillChangeDictionary;
    
}


-(NSMutableArray*)superDidChangeArray{
    
    if(_superDidChangeArray==nil){
        _superDidChangeArray = [NSMutableArray array];
    }
    return _superDidChangeArray;
    
}

-(NSMutableArray*)superWillChangeArray{
    
    if(_superWillChangeArray==nil){
        _superWillChangeArray = [NSMutableArray array];
    }
    return _superWillChangeArray;
    
    
}
-(NSMutableArray*)AddSubViewArray{
    
    if(_AddSubViewArray==nil){
        _AddSubViewArray = [NSMutableArray array];
    }
    return _AddSubViewArray;
    
}

-(NSMutableDictionary*)AddSubViewDictionary{
    
    
    if(_AddSubViewDictionary==nil){
        
        _AddSubViewDictionary = [NSMutableDictionary dictionary];
    }
    return _AddSubViewDictionary;
}

@end
