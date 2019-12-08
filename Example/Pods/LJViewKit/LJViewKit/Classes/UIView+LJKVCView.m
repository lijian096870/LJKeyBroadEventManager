//
//  UIView+LJKVCView.m
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "UIView+LJKVCView.h"
#import <objc/runtime.h>
#import "LJViewMethodExchangeUtil.h"


#if defined(DEBUG) && !defined(NDEBUG)
#define ol_keywordify autoreleasepool {}
#else
#define ol_keywordify try {} @catch (...) {}
#endif

#define metamacro_concat(A, B)   A ## B

#define weakify(_arg_) \
ol_keywordify \
__weak typeof(_arg_) metamacro_concat(weak, _arg_) = _arg_;


#define strongifyAndReturnIfNil(_arg_) \
ol_keywordify \
__strong typeof(metamacro_concat(weak, _arg_)) _arg_ = metamacro_concat(weak, _arg_);\
if (!_arg_) return



@interface LJViewModel_blockModel : NSObject

@property(nonatomic,copy)viewFrameChangeBlock block;

@end
@implementation LJViewModel_blockModel
@end


@interface LJKVCViewModel : NSObject

@property(nonatomic,copy)viewFrameChangeBlock block;


@property(nonatomic,strong)NSMutableArray<LJViewModel_blockModel *> *blockArray;

@property(nonatomic,assign)BOOL isAddLister;


+(CGRect)getFrame:(NSString*)mess;
-(void)addBlock:(viewFrameChangeBlock)block;

@end

@implementation LJKVCViewModel


-(void)addBlock:(viewFrameChangeBlock)block{
    if(block){
        LJViewModel_blockModel *model=[[LJViewModel_blockModel alloc]init];
        [model setBlock:block];
        [self.blockArray addObject:model];
    }
    
}

-(NSMutableArray<LJViewModel_blockModel *>*)blockArray{
    if(_blockArray==nil){
        _blockArray=[NSMutableArray<LJViewModel_blockModel *> array];
    }
    return _blockArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isAddLister=NO;
    }
    return self;
}


+(CGRect)getFrame:(NSString*)mess{
    CGRect frame=CGRectMake(0, 0, 0, 0);
    NSArray *array=[mess componentsSeparatedByString:@":"];
    if(array.count>1){
        NSString *frameSting=[array objectAtIndex:1];
        NSArray *Onefloat=[frameSting componentsSeparatedByString:@","];
        if(Onefloat.count>3){
            frame.origin.x=[self StringToFloat:[Onefloat objectAtIndex:0]];
            frame.origin.y=[self StringToFloat:[Onefloat objectAtIndex:1]];
            frame.size.width=[self StringToFloat:[Onefloat objectAtIndex:2]];
            frame.size.height=[self StringToFloat:[Onefloat objectAtIndex:3]];
        }
    }
    return frame;
}
+(CGFloat)StringToFloat:(NSString*)str{
    CGFloat result=0.0;
    BOOL lookFor=NO;
    BOOL lookFordot=NO;
    
    CGFloat first = 10.0;
    for (int i=0; i<str.length; i++) {
        char c=[str characterAtIndex:i];
        if(c=='.'&&lookFordot){
            return result;
        }
        if((c<='9'&&c>='0')||c=='.'){
            lookFor=YES;
            if((c<='9'&&c>='0')){
                if(lookFordot){
                    result=result+((c-'0')*1.0)/(first*1.0);
                    
                    first=first*10;
                }else{
                    result =result*10+(c-'0');
                }
            }else{
                lookFordot=YES;
                first=10.0;
                
            }
            
        }else{
            if(lookFor){
                return result;
            }
        }
    }
    return result;
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    @synchronized (self) {
        if([keyPath isEqualToString:@"frame"]){
        
            CGRect oldRect=[[self class] getFrame:[NSString stringWithFormat:@"%@",[change objectForKey:@"old"]]];
            CGRect newRect=[[self class] getFrame:[NSString stringWithFormat:@"%@",[change objectForKey:@"new"]]];
            if(CGRectEqualToRect(oldRect, newRect)){
                
            }else{
                if(self.block){
                    self.block(nil,CGRectMake(oldRect.origin.x, oldRect.origin.y, oldRect.size.width, oldRect.size.height),CGRectMake(newRect.origin.x, newRect.origin.y, newRect.size.width, newRect.size.height));
                }
                for (int i=0; i<self.blockArray.count; i++) {
                    LJViewModel_blockModel *model=[self.blockArray objectAtIndex:i];
                    if([model isKindOfClass:[LJViewModel_blockModel class]]&&model.block){
                        model.block(nil,CGRectMake(oldRect.origin.x, oldRect.origin.y, oldRect.size.width, oldRect.size.height),CGRectMake(newRect.origin.x, newRect.origin.y, newRect.size.width, newRect.size.height));
                    }
                }
            }
            
           
        }
    }
}

@end

@interface UIView ()
@property(nonatomic,weak,readonly)LJKVCViewModel *viewModel_content;
@end

@implementation UIView (LJKVCView)


-(void)addFrameChangeBlock:(viewFrameChangeBlock)block{
    if(block){
        @weakify(self);
        [[self viewModel_content] addBlock:^(UIView *view, CGRect oldFrame, CGRect newFrame) {
            @strongifyAndReturnIfNil(self);
            if(block){
                block(self,oldFrame,newFrame);
            }
        }];
    }
    [self addLister_block];
    
}
-(void)setFrameChangeBlock:(viewFrameChangeBlock)block{
      @weakify(self);
    [[self viewModel_content] setBlock:^(UIView *view, CGRect oldFrame, CGRect newFrame) {
        @strongifyAndReturnIfNil(self);
        if(block){
            block(self,oldFrame,newFrame);
        }
    }];
    [self addLister_block];
}

-(void)addLister_block{
    
    if([self viewModel_content].isAddLister){
        
    }else{
        [self viewModel_content].isAddLister=YES;
        [self addObserver:[self viewModel_content] forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        [self viewModel_content].isAddLister=YES;
        
    }
    [LJViewMethodExchangeUtil methodViewDelloc_MethodExchang];
}

- (LJKVCViewModel *)viewModel_content
{
    id obj=objc_getAssociatedObject(self, @selector(viewModel_content));
    if(obj==nil){
        LJKVCViewModel *Model=[[LJKVCViewModel alloc]init];
        [self setViewModel_content:Model];
        return Model;
    }else{
        return obj;
    }
}
- (void)setViewModel_content:( LJKVCViewModel*)viewModel_content
{
    objc_setAssociatedObject(self, @selector(viewModel_content), viewModel_content, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}




-(NSMutableArray*)SubClass_content:(Class)className and:(NSMutableArray*)array{
    for (UIView *view in self.subviews) {
        if([view isKindOfClass:className]){
            [array addObject:view];
        }
    }
    return array;
    
}

-(NSMutableArray*)SubAllClass_content:(Class)className and:(NSMutableArray*)array{
    for (UIView *view in self.subviews) {
        if([view isKindOfClass:className]){
            [array addObject:view];
        }
        [view SubAllClass_content:className and:array];
    }
    return array;
    
}



-(void)dealloc_content{
    if([self viewModel_content].isAddLister){
         [self removeObserver:[self viewModel_content] forKeyPath:@"frame"];
    }
    [[self viewModel_content]setBlock:nil];
    [[self viewModel_content].blockArray removeAllObjects];
    [[self viewModel_content] setBlockArray:nil];
    [self dealloc_content];
}

@end
