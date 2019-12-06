//
//  KeyBroadRandString.m
//  LJKeyBroadEventManager
//
//  Created by 李健 on 2019/6/15.
//  Copyright © 2019 李健. All rights reserved.
//

#import "KeyBroadRandString.h"

@implementation KeyBroadRandString

+ (NSString *)randomStringNameWithLength:(int)length
{
    return [[self class] randomStringWithCharctersFromString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" andLength:length];
}

+ (NSString *)randomStringWithCharctersFromString:(NSString *)charset andLength:(int)length
{
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];

    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [charset characterAtIndex:[[self class] randomIntBetweenMin:0 andMax:(int)[charset length] - 1]]];
    }

    return randomString;
}

+ (int)randomIntBetweenMin:(int)min andMax:(int)max
{
    if (min == max) {
        return min;
    }

    int realMin = MIN(min, max);
    int realMax = MAX(min, max);
    int range = realMax - realMin + 1;
    return realMin + arc4random_uniform(range);
}

@end
