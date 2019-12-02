//
//  LJClassAllocCallback.m
//  LJKeyBroadEventManager
//
//  Created by temp on 2019/11/29.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJClassAllocCallback.h"
#import <objc/runtime.h>
#import "UIView+AllocBack.h"
@interface LJClassAllocCallback ()

@property(nonatomic,strong)NSMutableDictionary *dictionary;

@end

@implementation LJClassAllocCallback

-(void)ReplaceAllocMethod:(Class)calss And:(viewAllocBlock)block{
    
    if(block){
        NSString *mess = NSStringFromClass(calss);
        if(mess.length>0){
            
            [self configBlock];
            
            for (NSString *key in self.dictionary.allKeys) {
                if([key isEqualToString:mess]){
                    NSMutableArray *array = [self.dictionary objectForKey:key];
                    [array addObject:block];
                    return;
                }
            }
            
            NSMutableArray *array = [NSMutableArray array];
            [array addObject:block];
            [self.dictionary setObject:array forKey:mess];
            
            
        }
    }
}


-(void)configBlock{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [UIView configAllocBlock:^(UIView *view) {
            
            for (NSString *key in self.dictionary.allKeys) {
                if([view isKindOfClass:NSClassFromString(key)]){
                    NSMutableArray *array = [self.dictionary objectForKey:key];
                    
                    for (viewAllocBlock block in array) {
                        if(block){
                            block(view);
                        }
                    }
                    
                }
            }
            
        }];
        
    });
}

-(NSMutableDictionary*)dictionary{
    
    if(_dictionary==nil){
        _dictionary = [NSMutableDictionary dictionary];
    }
    return _dictionary;
    
}

static id _instace;
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [super allocWithZone:zone];
    });
    return _instace;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

+ (instancetype)new
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instace;
}
@end
