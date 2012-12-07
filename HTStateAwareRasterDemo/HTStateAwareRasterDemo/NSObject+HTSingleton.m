//
//  NSObject+HTSingleton.m
//  HTStateAwareRasterDemo
//
//  Created by Jacob Jennings on 12/7/12.
//  Copyright (c) 2012 HotelTonight. All rights reserved.
//

#import "NSObject+HTSingleton.h"

@implementation NSObject (HTSingleton)

+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    static id _shared;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

@end
