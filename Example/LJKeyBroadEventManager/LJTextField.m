//
//  LJTextField.m
//  LJKeyBroadEventManager
//
//  Created by lijian on 2019/11/30.
//  Copyright © 2019 李健. All rights reserved.
//

#import "LJTextField.h"

@interface LJTextField ()

@property(nonatomic,strong)NSString *mess;

@end

@implementation LJTextField



+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    LJTextField *text = [super allocWithZone:zone];
    

    
    
    return text;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@,%@", [super description],self.mess];
}


-(NSString*)mess{
    
    if(_mess==nil){
        _mess = [LJTextField randomStringNameWithLength:12];
    }
    return _mess;
    
}
+ (NSString *) randomStringNameWithLength:(int) length
{
    return [[self class] randomStringWithCharctersFromString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" andLength:length];
}

+ (NSString *) randomStringWithCharctersFromString:(NSString*) charset andLength: (int) length
{
    NSMutableString *randomString = [NSMutableString stringWithCapacity: length];
    for (int i=0; i<length; i++)
    {
        [randomString appendFormat: @"%C", [charset characterAtIndex:[[self class] randomIntBetweenMin:0 andMax:(int)[charset length] - 1]]];
    }
    return randomString;
}

+ (int) randomIntBetweenMin:(int)min andMax:(int)max
{
    if(min == max) return min;
    int realMin = MIN(min, max);
    int realMax = MAX(min, max);
    int range = realMax - realMin + 1;
    return realMin + arc4random_uniform(range);
}
@end
